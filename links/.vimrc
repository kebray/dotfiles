" vim settings
" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab


set nocompatible
syntax on
set ruler
set hlsearch
filetype plugin indent on
set ai " auto set indent of a new line (local to buffer)
set si " smartindent (local to bufffer)
set mouse=a
set ts=4 " set's tabs to 4 spaces.
set softtabstop=4
set shiftwidth=4 "set's shiftwidth to same as tab stop
set autoindent

set number  " sets lines numbers in the files
" set nonumber "turns line numbers off
" 

" make backspaces more powerfull
set backspace=indent,eol,start

" github.com/tpope/vim-pathogen
" execute pathogen#infect()

