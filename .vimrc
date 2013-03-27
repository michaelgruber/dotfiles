" General
set nocompatible " Turns off vi compatibility
set number " Line numbers
set ruler " Cursor location

syntax enable

" Pathogen
execute pathogen#infect()

" Indentation
set tabstop=2
set shiftwidth=2
set expandtab " soft tabs

set smartindent
set autoindent
filetype indent on
