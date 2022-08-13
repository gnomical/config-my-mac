brew_app_install() {
    appName=$1
    if [ -z "$2" ]; then
        fileName="${(C)appName}.app"
        appPath=/Applications/$fileName
    else
        appPath=$2
        fileName="$(basename $appPath)"
    fi

    echo -e "\nInstalling $fileName"

    didInstall=false
    hasError=false
    # Install the app
    if [ -d "$appPath" ]; then
        echo "${yellow_f}Warning:${reset} It seems there is already an App at '${appPath}'."
    else
        brewOutput=$(brew install --cask $appName 2>&1)
        error=$(echo $brewOutput | grep "Error:")
        if [ -n $error ]; then
            echo ${error/"Error:"/"${red_f}Error:${reset}"}
            hasError=true
        else
            didInstall=true
        fi
    fi

    # add it to the dock
    if ! $hasError; then
        if defaults read com.apple.dock persistent-apps | grep -q $appPath; then
            echo "${yellow_f}Warning:${reset} The file '${appPath}' is already in the Dock."
            if ! $didInstall; then
                echo "${yellow_f}${bold}${fileName}${reset}${yellow_f} has previously been installed.${reset}"
            fi
        else
            defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>${appPath}</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
            killall Dock

            if ! $didInstall; then
                echo "${green_f}${bold}${fileName}${reset}${green_f} has been added to the dock.${reset}"
            fi
        fi
    fi
    
    if $didInstall; then
        echo "${green_f}${bold}${fileName}${reset}${green_f} has been installed.${reset}"
    elif $hasError; then
        echo "${red_f}${bold}${fileName}${reset}${red_f} was ${bold}not${reset}${red_f} installed.${reset}"
    fi
}