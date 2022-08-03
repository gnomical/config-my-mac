## config-my-mac/ <!-- omit in toc -->
# General (All Use Cases) <!-- omit in toc -->

These configurations and installs are my preferences regardless of what the device will be used for. At the OS level they lay the foundation for ease of use in the topics of eye strain, screen real estate, and touch accessibility. At the application level they set you up for validating machine performance, establishing communication capabilities and security best practices.

- [Appearance](#appearance)
- [Dock](#dock)
- [Touchpad](#touchpad)
  - [📸 Screenshots](#-screenshots)

## Appearance
  - System Preferences -> General -> Appearance: (Dark)

## Dock
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
    > **Note**:  
    > Subsequent use-case specific configs will fill the dock with other apps

    > 💡 **Tip**:  
    > If you want fast access to apps that aren’t in your dock you can either 4 finger pinch (on a trackpad) to open launchpad or you can use my favorite, **⌘ Space**, to launch spotlight search

## Touchpad
  - Tap to click: on
  - Click: light
  - Tracking Speed: 2nd from top
  - Accessibility > pointer control > Mouse & Trackpad > Trackpad Options > Enable dragging


## Software <!-- omit in toc -->
### 📸 Screenshots
MacOS has a built in tool for capturing screen content called **Screenshot**. I frequently take clips of my screen to include in things like documentation, emails, or just to show a colleague or friend some content. You can take a quick screenshot by pressing the key combination **⇧⌘4** and then clicking to drag around the area you want to snip. By default Keep screenshots from cluttering your desktop by creating a folder for them
  - Press **⇧⌘5** then under options > Save To > Other Location
  - Create a new folder:  
    `~/Documents/Screenshots`
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