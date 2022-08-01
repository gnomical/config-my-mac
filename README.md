# config-my-mac <!-- omit in toc -->
Documentation and scripts for quickly configuring a new Mac for various personal and professional use cases.

**Table of Contents**
- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Use Cases](#use-cases)
  - [General (All Use Cases)](#general-all-use-cases)
  - [System Admin](#system-admin)
  - [Developer](#developer)
  - [Web Developer](#web-developer)

#
# Introduction

You might be thinking, “This isn’t my first rodeo. Why do I need scripted configs if I’ve been using computers for 20+ years and can just restore from my last backup?” Being a paranoid skeptic myself, I never trust backups. For one, data corruption is real. Secondly, after a year or two of transient software installs and updates, it’s hard to guarantee things are situated quite the way the developers intended. Lastly, viruses and malware could be sitting dormant anywhere within that backup. As a result of this paranoia, I start each new machine from scratch and reach into my backups sparingly as I progress through whatever workflow was lacking some key piece of data. Often updating my modular repos to include that data for future scripted success.

What you will find below a list of use cases each including a verbose description of configurations and applications grouped by professional vertical. I myself am an IT professional with most of my experience in web application development. However I have also included verticals that pertain to some of my hobbies, like writing and design. It is my intention that these verticals will be augmented by other professionals over time and that this repository can be used as a de facto configuration utility across many environments and professions so as to share tooling knowledge and simplify workflow documentation by creating more workflow commonality amongst our peers.  Some of the categories are intended to stack, for instance system admin -> developer, and will be documented as such. Without further ado, let’s dig into the configurations.

# Prerequisites 

If you will be using the automation scripts to perform any configurations and installs you will need to install the following, first.

**Homebrew**
  - https://brew.sh
  - follow the instructions on their site
      <div style="border:1px solid lightblue;background:rgba(0,127,255,0.2);border-radius:1em;padding:0.75em 1em;margin-bottom:1em;">  
      <b>Note:</b> Don't forget to look for and follow the '<b>Next Steps</b>' in your terminal after brew is installed
      </div>

# Use Cases

## General (All Use Cases)

These configurations and installs are my preferences regardless of what the device will be used for. At the OS level they lay the foundation for ease of use in the topics of eye strain, screen real estate, and touch accessibility. At the application level they set you up for validating machine performance, establishing communication capabilities and security best practices.

### Operating System <!-- omit in toc -->
**General**
  - System Preferences -> General -> Appearance: (Dark)

**Dock**
  - System Preferences -> Dock & Menu Bar
    - Size: (about 20%, same size as apple icon in menu bar)
    - Position on screen: left
    - check
      - [x] Automatically hide and show the dock
    - uncheck
      - [ ] Show recent applications in Dock
  - Remove all icons from dock except:
    - Finder
    - Settings
    - Downloads
    - Trash
      <div style="border:1px solid lightblue;background:rgba(0,127,255,0.2);border-radius:1em;padding:0.75em 1em;margin-bottom:1em;">  
      <b>Note:</b> Subsequent use-case specific configs will fill the dock with other apps
      </div>
      <div style="border:1px solid yellow;background:rgba(255,255,0,0.2);border-radius:1em;padding:0.75em 1em;margin-bottom:1em;">  
      <b>Tip:</b> If you want fast access to apps that aren’t in your dock you can either 4 finger pinch (on a trackpad) to open launchpad or you can use my favorite, <b>⌘ Space</b>, to launch spotlight search
      </div>

**Touchpad**
  - Tap to click: on
  - Click: light
  - Tracking Speed: 2nd from top
  - Accessibility > pointer control > Mouse & Trackpad > Trackpad Options > Enable dragging

**Screenshots**
  - Keep screenshots from cluttering your desktop by creating a folder for them
  - Press ⇧⌘ 5 then under options > Save To > Other Location
  - Create a new folder on your desktop called `Screenshots`

### Software <!-- omit in toc -->
**Geekbench**
  - make sure you didn’t get a lemon
  - Does your score match other uploads for your same machine?

**Bitwarden** (add to dock)
  - Enable the Safari Extension
      - Safari > Preferences > Extensions > check Bitwarden
  - Use a unique password for every service
  - As of 2022
      - Use 16 characters
      - Upper and lower
      - Numbers
      - Symbols
      - Enable 2fa on every account that you can and opt for OTP where possible

**Signal** (add to dock)
  - Secure, End-to-End encrypted messaging
  - Replace iMessage with this and tell your friends to as well

**Proton Mail** (add to dock)
  - Secure, End-to-End encrypted mail
  - Must use Proton Mail Bridge along with your email client of choice (apple mail, outlook, thunderbird)

**Bloat**
  - Uninstall the following
      - iMovie
      - GarageBand
  - Move the following, that can’t be uninstalled, to a folder within launchpad called `Apple Clutter`
      - Facetime
      - Maps
      - Messages
      - Music
      - News
      - Podcasts
      - Stocks
      - TV


## System Admin

### OS <!-- omit in toc -->
**Finder**
  - Preferences > Advanced > Show all filename extensions
  - View > Show Path Bar
  - View > Show Status Bar
  - Show hidden files
      ```bash
      # In Terminal
      defaults write com.apple.Finder AppleShowAllFiles true
      ```

## Developer

### OS <!-- omit in toc -->
**Organization**
  - Create a Code folder in your home directory: `mkdir ~/Code`
  - All of your projects should be placed here. If a particular language, such as go, is picky about folder structure - use this as its root and then create the structure as needed e.g. `~/Code/go/src/example.com`


**git**
  - Config your user name and email
      ```bash
      git config --global user.name "FIRST_NAME LAST_NAME"
      git config --global user.email "MY_NAME@users.noreply.github.com"
      ```
      <div style="border:1px solid lightblue;background:rgba(0,127,255,0.2);border-radius:1em;padding:0.75em 1em;margin-bottom:1em;">  
      <b>Note:</b> In order for gpg signing to work, the configured git username and email must match those set on your gpg key.
      </div>
      <div style="border:1px solid yellow;background:rgba(255,255,0,0.2);border-radius:1em;padding:0.75em 1em;margin-bottom:1em;">  
      <b>Tip:</b> The email you commit with will be visible to people on the internet. For privacy configure something anonymous. <br/><br/>
      Github has a solution to help.<br/>
      See <a href="https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-personal-account-on-github/managing-email-preferences/blocking-command-line-pushes-that-expose-your-personal-email-address">Setting your commit email address</a> on Github.
      </div>

  - SSH key
      - https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
  - GPG key
      ```bash
      brew install gnupg
      ```
    - follow the instructions on your git repo of choice for setting up GPG keys and signing commits
    - Github
      - Generate GPG Key https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key
      - Sign Commits https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits
      - When committing changes in your local branch, add the -S flag to the git commit command:
          ```bash
          $ git commit -S -m "your commit message"
          # Creates a signed commit
          ```
          <div style="border:1px solid yellow;background:rgba(255,255,0,0.2);border-radius:1em;padding:0.75em 1em;margin-bottom:1em;">  
          <b>Tip:</b> To configure your Git client to sign commits by default for a local repository, in Git versions 2.0.0 and above, run <span style="display:inline-block;background:rgba(127,127,127,0.25);border-radius:.25em;padding:0 .25em">git config commit.gpgsign true</span>.
          </div>
  - Command Line Developer Tools
      - Just run a git command, it will auto prompt to install
      ```bash
      # Clone this repo for instance
      git clone https://github.com/gnomical/config-my-mac.git
      ```

### Software <!-- omit in toc -->
**Visual Studio Code** (add to dock)
  - The most widely adopted IDE as of this writing (2022)
  - Huge library of community plugins
  - Configure with high contrast dark theme
      - Preferences > Color Theme (⌘K ⌘T) 
      - then select `Dark High Contrast`
  - Command Line Interface
      - Launch VS Code
      - Open the Command Palette (⇧⌘P) and type 'shell command' to find the `Shell Command: Install 'code' command in PATH` command.
      - https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line

## Web Developer

### Software <!-- omit in toc -->
**Browsers**
  - Install Latest
      - Safari
      - Chrome
      - Edge
      - Firefox
  - Create “Browsers” folder in `~/Applications`
      - Create symlinks to each browser within new folder
      - Place browser folder above downloads folder in dock
