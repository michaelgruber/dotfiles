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
set t_Co=256     " 256 colors if terminal supports it

syntax enable
filetype indent plugin on

" Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Color Scheme
set background=light
colorscheme solarized
set colorcolumn=80

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
set textwidth=0
set wrapmargin=0

" Recovery & Backup
set directory=~/.vim/swap,.
set backupdir=~/.vim/swap,.

set shortmess+=A " no swap exists messages

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

" Vim-Rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>


"
" OS SPECIFIC
"

" Windows
if has('win32')
    set guifont=Consolas:h11
    set undodir=C:\Users\Michael\Dev\dotfiles\.vim\vimundo " Undo file dir
    set directory=C:\Users\Michael\Dev\dotfiles\.vim\swap,.
    set backupdir=C:\Users\Michael\Dev\dotfiles\.vim\swap,.
    let g:instant_markdown_autostart=0
elseif has('unix')
    let s:uname = system("echo -n \"$(uname)\"") " get OS type

    " OS X
    if !v:shell_error && s:uname == "Darwin"
        set undodir=/Users/michael/.vimundo/ " Undo file dir
        set guifont=Menlo:h13

        " Vim-Rspec
        let g:rspec_runner = "os_x_iterm"
    endif

    " Linux 
    if !v:shell_error && s:uname == "Linux"
        set undodir=/home/michael/.vimundo/ " Undo file dir
    endif
endif
