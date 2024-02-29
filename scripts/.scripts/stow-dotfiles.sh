#!/bin/bash

# Path: scripts/.scripts/stow-dotfiles.sh

# check which platform we are on (linux or mac)
platform=$(uname)
isMac() {
    [ "$platform" == "Darwin" ]
}

macDotfiles="fig"
linuxDotfiles=""
dotfiles="zsh scripts"

sourceDir=$(pwd)
targetDir=$HOME

if isMac; then
    dotfiles="$dotfiles $macDotfiles"
else
    dotfiles="$dotfiles $linuxDotfiles"
fi

for dotfile in $dotfiles; do
    stow $dotfile -d $sourceDir -t $targetDir
done

echo "Dotfiles stowed successfully"
