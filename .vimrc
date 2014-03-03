"
" GENERAL 
"

set nocompatible " Turns off vi compatibility
set number       " Line numbers
set ruler        " Cursor location
set undofile     " Use undo file (>=7.3)
set hidden       " Hide buffer instead of closing
set spell        " Spell checker
set antialias    " Turn on font antialiasing

syntax enable
filetype indent plugin on

" Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Color Scheme
set background=light
colorscheme solarized

" Indentation
set tabstop=4
set shiftwidth=4
set expandtab " soft tabs

set smartindent
set autoindent

" Aliases
command Nt NERDTree
command Ntf NERDTreeFind

"Syntax
au BufRead,BufNewFile *.rabl setf ruby " Rabl
au BufRead,BufNewFile *.txt setf markdown " Markdown


"
" AUTOCMDS
"

" sets tab width to two for specific filetypes
autocmd FileType ruby,haml,eruby,yaml,html,sass,cucumber,coffee set tabstop=2 shiftwidth=2

" opens NERDTree automatically and sets cursor to main window
autocmd VimEnter * NERDTree | wincmd p

" closes Vim if NERDTree is the last open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | enew | NERDTree | wincmd p | endif


"
" PLUGINS
"

" Zen Coding
let g:user_zen_mode='a' " enable all function in all mode.

" NERDTree
let NERDTreeShowHidden=1


"
" OS SPECIFIC
"

" Windows
if has('win32')
    cd ~
    set undodir=C:/Michael/_vimundo/ " Undo file dir
    set guifont=Courier\ New
elseif has('unix')
    let s:uname = system("echo -n \"$(uname)\"") " get OS type

    " OS X
    if !v:shell_error && s:uname == "Darwin"
        set undodir=/Users/michael/.vimundo/ " Undo file dir
        set guifont=Menlo:h13
    endif

    " Linux 
    if !v:shell_error && s:uname == "Linux"
        set undodir=/home/michael/.vimundo/ " Undo file dir
    endif
endif

