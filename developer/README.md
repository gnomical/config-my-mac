### [config-my-mac](../) / <!-- omit in toc -->
## Developer

### OS <!-- omit in toc -->
**Organization**
  - Create a Code folder in your home directory: `mkdir ~/Code`
  - All of your projects should be placed here. If a particular language, such as go, is picky about folder structure - use this as its root and then create the structure as needed e.g. `~/Code/go/src/example.com`


**git**
  - Config your user name and email
      ```bash
      % git config --global user.name "FIRST_NAME LAST_NAME"
      % git config --global user.email "MY_NAME@users.noreply.github.com"
      ```
    > **Note**:  
    > In order for gpg signing to work, the configured git username and email must match those set on your gpg key.

    > **Warning**:  
    > The email you commit with will be visible to people on the internet. Configure something anonymous for greater privacy.
    > 
    > Github has a solution to help.  
    > See [Setting your commit email address](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-personal-account-on-github/managing-email-preferences/blocking-command-line-pushes-that-expose-your-personal-email-address) on Github.

  - SSH key
      - https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
  - GPG key
      ```bash
      % brew install gnupg
      ```
    - On an `Apple Silicon` machine you need another step for passphrase protected GPG signing
    ```bash
    % brew install pinentry-mac
    % echo "pinentry-program $(which pinentry-mac)" >> ~/.gnupg/gpg-agent.conf
    % killall gpg-agent
    ```
    - follow the instructions on your git repo of choice for setting up GPG keys and signing commits
    - Github
      - Generate GPG Key https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key
      - Sign Commits https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits
      - When committing changes in your local branch, add the -S flag to the git commit command:
          ```bash
          % git commit -S -m "your commit message"
          # Creates a signed commit
          ```
          > 💡 **Tip**:  
          > To configure your Git client to sign commits by default for a local repository, in Git versions 2.0.0 and above, run `git config commit.gpgsign true`.

  - Command Line Developer Tools
      - Just run a git command, it will auto prompt to install
      ```bash
      # Clone this repo for instance
      % git clone https://github.com/gnomical/config-my-mac.git
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