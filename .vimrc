cd %:p:h         " set working dir to current file/dir when vim opens
set path=$PWD/** " add subdirectories to path for searching

" Go
set runtimepath+=$GOROOT/misc/vim

" Start Pathogen (quietly in case there's no .vim/autoload/pathogen.vim)
silent! execute pathogen#infect()

syntax on
filetype plugin indent on

set hidden       " hide buffer instead of closing
set number       " line numbers
set ruler        " cursor location
set spell        " spell checker
set t_Co=256     " 256 colors if terminal supports it
set undofile     " use undo file (>=7.3)
set shortmess+=A " no swap exists messages

" Color Scheme
silent! colorscheme solarized
set background=light

" Indentation
set expandtab    " soft tabs
set tabstop=4
set shiftwidth=4

autocmd FileType coffee,cucumber,eruby,go,haml,html,markdown,ruby,scss,yaml set tabstop=2 shiftwidth=2
autocmd FileType go set noexpandtab tabstop=8 shiftwidth=8

" Recovery & Backup
set backupdir=~/.vim/swap,.
set directory=~/.vim/swap,.
set undodir=~/.vimundo/

" Syntax
autocmd BufRead,BufNewFile *.rabl set filetype=ruby " Rabl
autocmd BufRead,BufNewFile *.md set filetype=text

" Windows
if has('win32')
    set guifont=Source\ Code\ Pro:h11,Consolas:h11
    set undodir=C:\Dev\dotfiles\.vim\vimundo
    set directory=C:\Dev\dotfiles\.vim\swap,.
    set backupdir=C:\Dev\dotfiles\.vim\swap,.

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
