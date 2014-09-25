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

set antialias  " turn on font antialiasing
set hidden     " hide buffer instead of closing
set number     " line numbers
set ruler      " cursor location
set spell      " spell checker
set splitright " open vsplits to the right
set t_Co=256   " 256 colors if terminal supports it
set undofile   " use undo file (>=7.3)

" Color Scheme
colorscheme solarized
set background=light
set colorcolumn=81

" Indentation
set expandtab    " soft tabs
set shiftwidth=4
set smartindent
set tabstop=4

" Text
set anti enc=utf-8
set nolist
set textwidth=0
set wrap
set wrapmargin=0

" Recovery & Backup
set backupdir=~/.vim/swap,.
set directory=~/.vim/swap,.

set shortmess+=A " no swap exists messages

" Leader
let mapleader = ","

" Syntax
au BufRead,BufNewFile *.rabl setf ruby " Rabl
au BufRead,BufNewFile *.txt setf markdown " Markdown


"
" AUTOCMDS
"

" General
autocmd FileType ruby,haml,eruby,yaml,html,scss,cucumber,coffee,markdown set tabstop=2 shiftwidth=2

" Unite.vim
autocmd FileType unite nmap <silent><buffer><expr> v unite#do_action('vsplit')

" Vim-fugitive
autocmd FileType fugitiveblame nmap e o
autocmd FileType git nmap q :q<CR>
autocmd FileType gitcommit nmap <space> -
autocmd FileType gitcommit nmap e <CR>

" VimFiler
autocmd FileType vimfiler nmap <buffer><2-LeftMouse><Plug>(vimfiler_edit_file)
autocmd FileType vimfiler nmap <silent><buffer><expr> v vimfiler#do_action('vsplit')
autocmd FileType vimfiler nmap <silent><buffer><expr><CR> vimfiler#smart_cursor_map(
    \ "\<Plug>(vimfiler_expand_tree)",
    \ "\<Plug>(vimfiler_edit_file)")


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
  let g:unite_source_rec_async_command = 'ag --follow --nocolor --nogroup --hidden -g ""'
endif

" Vim-sneak
let g:sneak#s_next = 1

" VimFiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_execute_file_list = {}
let g:vimfiler_execute_file_list['_'] = 'vim'


"
" MAPPINGS
"

" General
nnoremap <leader>o :<C-u>on<CR>
nnoremap <leader>w <C-w>w
nnoremap <leader>we :wincmd =<CR>
nnoremap <leader>wf :vertical res<CR>:res<CR>
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>ww <C-w>w

" Unite.vim
nnoremap <leader>b :<C-u>Unite bookmark<CR>
nnoremap <leader>ba :<C-u>UniteBookmarkAdd<CR><CR><CR>
nnoremap <leader>h :Unite -start-insert -auto-resize -auto-preview -silent grep:.<CR>
nnoremap <leader>k :Unite -start-insert -auto-resize -auto-preview -silent -quick-match buffer<CR>
nnoremap <leader>l :Unite -start-insert -auto-resize -auto-preview -silent file_rec/async<CR>
nnoremap <leader>y :Unite history/yank<CR>

" Vim-fugitive
nnoremap <leader>g :Gstatus<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gco :Gread<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gdc :Git! diff --cached<CR>
nnoremap <leader>gl :Git! log<CR>
nnoremap <leader>gs :Gstatus<CR>

" Vim-rspec
nnoremap <leader>t :call RunCurrentSpecFile()<CR>
nnoremap <leader>ta :call RunAllSpecs()<CR>
nnoremap <leader>tf :call RunCurrentSpecFile()<CR>
nnoremap <leader>tl :call RunLastSpec()<CR>
nnoremap <leader>tt :call RunNearestSpec()<CR>

" VimFiler
nnoremap <leader>j :VimFilerExplorer<CR>


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
