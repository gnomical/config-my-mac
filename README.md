# config-my-mac <sup><sub>/ ***2022*** *macOS 12.5*</sub></sup> <!-- omit in toc -->
Documentation and scripts for quickly configuring a new Mac for various personal and professional use cases.

### Table of Contents <!-- omit in toc -->
- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Use Cases](#use-cases)
  - [General (All Use Cases) ⎘](#general-all-use-cases-)
  - [Developer ⎘](#developer-)
  - [Web Developer ⎘](#web-developer-)
  - [System Admin ⎘](#system-admin-)

## Introduction

You might be thinking, “This isn’t my first rodeo. Why do I need scripted configs if I’ve been using computers for 20+ years and can just restore from my last backup?”. Being a paranoid skeptic myself, I never trust backups. For one, data corruption is real. Secondly, after a year or two of transient software installs and updates, it’s hard to guarantee things are situated quite the way the developers intended. Lastly, viruses and malware could be sitting dormant anywhere within that backup. As a result of this paranoia, I start each new machine from scratch and reach into my backups sparingly as I progress through whatever workflow was lacking some key piece of data. Often updating my modular repos to include that data for future scripted success.

What you will find below a list of use cases each including a verbose description of configurations and applications grouped by professional vertical. I myself am an IT professional with most of my experience in web application development. However I have also included verticals that pertain to some of my hobbies, like writing and design. It is my intention that these verticals will be augmented by other professionals over time and that this repository can be used as a de facto configuration utility across many environments and professions so as to share tooling knowledge and simplify workflow documentation by creating more workflow commonality amongst our peers.  Some of the categories are intended to stack, for instance system admin -> developer, and will be documented as such. Without further ado, let’s dig into the configurations.

## Prerequisites

**If** you will be using the automation scripts to perform any configurations and installs then the script will automatically attempt to install **Homebrew**. you can learn more about Homebrew on their website https://brew.sh
 
> **Note**  
> Don't forget to look for and follow the '**Next Steps**' in your terminal after brew is installed

## Use Cases

### General (All Use Cases) [⎘](general)
[![Automation Progress](https://img.shields.io/badge/Scripted-Yes-280)](#general-all-use-cases-)

These are my preferences regardless of what the device will be used for. At the OS level they lay the foundation for ease of use in the topics of eye strain, screen real estate, and touch accessibility. At the application level they set you up for validating machine performance, establishing communication capabilities and security best practices.

[See More →](general)

### Developer [⎘](developer)
<!-- [![Automation Progress](https://img.shields.io/badge/Scripted-Next-cec)](#developer-) -->

No matter what kind of software you develop there are several rules that hold true. This section is meant to be a foundation for the more specific developer use cases to build off of. It sets you up with some basic file organization, advanced git configuration, and a widely accepted IDE.

[See More →](developer)

### Web Developer [⎘](web-developer)
[![Automation Progress](https://img.shields.io/badge/Scripted-Partial-c80)](#web-developer-)

When it comes to developing for the web, one of the main benefits is ease of cross platform delivery. That makes specific configs for this profession rare. What you will need however is a great suite of browsers to test with and tools for both rapid prototyping and polished finish.

[See More →](web-developer)

### System Admin [⎘](system-admin)
[![Automation Progress](https://img.shields.io/badge/Scripted-Yes-280)](#system-admin-)

Whether you are responsible for machines you deploy to, tinker elaborately on your own machine, or find yourself architecting all the things - you will want greater visibility than most and tools to assist you on your journey. From terminal enhancements and command line tools to OS modifications and helper apps - this section has you covered.

[See More →](system-admin)