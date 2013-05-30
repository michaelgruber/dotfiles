" General
set nocompatible " Turns off vi compatibility
set number " Line numbers
set ruler " Cursor location
set undofile " Use undo file (>=7.3)
set undodir=/Users/michael/.vimundo/ " Undo file dir

syntax enable

" Pathogen
execute pathogen#infect()

" Indentation
set tabstop=4
set shiftwidth=4
set expandtab " soft tabs

set smartindent
set autoindent
filetype indent on

" Aliases
command Nt NERDTree

" AUTOCMDS

" sets tab width to two for specific filetypes
autocmd FileType ruby,haml,eruby,yaml,html,sass,cucumber set tabstop=2 shiftwidth=2

" PLUGINS

" Zen Coding
let g:user_zen_mode='a' "enable all function in all mode.
