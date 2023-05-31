" .vimrc
" Mark Pude

" Automatic reloading of .vimrc on save
autocmd! bufwritepost .vimrc source %

" Rebind <Leader> key
let mapleader = ","

"" Vundle setup
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'romainl/flattened'

call vundle#end()
filetype plugin indent on

"" Airline Setup
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'solarized'
let g:airline_solarized_bg = 'dark'

"" Better buffer use
set hidden
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>

"" Other Settings
syntax on
set background=dark
colorscheme flattened_dark
set encoding=utf-8
set spell spelllang=en_us

"" Fix tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

"" Show line numbers
set number relativenumber

" Move backup to tmp directory so you don't get shit files in every directory added undo file too...
set backupdir=~/.vim/tmp//
set directory=~/.vim/tmp//
set undodir=~/.vim/tmp//

" Highlight settings
set hlsearch
noremap <F4> :set hlsearch! hlsearch?<CR>
nnoremap <CR> :nohlsearch<CR><CR>

" Error Bells
set noeb vb t_vb=

