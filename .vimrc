"
" NEOBUNDLE
"

set nocompatible " turns off vi compatibility (Be iMproved lol)

if has('win32')
    if has('vim_starting')
        set runtimepath+=C:\Users\Michael\Dev\dotfiles\.vim\bundle\neobundle.vim
    endif

    call neobundle#begin(expand('C:\Users\Michael\Dev\dotfiles\.vim\bundle\'))
else
    if has('vim_starting')
        set runtimepath+=.vim/bundle/neobundle.vim/
    endif

    call neobundle#begin(expand('.vim/bundle/'))
endif

" let NeoBundle manage itself - required
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'AndrewRadev/vim-eco'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-pathogen'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-ruby/vim-ruby'

call neobundle#end()

filetype indent plugin on

NeoBundleCheck " prompt to install missing bundles


"
" GENERAL
"

syntax enable

set nocompatible
set number       " line numbers
set ruler        " cursor location
set undofile     " use undo file (>=7.3)
set hidden       " hide buffer instead of closing
set spell        " spell checker
set antialias    " turn on font antialiasing
set t_Co=256     " 256 colors if terminal supports it

" Color Scheme
set background=light
colorscheme solarized
set colorcolumn=80

" Indentation
set tabstop=4
set shiftwidth=4
set expandtab " soft tabs
set smartindent

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
command Un Unite

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

" Gist-vim
let g:gist_detect_filetype = 1
let g:gist_post_private = 1
let g:gist_show_privates = 1

" Unite.vim
let g:unite_source_history_yank_enable = 1
nnoremap <C-y> :Unite history/yank<CR>
nnoremap <C-h> :Unite -quick-match -silent -auto-resize buffer<CR>
nnoremap <C-k> :Unite -silent -auto-resize file_rec/async<CR>
nnoremap <C-l> :Unite -silent -auto-resize grep:.<CR>

" VimFiler
let g:vimfiler_as_default_explorer = 1
nnoremap <C-j> :VimFilerExplorer<CR>

" Vim-rspec
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
    set undodir=C:\Users\Michael\Dev\dotfiles\.vim\vimundo
    set directory=C:\Users\Michael\Dev\dotfiles\.vim\swap,.
    set backupdir=C:\Users\Michael\Dev\dotfiles\.vim\swap,.
elseif has('unix')
    let s:uname = system("echo -n \"$(uname)\"") " get OS type

    " OS X
    if !v:shell_error && s:uname == "Darwin"
        set undodir=/Users/michael/.vimundo/
        set guifont=Menlo:h13

        " Vim-Rspec
        let g:rspec_runner = "os_x_iterm"

        " Gist-Vim
        let g:gist_clip_command = 'pbcopy'
    endif

    " Linux 
    if !v:shell_error && s:uname == "Linux"
        set undodir=/home/michael/.vimundo/
    endif
endif
