" .vimrc
" Mark Pude

" Automatic reloading of .vimrc on save
autocmd! bufwritepost .vimrc source %

" Set GUI font to something powerline(airline) compatible when on windows
if has('win32')
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11
endif

" Rebind <Leader> key
let mapleader = ","

" Get terminal type
let workenv=$WORKENV

" Vundle setup
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
if workenv==0
    Plugin 'tmhedberg/SimpylFold'
    Plugin 'nvie/vim-flake8'
endif

call vundle#end()
filetype plugin indent on

"" Airline setup
if workenv==0
    let g:airline_powerline_fonts = 1
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

if workenv==1
     " Custom symbols since we don't have the right fonts
     if !exists('g:airline_symbols')
        let g:airline_symbols = {}
     endif

     " unicode symbols
     let g:airline_left_sep = '▶'
     let g:airline_right_sep = '◀'
     let g:airline_symbols.crypt = '�'
     let g:airline_symbols.linenr = '☰'
     let g:airline_symbols.maxlinenr = '㏑'
     let g:airline_symbols.branch = '⎇'
     let g:airline_symbols.paste = 'ρ'
     let g:airline_symbols.spell = 'Ꞩ'
     let g:airline_symbols.notexists = '∄'
     let g:airline_symbols.whitespace = 'Ξ'
endif

"" Better buffer use
set hidden
nmap <leader>T :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

" Other Settings
syntax on
set background=dark
color solarized
let python_highlight_all=1

" Show line numbers
set number
set encoding=utf-8

" Fix tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Easier nerd tree
map <C-n> :NERDTreeToggle<CR>

" Folding settings
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
if workenv==0
    let g:SimpylFold_docstring_preview=1
endif

" Move backup to tmp directory so you don't get shit files in every directory added undo file too...
set backupdir=~/.vim/tmp//
set directory=~/.vim/tmp//
set undodir=~/.vim/tmp//
