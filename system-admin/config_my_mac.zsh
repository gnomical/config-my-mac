#!/bin/zsh
emulate -LR zsh # reset zsh options

# path of currently executing script
DIR=${0:a:h}
# import common libraries
source $DIR/../lib/console_codes.zsh
source $DIR/../lib/brew_check.zsh

##################
# Operating System
##################

# Finder
# ------
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

echo -e "${green_f}${bold}Finder${reset}${green_f} has been updated and restarted.${reset}"

# rsync
# -----
echo -e "\nChecking rsync"

# get rsync version
rsync=$(rsync --version)
# check if rsync version matches defualt macOS provided version
if [[ $rsync == *"2.6.9"* ]]; then
    echo -e "Updating rsync for compatability with remote systems."
    # brew install rsync
    echo -e "${red_f}${bold}rsync${reset}${red_f} has not been updated.${reset}"
else 
    echo -e "${yellow_f}${bold}rsync${reset}${yellow_f} has already been modified from the default provided by macOS.${reset}"
fi

# leave space above next terminal prompt for readability
echo -e ""
