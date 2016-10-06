if &compatible
  set nocompatible
endif

source ~/.vim/keymaps.vim
source ~/.vim/quickrun_conf.vim

" -------------------------------------------------------------
"  ENCODING
" -------------------------------------------------------------
set encoding=utf-8
set fileencoding=utf-8
set ambiwidth=double

" -------------------------------------------------------------
"  FILE
" -------------------------------------------------------------
set confirm hidden
set autoread autowrite
set noswapfile nobackup

set fileformat=unix

" -------------------------------------------------------------
"  EXTERNAL COOPERATION
" -------------------------------------------------------------
set ttyfast
set clipboard=unnamed

" -------------------------------------------------------------
"  DISPLAY
" -------------------------------------------------------------
set title
set number cursorline laststatus=0
set showmode showcmd

" -------------------------------------------------------------
"  INPUT
" -------------------------------------------------------------
set timeout timeoutlen=1000 ttimeoutlen=100
set expandtab smarttab tabstop=4 shiftwidth=2
set nowrap

set list listchars=tab:›\ ,trail:_

set cindent cinoptions=g0
set foldmethod=indent

set sidescroll=2 "scrolloff=8

set showmatch matchtime=1
set nf="hex"

" set iskeyword-=_

" -------------------------------------------------------------
"  VISUAL
" -------------------------------------------------------------
set virtualedit=block

" -------------------------------------------------------------
"  SEARCH
" -------------------------------------------------------------
set incsearch ignorecase smartcase wrapscan

" -------------------------------------------------------------
"  WINDOW SPLIT
" -------------------------------------------------------------
set splitbelow splitright

" -------------------------------------------------------------
"  COMMAND LINE
" -------------------------------------------------------------
set wildmenu wildmode=longest:full,full

" -------------------------------------------------------------
"  SYNTAX HIGHLIGHT
" -------------------------------------------------------------
syntax enable
set t_Co=256
set background=dark
colorscheme hogehoge

"hi Normal ctermbg=none

set syntax=markdown
au BufRead,BufNewFile *.md set filetype=markdown

filetype plugin indent on
