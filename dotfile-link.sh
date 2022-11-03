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

mv ~/.config/i3 $dot && ln -s $dir/.config/i3 ~/.config/
mv ~/.config/rofi $dot && ln -s $dir/.config/rofi ~/.config/
mv ~/.config/dunst $dot && ln -s $dir/.config/dusnt ~/.config/
mv ~/Pictures/ $dot && ln -s $dir/Pictures/ ~/Pictures/
mv ~/.local/share/applications/libreoffice-writer.desktop $dot && ln -s $dir/libreoffice-writer.desktop ~/.local/share/applications/

##########

# create dotfiles_old in homedir
#echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
#mkdir -p $olddir
#echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    cd ~/
    echo "Creating symlink to $file in home directory."
    mv $files $dot
    ln -s $dir/$file ~/$file
done

# Checks if file is symbolic and is also not broken by testing if it is linked to a file or directory.
if [ ! -L ~/.fehbg ]; then
    if [ -e ~/.fehbg ]; then
    echo "Something messed up. Keeping all files stored in $dot"
    else 
    echo "Everything is now symlinked. Erasing $dot which is no longer needed"
    fi
elif [ -e ~/.fehbg ]; then
    echo "File is not a Link."
else
    echo "File is missing."
fi
