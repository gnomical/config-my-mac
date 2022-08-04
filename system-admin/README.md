### [config-my-mac](../) / <!-- omit in toc -->
## System Admin

### Table of Contents <!-- omit in toc -->
- [Operating System](#operating-system)
  - [Finder](#finder)
  - [rsync](#rsync)

# Operating System
## Finder
  - Preferences > Advanced > Show all filename extensions
  - View > Show Path Bar
  - View > Show Status Bar
  - Show hidden files
    ```bash
    # In Terminal
    $ defaults write com.apple.Finder AppleShowAllFiles true
    ```

## rsync
In macOS Monterey, Apple provides a custom rsync v2.6.9 (16 years old) binary that has been modified to support extended attributes. 
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