### [config-my-mac](../../../) / <!-- omit in toc -->
## System Admin

### Table of Contents <!-- omit in toc -->
- [Automated Config](#automated-config)
- [Operating System](#operating-system)
  - [Finder](#finder)
  - [rsync](#rsync)

# Automated Config
All of the manual configuration documented below has been distilled into a script housed within this repo at `./system-admin/config_my_mac.zsh`. To make all of the changes in an automated fashion please follow these instructions.

First, pull this repo to your local machine. Just as I describe in the [developer README](../developer#os-), I recommend cloning this to `~/Code`
```bash
% cd ~/Code
% git clone https://github.com/gnomical/config-my-mac.git
```
Running git for the first time may prompt you to install `Command Line Developer Tools`, just follow the prompts.

Next, run the script. It will install and/or upgrade brew and then run through all the configs documented in this **system-admin** section.
```bash
% cd ~/Code/config-my-mac
% ./system-admin/config_my_mac.zsh
```

# Operating System
## Finder
By default Finder keeps it simple. No file extensions. But this means if you need to change a file's extension you can't do it without a terminal.

To correct this, open Finder.  
Go to: **Preferences -> Advanced**  
and check
  - [x] Show all filename extensions

Now for more useful information to be provided by the interface while browsing files I like to enable the following.
  - View > Show Path Bar
  - View > Show Status Bar

And finally, macOS uses a number of files that are hidden from your everyday users. It does this through a simple pattern - any file beginning with a `.` is hidden. A common encounter is the `.DS_Store` files which contain data about how files are positioned on screen within a folder, among other things. Many applications utilize this hidden file feature to store meta data and preferences. To see these files we must run a terminal command.
```bash
% defaults write com.apple.Finder AppleShowAllFiles true
```

## rsync
In macOS Monterey, Apple provides a custom rsync binary, v2.6.9 (16 years old), that has been modified to support extended attributes. 
```bash
% rsync --version
# rsync  version 2.6.9  protocol version 29
# ..
```
However, rsync v3 has implemented support for extended attributes according to a completely different standard. The version mismatch along with the extended attributes implementations can cause a lot of problems when rsyncing to remote systems. 

To fix this situation it is recommended to install a newer version of rsync via homebrew.
```bash
% brew install rsync
```
You can check the version to confirm the one running is now ^v3.
```bash
% rsync --version
# rsync  version 3.2.4  protocol version 31
# ..
```