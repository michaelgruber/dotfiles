"
" NEOBUNDLE
"

set nocompatible " turns off vi compatibility (Be iMproved lol)

if has('win32')
    if has('vim_starting')
        set runtimepath+=C:\Dev\dotfiles\.vim\bundle\neobundle.vim
    endif

    call neobundle#begin(expand('C:\Dev\dotfiles\.vim\bundle\'))
else
    if has('vim_starting')
        set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif

    call neobundle#begin(expand('~/.vim/bundle/'))
endif

" let NeoBundle manage itself - required
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'AndrewRadev/vim-eco'
NeoBundle 'jtratner/vim-flavored-markdown'
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'parkr/vim-jekyll'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-liquid'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'wting/rust.vim'

call neobundle#end()

filetype indent plugin on

NeoBundleCheck " prompt to install missing bundles


"
" GENERAL
"

syntax enable

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
set colorcolumn=81

" Indentation
set tabstop=4
set shiftwidth=4
set expandtab " soft tabs
set smartindent

" Text
set wrap
set nolist
set textwidth=0
set wrapmargin=0
set anti enc=utf-8

" Recovery & Backup
set directory=~/.vim/swap,.
set backupdir=~/.vim/swap,.

set shortmess+=A " no swap exists messages

" Leader
let mapleader = ","

" Aliases
command Un Unite

" Syntax
au BufRead,BufNewFile *.rabl setf ruby " Rabl
au BufRead,BufNewFile *.txt setf markdown " Markdown

" Mappings
nnoremap <leader>o :<C-u>on<CR>


"
" AUTOCMDS
"

" sets tab width to two for specific filetypes
autocmd FileType ruby,haml,eruby,yaml,html,scss,cucumber,coffee,markdown set tabstop=2 shiftwidth=2
autocmd FileType vimfiler nmap <buffer> <2-LeftMouse> <Plug>(vimfiler_edit_file)


"
" PLUGINS
"

" Gist-vim
let g:gist_detect_filetype = 1
let g:gist_post_private = 1
let g:gist_show_privates = 1

" Unite.vim
let g:unite_source_history_yank_enable = 1

" use ag as grep replacement
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column --hidden'
  let g:unite_source_grep_recursive_opt = ''
endif

nnoremap <C-y> :Unite history/yank<CR>
nnoremap <C-k> :Unite -start-insert -auto-resize -auto-preview -silent -quick-match buffer<CR>
nnoremap <C-l> :Unite -start-insert -auto-resize -auto-preview -silent file_rec/async<CR>
nnoremap <C-h> :Unite -start-insert -auto-resize -auto-preview -silent grep:.<CR>
nnoremap <silent> <leader>b :<C-u>Unite buffer bookmark<CR>
nnoremap <silent> <leader>ab :<C-u>UniteBookmarkAdd<CR><CR><CR>

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
    set guifont=Source\ Code\ Pro:h11,Consolas:h11
    set undodir=C:\Dev\dotfiles\.vim\vimundo
    set directory=C:\Dev\dotfiles\.vim\swap,.
    set backupdir=C:\Dev\dotfiles\.vim\swap,.

    source $VIMRUNTIME\mswin.vim " for windows copy and pasting
elseif has('unix')
    let s:uname = system("echo -n \"$(uname)\"") " get OS type

    " OS X
    if !v:shell_error && s:uname == "Darwin"
        set undodir=/Users/michael/.vimundo/
        set guifont=Source\ Code\ Pro:h12,\ Menlo:h13

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
