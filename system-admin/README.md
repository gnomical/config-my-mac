### [config-my-mac](../../../) / <!-- omit in toc -->
## System Admin

### Table of Contents <!-- omit in toc -->
- [Automated Config](#automated-config)
- [Manual Documentation](#manual-documentation)
  - [Finder](#finder)
  - [rsync](#rsync)

# Automated Config
All of the manual configuration documented below has been distilled into a script housed within this repo.

<details>
<summary>Expand For Script Details</summary>

## How to use the script <!-- omit in toc -->
The script for the system-admin group of configs can be found at `./system-admin/config_my_mac.zsh`. To make all of the changes in an automated fashion please follow these instructions.

First, pull this repo to your local machine. Just as I describe in the developer [README](../developer#os-), I recommend cloning this to `~/Code`
```bash
% cd ~/Code
% git clone https://github.com/gnomical/config-my-mac.git
```
Running git for the first time may prompt you to install `Command Line Developer Tools`, just follow the prompts.

Next, run the script. It will install and/or upgrade brew and then run through all the configs documented within this section.
```bash
% cd ~/Code/config-my-mac
% ./system-admin/config_my_mac.zsh
```
## CLI Options  <!-- omit in toc -->
| flag          | summary                                 |
| :------------ | :-------------------------------------- |
| -e, --exclude | comma separated list of modules to skip |
| -i, --include | comma separated list of modules to run  |
> **Note**  
> The presence of includes will cause everything not included to be excluded. Even in the event excludes are also provided.  

> **Warning**  
> If a module that will run requires homebrew then the script will attempt to install and/or update homebrew.  
> To override this behavior exclude brew. `-e brew`
```bash
# Example excluding the finder module
# and because the rsync module will use homebrew
# also specifying to exclude the homebrew update
% ./system-admin/config_my_mac.zsh -e finder,brew
```
  
</details>  

<br/>  

# Manual Documentation
## Finder
By default Finder keeps it simple. No file extensions. But this means if you need to change a file's extension you can't do it without a terminal.

To correct this, open Finder.  
Go to: **Preferences -> Advanced**  
and check
  - [x] Show all filename extensions

Now for more useful information to be provided by the interface while browsing files I like to enable the following.
  - View > Show Path Bar
  - View > Show Status Bar

And finally, macOS uses a number of files that are hidden from your everyday users. It does this through a simple pattern - any file beginning with a `.` (full stop/period) is hidden and some system directories like `~/Library` and `~/Trash` are also hidden. A common encounter with hidden files has always been the `.DS_Store` files. 

> **Warning**  
> .DS_Store files are no longer visible in the finder even after enabling hidden file visibility, starting with macOS Monterey.  

Hidden files are frequently discovered after copying files to another, non macOS system. Many applications utilize this hidden file feature to store meta data and preferences. To make sure you can always see these files you must run a Terminal command.
```bash
% defaults write com.apple.finder AppleShowAllFiles -bool true
```

For security purposes, it is sometimes recommended to remove the .DS_Store files completely (they can expose information in rare situations). In order to make sure macOS does not automatically create any more of them you can run another Terminal command.
```bash
% defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
```
> **Note**  
> Disabling .DS_Store files will prevent finder from remembering how you have visually positioned your files and folders. Upon a reboot, any changes you have made to how you view a particular folder in finder will be lost.

## rsync
> <sup><sub>This module will require **Homebrew** to complete</sub></sup>

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
> **Note**  
> Terminal will need to be restarted before it will execute the new binary.