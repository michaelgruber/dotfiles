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
set textwidth=80
set colorcolumn=+1

" Indentation
set tabstop=4
set shiftwidth=4
set expandtab " soft tabs

set smartindent
set autoindent

" Text
set wrap
set linebreak
set nolist

" Recovery & Backup
set directory=~/.vim/swap,.
set backupdir=~/.vim/swap,.

" Leader
let mapleader = ","

" Aliases
command Nt NERDTree
command Ntf NERDTreeFind
command Bm Bookmark
command Cbm ClearAllBookmarks

"Syntax
au BufRead,BufNewFile *.rabl setf ruby " Rabl
au BufRead,BufNewFile *.txt setf markdown " Markdown


"
" AUTOCMDS
"

" sets tab width to two for specific filetypes
autocmd FileType ruby,haml,eruby,yaml,html,scss,cucumber,coffee set tabstop=2 shiftwidth=2


"
" PLUGINS
"

" Zen Coding
let g:user_zen_mode='a' " enable all function in all mode.

" NERDTree
map <C-j> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.swp$', '\.swo$', '\.keep$', '\.DS_Store$']

" Tagbar
map <C-k> :TagbarToggle<CR>


"
" OS SPECIFIC
"

" Windows
if has('win32')
    set guifont=Consolas:h11
    set undodir=E:\Michael\_vimundo\ " Undo file dir
    set directory=E:\Src\dotfiles\.vim\swap,.
    set backupdir=E:\Src\dotfiles\.vim\swap,.
    let g:instant_markdown_autostart=0
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
