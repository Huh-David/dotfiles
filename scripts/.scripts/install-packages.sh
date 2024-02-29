#!/bin/bash

# Path: scripts/.scripts/install-packages.sh

# check which platform we are on (linux or mac)
platform=$(uname)
isMac() {
    [ "$platform" == "Darwin" ]
}

installPackage() {
    command=$1
    url=$2
    unattended=$3

    if ! command -v $command &> /dev/null; then
        echo "$command is not installed. Installing $command..."
        /bin/bash -c "$(curl -fsSL $url)" $unattended
    fi
}

general_packages="zsh git zsh-autosuggestions zoxide fzf stow eza bat"

if isMac; then
    installPackage "brew" "https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"

    brew install $general_packages 

    installPackage "fig" "https://repo.fig.io/scripts/install-headless.sh "
else
    # check if user is sudo
    if [ "$EUID" -ne 0 ]; then
        echo "Please run this script as root"
        exit
    fi

    apt update
    apt install $general_packages -y
fi

installPackage "oh-my-zsh" "https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh" "--unattended"
installPackage "nvm" "https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh"

echo "Packages installed successfully"

# run stow-dotfiles.sh
./stow-dotfiles.sh
