#!/bin/bash

dotfiles="zsh fig scripts"

sourceDir=$(pwd)
targetDir=$HOME

for dotfile in $dotfiles; do
    stow $dotfile -d $sourceDir -t $targetDir
done
