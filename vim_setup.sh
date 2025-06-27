#!/bin/bash
mkdir -p ~/.vim/tmp
if [ -d ~/.vim/bundle/Vundle.vim ]
then
    cd ~/.vim/bundle/Vundle.vim
    git pull
else
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim -c "PluginInstall" -c "qa!"
