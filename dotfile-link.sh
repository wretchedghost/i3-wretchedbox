#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

# dotfiles directory
dir=~/github/i3Workstation

# list of files/folders to symlink in homedir
files=".fehbg .tmux.conf .xinitrc .Xresources"

ln -s $dir/.config/i3 ~/.config/
ln -s $dir/.config/rofi ~/.config/
ln -s $dir/.config/dusnt ~/.config/
ln -s $dir/Pictures/ ~/Pictures/

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
