# common linux console_codes
# https://linux.101hacks.com/ps1-examples/prompt-color-using-tput/

# text
bold=$(tput bold)

# color
red_f=$(tput setaf 1)
green_f=$(tput setaf 2)
yellow_f=$(tput setaf 3)

# reset
reset=$(tput sgr0)