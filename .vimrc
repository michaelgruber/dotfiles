set nocompatible

cd %:p:h         " set working dir to current file/dir when vim opens
set path=$PWD/** " add subdirectories to path for searching

" Start Pathogen (quietly in case there's no .vim/autoload/pathogen.vim)
silent! execute pathogen#infect()

syntax on
filetype plugin indent on

set backspace=2 " enable backspace
set hidden      " hide buffer instead of closing
set nowrap      " don't wrap lines
set number      " line numbers
set ruler       " cursor location
set spell       " spell checker
set t_Co=256    " 256 colors if terminal supports it

" Persist undo
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif
"
" Recovery & Backup Off
set nobackup
set noswapfile
set nowb

" Color Scheme
silent! colorscheme solarized
set background=light

" Indentation
set expandtab " soft tabs
set tabstop=4
set shiftwidth=4

autocmd FileType javascript,coffee,cucumber,eruby,go,haml,html,markdown,ruby,scss,yaml setlocal tabstop=2 shiftwidth=2
autocmd FileType go set noexpandtab tabstop=8 shiftwidth=8

" Syntax
autocmd BufRead,BufNewFile *.rabl set filetype=ruby " Rabl
autocmd BufRead,BufNewFile *.md set filetype=text

" Go
set runtimepath+=$GOROOT/misc/vim

" Windows
if has('win32')
    set guifont=Source\ Code\ Pro:h11,Consolas:h11
    source $VIMRUNTIME\mswin.vim " for windows copy and pasting

" Unix
elseif has('unix')
    let s:uname = system("echo -n \"$(uname)\"") " get OS type

" OS X
    if !v:shell_error && s:uname == "Darwin"
        set guifont=Source\ Code\ Pro:h12,\ Menlo:h13

" Linux
    else

    endif
endif
