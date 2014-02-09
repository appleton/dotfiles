" vundler
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Bundle "~/projects/vim-tomorrow-theme/.git"
Bundle 'bling/vim-airline'

set nu
set backspace=indent,eol,start
syntax enable
set colorcolumn=81

" airline
let g:airline_powerline_fonts = 1
set laststatus=2
set encoding=utf-8

" auto load files if vim detects they have been changed outside of Vim
set autoread

" colours
set t_Co=256
colorscheme tomorrow
set cursorline
