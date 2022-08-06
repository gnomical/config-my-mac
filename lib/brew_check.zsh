# prepare homebrew for use
if ! command -v brew &> /dev/null ; then
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo -e "\nChecking Homebrew for updates."
    brew update
fi