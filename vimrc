function" vundler
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle.vim/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Bundle "appleton/vim-tomorrow-theme"
Bundle 'chriskempson/base16-vim'
Bundle 'itchyny/lightline.vim'
Bundle "kien/ctrlp.vim"

set nu
set relativenumber
set backspace=indent,eol,start
set mouse=a
syntax enable
set colorcolumn=81
inoremap jk <ESC>

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

let mapleader = ","

:set guifont=Inconsolata-dz\ for\ Powerline:h13

" airline
let g:airline_powerline_fonts = 1
set laststatus=2
set encoding=utf-8

" auto load files if vim detects they have been changed outside of Vim
set autoread

" colours
set termguicolors
let base16colorspace=256  " Access colors present in 256 colorspace
" colorscheme tomorrow
colorscheme base16-ocean

set cursorline
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

let g:lightline = {
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

set noshowmode
