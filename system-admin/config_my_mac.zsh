#!/bin/zsh
emulate -LR zsh # reset zsh options

# common linux console_codes
bold=$(tput bold)
normal=$(tput sgr0)

# prepare homebrew for use
if ! command -v brew &> /dev/null ; then
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo -e "\nChecking Homebrew for updates."
    brew update
fi

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