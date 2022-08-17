# How macOS stores launchpad config
# https://fgimian.github.io/blog/2016/12/23/how-macos-stores-launchpad-configuration/
#
# path to launchpad db dir
# $(getconf DARWIN_USER_DIR)/com.apple.dock.launchpad/db

# Types
# -----
# 1 - ROOT
# 2 - FOLDER_ROOT
# 3 - PAGE
# 4 - APP

get_toggle_triggers_sql() {
    echo "UPDATE dbinfo SET value = $1 WHERE key = 'ignore_items_update_triggers';"
}

# if a folder exists return its first page's ID
# if not, create it and return new page ID
get_page_from_folder_name() {
    folderPageID=$(sqlite3 $(getconf DARWIN_USER_DIR)/com.apple.dock.launchpad/db/db "SELECT rowid FROM items WHERE parent_id=(SELECT item_id FROM groups WHERE title='$1') AND type=3;")
    if [ -z "$folderPageID" ]; then 
        folderPageKey=$(new_launchpad_folder "$1")
        folderPageID=$(sqlite3 $(getconf DARWIN_USER_DIR)/com.apple.dock.launchpad/db/db "SELECT value FROM dbinfo WHERE key='$folderPageKey';")
    fi
    echo $folderPageID
}

new_launchpad_folder() {
    FOLDER_UUID=$(uuidgen)
    PAGE_UUID=$(uuidgen)

    sqlite3 $(getconf DARWIN_USER_DIR)/com.apple.dock.launchpad/db/db <<EOF
        /* disable db triggers */
        $(get_toggle_triggers_sql 1)
        
        /* get the rowid of the first page item */
        INSERT INTO dbinfo (key, value) VALUES ('cmm_first_page_id', (SELECT rowid FROM items WHERE parent_id=1 AND ordering=1));

        /* make the folder and save its rowid */
        INSERT INTO items (uuid,flags,type,parent_id) VALUES ('$FOLDER_UUID',0,2,(SELECT value FROM dbinfo WHERE key='cmm_first_page_id'));
        INSERT INTO dbinfo (key, value) VALUES ('cmm_tmp_folder_id', last_insert_rowid());
        INSERT INTO groups (item_id, title) VALUES ((SELECT value FROM dbinfo WHERE key='cmm_tmp_folder_id'), "$1");
        /* make the first page inside the new folder and save its rowid */
        INSERT INTO items (uuid,flags,type,parent_id) VALUES ('$PAGE_UUID',2,3,(SELECT value FROM dbinfo WHERE key='cmm_tmp_folder_id'));
        INSERT INTO dbinfo (key, value) VALUES ('cmm_$PAGE_UUID', last_insert_rowid());
        INSERT INTO groups (item_id) VALUES ((SELECT value FROM dbinfo WHERE key='cmm_$PAGE_UUID'));

        /* cleanup temp variables */
        DELETE FROM dbinfo WHERE key in ('cmm_first_page_id','cmm_tmp_folder_id');

        /* re-enable triggers */
        $(get_toggle_triggers_sql 0)
EOF

    # return the cached page id
    echo "cmm_$PAGE_UUID"
}

# util for rendering array as comma separated strings
# usage: join_by "','" $array
# the output will need to be wrapped by single quotes
function join_by {
  local d=${1-} f=${2-}
  if shift 2; then
    printf %s "$f" "${@/#/$d}"
  fi
}

move_apps_to_folder() {
    local -n appsArray=$1
    pageID=$2

    echo $appsArray
    exit 1

    reorderSQL=''
    for ((i = 1; i <= $#appsArray; i++)); do
        order=$i+1
        reorderSQL+="UPDATE items SET ordering=$order WHERE rowid=(SELECT item_id FROM apps WHERE title='${appsArray[$i]}');"
    done

    echo "WHERE rowid in (SELECT item_id FROM apps WHERE title in ('$(join_by "','" ${appsArray[@]})'));"
    exit 1
    sqlite3 $(getconf DARWIN_USER_DIR)/com.apple.dock.launchpad/db/db <<EOF
        /* disable db triggers */
        $(get_toggle_triggers_sql 1)

        /* move app onto page */
        UPDATE items SET parent_id=$pageID 
        WHERE rowid in (SELECT item_id FROM apps WHERE title in ('$(join_by "','" ${appsArray[@]})'));
        /* set the app order within the new folder - as provided */
        $reorderSQL

        /* re-enable triggers */
        $(get_toggle_triggers_sql 0)
EOF
}