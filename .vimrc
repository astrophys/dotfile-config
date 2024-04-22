"created 5/11/10
" Cool plugins :  http://vimawesome.com/plugin/fugitive-vim
		
colorscheme jellybeans
set number
set ruler
syntax on
set showmatch
setlocal iskeyword+=:

:set expandtab
:set tabstop=4

:set hlsearch

"Display filename
set ls=2

set history=100
set incsearch
set ignorecase
set smartcase

#https://stackoverflow.com/a/68337567/4021436
set nocompatible
set wildmenu
set wildmode=full

"Open file where left off
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	\| exe "normal! g'\"" | endif
endif

" Shift + v and then either # or -# to comment or uncomment
vnoremap # :s#^#\##<cr>
vnoremap -# :s#^\###<cr>

"**************** Everything below was Added 9/21/11****************
set showcmd
"Block below use for split screen 
" <space> switches to the next window (give it a second)
" <space>n switches to the next window
" <space><space> switches to the next window and maximizes it
" <space>= Equalizes the size of all windows
" + Increases the size of the current window
" - Decreases the size of the current window
:map <space> <c-W>w
:map <space>n <c-W>w
:map <space><space> <c-W>w<c-W>_
:map <space>= <c-W>=
":map <C-d> <C-[>diwi   "deletes and puts you in insert mode

if bufwinnr(1)
  map + <c-W>+
  map - <c-W>-
endif
