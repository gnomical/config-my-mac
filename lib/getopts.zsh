# check for console codes
if [[ ! -v red_f ]] ; then
    echo -e "\nERROR: import requires dependency"
    echo -e "getopts.zsh requires console_codes.zsh be imported first\n";
    exit
fi

# process flags
while getopts i:e:f flag
do
    case "${flag}" in
        i) include=${OPTARG};;
        e) exclude=${OPTARG};;
        f) force=true;;
        *) 
            echo "${red_f}${bold}ERROR${reset}${red_f}: Available flags are${reset}"
            echo "       [-i, --include] comma separated list of modules to run";
            echo "       [-e, --exclude] comma separated list of modules to skip";
            echo -e "       [-f, --force]   flag to force script run without human input\n";
            exit;;
    esac
done