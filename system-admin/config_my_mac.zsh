#!/bin/zsh
emulate -LR zsh # reset zsh options

# prepare homebrew for use
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi

##################
# Operating System
##################

# Finder
# ------

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

# rsync
# -----