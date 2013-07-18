" General
set nocompatible " Turns off vi compatibility
set number " Line numbers
set ruler " Cursor location
set undofile " Use undo file (>=7.3)

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
let g:user_zen_mode='a' " enable all function in all mode.

let s:uname = system("echo -n \"$(uname)\"") " get OS type

" MAC ONLY
if !v:shell_error && s:uname == "Darwin"
    set undodir=/Users/michael/.vimundo/ " Undo file dir
endif

" LINUX ONLY
if !v:shell_error && s:uname == "Linux"
    set undodir=/home/michael/.vimundo/ " Undo file dir
endif
