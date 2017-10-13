" Vundle setup
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'

call vundle#end()
filetype plugin indent on

let g:airline_powerline_fonts = 1

" Other Settings
syntax on

set number
set encoding=utf-8

map <C-n> :NERDTreeToggle<CR>
