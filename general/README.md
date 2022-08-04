### [config-my-mac](../) / <!-- omit in toc -->
## General (All Use Cases) <!-- omit in toc -->

These are my preferences regardless of what the device will be used for. At the OS level they lay the foundation for ease of use in the topics of eye strain, screen real estate, and touch accessibility. At the application level they set you up for validating machine performance, establishing communication capabilities and security best practices.

### Table of Contents <!-- omit in toc -->
- [Operating System](#operating-system)
  - [Appearance](#appearance)
  - [Dock](#dock)
  - [Trackpad](#trackpad)
- [Software](#software)
  - [Pre-Installed](#pre-installed)
    - [Screenshots](#screenshots)
    - [Bloat](#bloat)
  - [Third Party](#third-party)
    - [Geekbench](#geekbench)
    - [Bitwarden](#bitwarden)
    - [Signal](#signal)
    - [Proton Mail](#proton-mail)

# Operating System

## Appearance
Eye strain can be reduced by viewing high contrast content as opposed to low contrast.[<sup>1</sup>](https://www.webmd.com/eye-health/prevent-digital-eyestrain) Sleep can be affected by blue light late in the day.[<sup>2</sup>](https://www.health.harvard.edu/staying-healthy/blue-light-has-a-dark-side) I find that dark themes tend to provide higher contrast and reduce the amount of light emitted (thusly blue light) - not to mention stretch your battery life a bit.  

Go to: **System Preferences -> General**  
and set the following:
- Appearance: Dark

## Dock
The dock is one of those things that seems to be abused by Apple out of the box. It comes overloaded with bloatware, occupies a good percentage of the screen height, and can quickly become more of a drawback than an asset. These tweaks will keep the Dock out of your way until you need it.

Go to: **System Preferences -> Dock & Menu Bar**  
and set the following:  
- Size: (about 20%, same size as apple icon in menu bar)
- Position on screen: left
- check
  - [x] Automatically hide and show the dock
- uncheck
  - [ ] Show recent applications in Dock
- Remove all icons from dock except:  
  Finder, Settings, Downloads, Trash

> **Note**:  
> Subsequent configs may fill the dock with other apps

> 💡 **Tip**:  
> For fast access to apps sans the dock you can either open launchpad (4 finger pinch on a trackpad) or you can use my favorite, **⌘ Space**, to launch spotlight search.

## Trackpad
Pointer options can be very personal, but these are the settings I prefer for productivity.

Go to: **System Preferences -> Trackpad -> Point & Click**  
and set the following:
  - check
    - [x] Tap to click
  - Click: Light
  - Tracking Speed: one notch below fast

# Software

## Pre-Installed

### Screenshots
MacOS has a built in tool for capturing screen content called *Screenshot*. I frequently take clips of my screen to include in things like documentation, emails, and direct messages to quickly show a colleague or friend some content. You can take a screenshot by pressing the key combination **⇧⌘4** and then clicking to drag around the area you want to snip. By default Keep screenshots from cluttering your desktop by creating a folder for them
  - Press **⇧⌘5** then under options > Save To > Other Location
  - Create a new folder:  
    `~/Documents/Screenshots`

### Bloat
Removing most of these items from the dock earlier was just the beginning. Let's see what we can do about its presence everywhere else.  

Launch Finder and navigate to `Applications`. Uninstall the following by dragging their icons to the trash.
- iMovie
- GarageBand

There are also several pre-installed applications that cannot be trashed because they are essential to built in OS functions. So that they don't distract us and to make Launchpad easier to navigate, let's put them in a tidy box.

Bring Launchpad up by four finger pinching on the trackpad.  
(Place your thumb in the bottom left and three fingers in the top right)
Drag the following apps on top eachother to auto create a folder much like in iOS. Then rename that folder to `Apple Clutter`.
- Facetime
- Maps
- Messages
- Music
- News
- Podcasts
- Stocks
- TV

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