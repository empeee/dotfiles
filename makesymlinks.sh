#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
# One liner to get the directory of the script - this is the source directory
dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
olddir=~/.dotfiles_old             

# File list starts empty
files=""    # list of files/folders to symlink in homedir

# Per-program list of files
files_tmux="tmux.conf "
files_vim="vimrc "
files_bash="bashrc bash_profile bash_prompt bash_aliases "
files_csh="cshrc "

# Generate program list from arguments, include all if no arguments
if [ $# -eq 0 ]
then
    prog_list="tmux vim bash csh"
else
    prog_list=$@
fi
echo "Generating links for: $prog_list"

# Cycle through program list and add programs to file lists if included
for item in $prog_list
do
	case $item in
		tmux)
			files=$"$files$files_tmux";;
		vim)
			files=$"$files$files_vim";;
		bash)
			files=$"$files$files_bash";;
		csh)
			files=$"$files$files_csh";;
	esac
done


##########
# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
