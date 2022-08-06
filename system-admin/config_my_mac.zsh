#!/bin/zsh
emulate -LR zsh # reset zsh options

# path of currently executing script
DIR=${0:a:h}
# import common libraries
source $DIR/../lib/console_codes.zsh
source $DIR/../lib/getopts.zsh

# check for homebrew and updates if rsync update will be attempted
if ! should_skip "rsync"; then
    source $DIR/../lib/brew_check.zsh
fi

#########
# Finder
#########
if should_skip "finder"; then
    echo -e "\nSkipping ${bold}Finder${reset} configuration"
else
    echo -e "\nSetting preferences for Finder."

    # Show all filename extensions
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true
    # Show Path Bar
    defaults write com.apple.finder ShowPathbar -bool true
    # Show Status Bar
    defaults write com.apple.finder ShowStatusBar -bool true
    # Show Hidden/(.) Files
    defaults write com.apple.finder AppleShowAllFiles -bool true
    # Disable the creation of .DS_Store files
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
    # Finder must restart for changes to take effect
    killall Finder

    echo "${green_f}${bold}Finder${reset}${green_f} has been updated and restarted.${reset}"
fi

########
# rsync
########
if should_skip "rsync"; then
    echo -e "\nSkipping ${bold}rsync${reset} upgrade"
else
    # check that the include flag was not passed
    # or that 'finder' was provided in its argument
    if [[ ! -v include ]] || echo $include | grep -iqF "finder"; then
        echo -e "\nChecking rsync"

        # get rsync version
        rsync=$(rsync --version)
        # check if rsync version matches defualt macOS provided version
        if [[ $rsync == *"2.6.9"* ]]; then
            echo "Updating rsync for compatability with remote systems."
            brew install rsync
            echo -e "\n${green_f}${bold}rsync${reset}${green_f} has been updated.${reset}"
            echo "Your terminal needs to be restarted before it will execute the new binary."
        else 
            echo -e "${yellow_f}${bold}rsync${reset}${yellow_f} has already been modified from the default provided by macOS.${reset}"
        fi
    else
        echo -e "\nSkipping ${bold}rsync${reset} upgrade"
    fi
fi

# leave space above next terminal prompt for readability
echo ""
