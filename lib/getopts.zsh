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

# helper for identifying if a code block should run based on flags
# (some_string) $1 = the text to match against the -i and -e arguments
should_skip() {
    # check 'some_string' was an argument via the exclude flag
    # OR that the include flag was passed AND 'some_string' was not found in its argument
    echo $exclude | grep -iqF $1 || \
    [[ -v include ]] && ! ( echo $include | grep -iqF $1 )
}