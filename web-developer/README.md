### [config-my-mac](../../../) / <!-- omit in toc -->
## Web Developer <!-- omit in toc -->

When it comes to developing for the web, one of the main benefits is ease of cross platform delivery. That makes specific configs for this profession rare. What you will need however is a great suite of browsers to test with and tools for both rapid prototyping and polished finish.

### Table of Contents <!-- omit in toc -->
- [Automated Config](#automated-config)
- [Manual Documentation](#manual-documentation)
  - [Browsers](#browsers)
  - [NPM](#npm)
    - [nvm](#nvm)
    - [npm](#npm-1)

# Automated Config
All of the manual configurations documented below have been distilled into a script housed within this repo.

<details>
<summary>Expand For Script Details</summary>

## How to use the script <!-- omit in toc -->
The script for the web-developer group of configs can be found at `./web-developer/config_my_mac`. To make all of the changes in an automated fashion please follow these instructions.

First, pull this repo to your local machine. Just as I describe in the developer [README](../developer#os-), I recommend cloning this to `~/Code`
```bash
% cd ~/Code
% git clone https://github.com/gnomical/config-my-mac.git
```
Running git for the first time may prompt you to install `Command Line Developer Tools`, just follow the prompts.

Next, run the script. It will install and/or upgrade brew and then run through all the configs documented within this section.
```bash
% cd ~/Code/config-my-mac
% ./web-developer/config_my_mac
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
# Example excluding the proton-mail module
# because the other software modules will use homebrew
# you can also specify to exclude the homebrew update
% ./general/config_my_mac -i safari,chrome,firefox,edge -e brew
```
  
</details>  

<br/> 

# Manual Documentation
## Browsers
[![Automation Progress](https://img.shields.io/badge/Scripted-Yes-280)](#browsers)

As a web developer, one of the most important things you can do is validate the user experience when viewed in the browsers your target audience will use. My usual target is Corporate America and as such there is a heavy emphasis on Desktop/Tablet. This results in market share being dominated by Chrome (60%) with a distant but competetive second from Safari (17%) and Edge (12%) along with a group of holdout "power users" who still insists on Firefox (6%). [^us-corp-stats] I use [StatCounter](https://gs.statcounter.com) as a reference to make sure i'm up to date on my assumptions when I start a new project.

[^us-corp-stats]: Desktop & Tablet Browser Market Share in North America - July 2022  
  StatCounter  
  https://gs.statcounter.com/browser-market-share/desktop-tablet/north-america/#monthly-202201-202207  

Make sure you have the ones that apply to your situation installed. This repo has scripted helpers for the following.
  - Safari
  - Chrome
  - Edge
  - Firefox

To make access to the browser you need at any given moment quick, I recommend collating them within a single directory and including that in your Dock.
  - Create ???Browsers??? folder in `~/Applications`
  - Create symlinks to each browser within the new folder
  - Place browser folder above downloads folder in Dock

I also recommend placing all installed browsers in a folder withing Launchpad. This, along with other collections recommended in this guide, helps to keep Launchpad from feeling overwhelmingly packed with apps.

## NPM
[![Automation Progress](https://img.shields.io/badge/Scripted-No-900)](#npm)

A package manager for the JavaScript programming language. If you build a website, its going to run javascript. If you aren't using npm, you're doing it wrong.

### nvm
I strongly recommend using [Node Version Manager](https://github.com/nvm-sh/nvm) (nvm) to install Node.js and npm.  For more information visit their GitHub readme's [installation section](https://github.com/nvm-sh/nvm#installing-and-updating).

> **Warning**  
> You must install `git` and `Command Line Developer Tools` before installing `nvm`. You can follow my guide in the, less specialized, [developer section](../developer#git) of this repo.

The nvm installer will look for and modify your `.zshrc` shell profile. By default that file doesn't exist. Run the following command to create it for the installer.

```bash
% touch ~/.zshrc
```

To install nvm, run the following cURL command in your terminal.

```bash
% curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

When the script completes, close and reopen your terminal to start using nvm. You can test that installation was successful by running the following command.

```bash
% command -v nvm
# nvm
```
> **Note**  
> If you do not get `nvm` as the ouput then the installation was unsuccessful. Visit their [macOS troubleshooting guide](https://github.com/nvm-sh/nvm#troubleshooting-on-macos) for further assistance.

### npm
Now that nvm has been installed, we can use it to manage our node installation which will supply the system with an npm binary.  
To download, compile, and install the latest release of node, do this:
```bash
% nvm install node
```
You can confirm the installation was successful by running the following command.
```bash
% npm -v
# 8.15.0
```

> **Info**  
> You can learn more about advanced usage for `nvm` [here](https://github.com/nvm-sh/nvm#usage).  
> Or, get help with the `npm` cli command by running `npm help` in your terminal.


# References <!-- omit in toc -->