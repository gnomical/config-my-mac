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
# Finder must restart for changes to take effect
killall Finder

echo -e "${bold}Finder${normal} has been updated and restarted."

# rsync
# -----

echo -e ""
