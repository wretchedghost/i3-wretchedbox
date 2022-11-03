#!/bin/bash
############################
# dotfile-link.sh
# This script creates symlinks from the home directory to any desired dotfiles
############################

########## Variables

# dotfiles directory
dir=~/github/i3-wretchedbox

# list of files/folders to symlink in homedir
files=".fehbg .tmux.conf .xinitrc .Xresources"

rm -rf $dir/.config/i3 && ln -s $dir/.config/i3 ~/.config/
rm -rf $dir/.config/rofi && ln -s $dir/.config/rofi ~/.config/
rm -rf $dir/.config/dunst && ln -s $dir/.config/dusnt ~/.config/
rm -rf $dir/Pictures/ && ln -s $dir/Pictures/ ~/Pictures/
rm -rf $dir/ln -s $dir/ ~/.local/share/applications/

##########

# create dotfiles_old in homedir
#echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
#mkdir -p $olddir
#echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done
