#!/bin/bash
############################
# dotfile-link.sh
# This script creates symlinks from the home directory to any desired dotfiles
############################

########## Variables
dot=~/.dotiles_temp
rm -rf  $dot && sleep 1
mkdir $dot && sleep 1

# dotfiles directory
dir=~/github/i3-wretchedbox

# list of files/folders to symlink in homedir
files=".fehbg .tmux.conf .xinitrc .Xresources"

mv ~/.config/i3 $dot && ln -s $dir/.config/i3 ~/.config/ && echo "Creating symlink in home directory."
mv ~/.config/rofi $dot && ln -s $dir/.config/rofi ~/.config/ && echo "Creating symlink in home directory."
rm -rf ~/.config/dunst && ln -s $dir/.config/dusnt ~/.config/ && echo "Creating symlink in home directory."
rm -rf ~/Pictures/Portugal && ln -s $dir/Pictures/Portugal ~/Pictures/ && echo "Creating symlink in home directory."
rm -rf ~/Pictures/example && ln -s $dir/Pictures/example ~/Pictures/ && echo "Creating symlink in home directory."
rm -rf ~/.screenlayout && ln -s $dir/.screenlayout ~/ && echo "Creating symlink in home directory."
mv ~/.local/share/applications/libreoffice-writer.desktop $dot && ln -s $dir/libreoffice-writer.desktop ~/.local/share/applications/ && echo "Creating symlink in home directory."


##########

# create dotfiles_old in homedir
#echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
#mkdir -p $olddir
#echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    cd ~/
    mv $file $dot
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

# Checks if file is symbolic and is also not broken by testing if it is linked to a file or directory.
if [ ! -L ~/.fehbg ]; then
    echo "Something messed up. Keeping all files stored in $dot"
else 
    echo "Everything is now symlinked. Erasing $dot which is no longer needed"
    rm -rf $dot
fi
