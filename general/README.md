### [config-my-mac](../../../) / <!-- omit in toc -->
## General (All Use Cases) <!-- omit in toc -->

These are my preferences regardless of what the device will be used for. At the OS level they lay the foundation for ease of use in the topics of eye strain, screen real estate, and touch accessibility. At the application level they set you up for validating machine performance, establishing communication capabilities and security best practices.

### Table of Contents <!-- omit in toc -->
- [Automated Config](#automated-config)
- [Operating System](#operating-system)
  - [Theme](#theme)
  - [Dock](#dock)
  - [Trackpad](#trackpad)
- [Software](#software)
  - [Pre-Installed](#pre-installed)
    - [Screenshots](#screenshots)
    - [Bloatware](#bloatware)
  - [Third Party](#third-party)
    - [Geekbench](#geekbench)
    - [Bitwarden](#bitwarden)
    - [Signal](#signal)
    - [Proton Mail](#proton-mail)

# Automated Config
All of the manual configuration documented below has been distilled into a script housed within this repo.

<details>
<summary>Expand For Script Details</summary>

## How to use the script <!-- omit in toc -->
The script for the system-admin group of configs can be found at `./system-admin/config_my_mac`. To make all of the changes in an automated fashion please follow these instructions.

First, pull this repo to your local machine. Just as I describe in the developer [README](../developer#os-), I recommend cloning this to `~/Code`
```bash
% cd ~/Code
% git clone https://github.com/gnomical/config-my-mac.git
```
Running git for the first time may prompt you to install `Command Line Developer Tools`, just follow the prompts.

Next, run the script. It will install and/or upgrade brew and then run through all the configs documented within this section.
```bash
% cd ~/Code/config-my-mac
% ./system-admin/config_my_mac
```
## CLI Options  <!-- omit in toc -->
| flag          | summary                                               |
| :------------ | :---------------------------------------------------- |
| -e, --exclude | comma separated list of modules to skip               |
| -i, --include | comma separated list of modules to run                |
| -f, --force   | when present, will run the script without human input |
> **Note**  
> The presence of includes will cause everything not included to be excluded. Even in the event excludes are also provided.  

> **Warning**  
> If a module that will run requires homebrew then the script will attempt to install and/or update homebrew.  
> To override this behavior exclude brew. `-e brew`
```bash
# Example excluding the proton-mail module
# because the other software modules will use homebrew
# you can also specify to exclude the homebrew update
% ./system-admin/config_my_mac -e proton-mail,brew
```
  
</details>  

<br/> 

# Operating System

## Theme  
![Automation Progress](https://img.shields.io/static/v1?label=Scripted&message=Yes&color=090)

Eye strain can be reduced by viewing high contrast content as opposed to low contrast.[^eye_strain]  Sleep can be affected by blue light late in the day.[^blue_light]  I find that dark themes tend to provide higher contrast and reduce the amount of light emitted (thusly blue light) - not to mention stretch your battery life a bit.  

[^eye_strain]: Computer Eye Strain: How to Prevent Eye Strain From Screen Time  
  Williams  
  https://www.webmd.com/eye-health/prevent-digital-eyestrain  
[^blue_light]: Blue light has a dark side  
  https://www.health.harvard.edu/staying-healthy/blue-light-has-a-dark-side  

Go to: **System Preferences → General**  
and set the following:
- Appearance: Dark

## Dock  
![Automation Progress](https://img.shields.io/static/v1?label=Scripted&message=Yes&color=090)

The dock is one of those things that seems to be abused by Apple out of the box. It comes overloaded with bloatware, occupies a good percentage of the screen height, and can quickly become more of a drawback than an asset. These tweaks will keep the Dock out of your way until you need it.

Go to: **System Preferences → Dock & Menu Bar**  
and set the following:  
- Size: (about 20%, same size as apple icon in menu bar)
- Position on screen: left
- check
  - [x] Automatically hide and show the dock
- uncheck
  - [ ] Show recent applications in Dock
- Remove all icons from dock except:  
  Finder, Settings, Downloads, Trash

> **Note**  
> Subsequent configs may fill the dock with other apps

> 💡 **Tip**  
> For fast access to apps that are not in the dock you can:  
> open launchpad (4 finger pinch on a trackpad) or  
> my favorite, **⌘ Space**, to launch spotlight search.

## Trackpad  
![Automation Progress](https://img.shields.io/static/v1?label=Scripted&message=Yes&color=090)

Pointer options can be very personal, but these are the settings I prefer for productivity.

Go to: **System Preferences → Trackpad → Point & Click**  
and set the following:
  - check
    - [x] Tap to click
  - Click: Light
  - Tracking Speed: one notch below fast

# Software

## Pre-Installed

### Screenshots
![Automation Progress](https://img.shields.io/static/v1?label=Scripted&message=Yes&color=090)

MacOS has a built in tool for capturing screen content called *Screenshot*. I frequently take clips of my screen to include in things like documentation, emails, and direct messages to quickly show a colleague or friend some content. You can take a screenshot by pressing the key combination **⇧⌘4** and then clicking to drag around the area you want to snip. By default Keep screenshots from cluttering your desktop by creating a folder for them
  - Press **⇧⌘5** then under options > Save To > Other Location
  - Create a new folder:  
    `~/Documents/Screenshots`

> **Note**  
> You may use the key combination **⌘^⇧4** to take a screenshot directly to your clipboard. This bypasses saving to disk and can reduce clutter

### Bloatware
![Automation Progress](https://img.shields.io/static/v1?label=Scripted&message=Partial&color=c90)

Removing most of these items from the dock earlier was just the beginning. Let's see what we can do about its presence everywhere else.  
In total, these applications take up a good chunk of disk space (4.24 GB).  For the items we can remove you will see itemized sizes below.  

Launch Finder and navigate to `Applications`. Uninstall the following by dragging their icons to the trash.
- iMovie `2.64 GB`
- GarageBand `1.26 GB`

> **Note**  
> There are several files associated to these applications that can also be safely removed. If you are comfortable with the terminal you can use `mdfind` to track them down.
> ```bash
> # Example
> % mdfind -name "garage band"
> % ...
> ```
> However, all that work has already been done for you in the autmation script included in this repo, `./general/config_my_mac`.

There are also several pre-installed applications that cannot be trashed because they are essential to built in OS functions. So that they don't distract us and to make Launchpad easier to navigate, let's put them in a tidy box.

Bring Launchpad up by four finger pinching on the trackpad.  
(Place your thumb in the bottom left and three fingers in the top right)
Drag the following apps on top eachother to auto create a folder much like in iOS. Then rename that folder to `Apple Clutter`.
- Facetime `15.4 MB`
- Maps `80.2 MB`
- Messages `5.6 MB`
- Music `102.8 MB`
- News `10.8 MB`
- Podcasts `45.2 MB`
- Stocks `4.1 MB`
- TV `77.5 MB`

## Third Party

### Geekbench
  - make sure you didn’t get a lemon
  - Does your score match other uploads for your same machine?

### Bitwarden
> Add to Dock
  - Enable the Safari Extension
      - Safari > Preferences > Extensions > check Bitwarden
  - Use a unique password for every service
  - As of 2022
      - Use 16 characters
      - Upper and lower
      - Numbers
      - Symbols
      - Enable 2fa on every account that you can and opt for OTP where possible
        - Store OTP codes in a separate app on a separate device. Otherwise, if your bitwarden account is compromised you will be SOL.

### Signal
> Add to Dock
  - Secure, End-to-End encrypted messaging
  - Replace iMessage with this and tell your friends to as well

### Proton Mail
> Add to Dock
  - Secure, End-to-End encrypted mail
  - Must use Proton Mail Bridge along with your email client of choice (apple mail, outlook, thunderbird)

# References <!-- omit in toc -->