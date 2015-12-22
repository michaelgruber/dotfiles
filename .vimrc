" NeoBundle
if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
end

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'AndrewRadev/vim-eco'
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', { 'build' : { 'mac' : 'make' } }

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" General
syntax on
cd %:p:h         " set working dir to current file/dir when vim opens
set path=$PWD/** " add subdirectories to path for searching
set backspace=2  " enable backspace
set hidden       " hide buffer instead of closing
set nowrap       " don't wrap lines
set number       " line numbers
set ruler        " cursor location
set spell        " spell checker
set t_Co=256     " 256 colors if terminal supports it

" Persist undo
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Recovery & Backup Off
set nobackup
set noswapfile
set nowb

" Color Scheme
silent! colorscheme solarized
set background=light

" Indentation
set expandtab " soft tabs
set tabstop=2
set shiftwidth=2

autocmd FileType go set noexpandtab tabstop=8 shiftwidth=8

" Syntax
autocmd BufRead,BufNewFile *.rabl set filetype=ruby " Rabl
autocmd BufRead,BufNewFile *.md set filetype=text

" Go
set runtimepath+=$GOROOT/misc/vim

" Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])

let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']

nnoremap <leader>r :<C-u>Unite -start-insert file_rec/async:!<CR>

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
