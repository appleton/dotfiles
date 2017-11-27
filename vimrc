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
Bundle "chriskempson/base16-vim"
Bundle "itchyny/lightline.vim"
Bundle "kien/ctrlp.vim"
Bundle "jszakmeister/vim-togglecursor"
Bundle "tpope/vim-surround"
Bundle "machakann/vim-highlightedyank"
Bundle "airblade/vim-gitgutter"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-repeat"
Bundle "pangloss/vim-javascript"
Bundle "tpope/vim-commentary"
Bundle "jiangmiao/auto-pairs"
Bundle "vim-ruby/vim-ruby"
Bundle "joshdick/onedark.vim"

set nu
set relativenumber
set backspace=indent,eol,start
set mouse=a
syntax enable
set colorcolumn=81
inoremap jk <ESC>
set noswapfile
set clipboard=unnamed

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

let mapleader = ","

:set guifont=Inconsolata-dz\ for\ Powerline:h13

" auto load files if vim detects they have been changed outside of Vim
set autoread

" colours
set termguicolors
colorscheme onedark

" airline
let g:airline_powerline_fonts = 1
set laststatus=2
set encoding=utf-8

set cursorline
let g:togglecursor_default = 'block'
let g:togglecursor_insert = 'line'
let g:togglecursor_replace = 'underline'
let g:togglecursor_leave = 'line'

let g:lightline = {
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

map y <Plug>(highlightedyank)
let g:highlightedyank_highlight_duration = 100

set noshowmode

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

let g:ycm_min_num_of_chars_for_completion = 99
