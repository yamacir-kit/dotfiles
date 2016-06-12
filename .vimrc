if &compatible
  set nocompatible
endif

source ~/.vim/maps.vim
source ~/.vim/quickrun_conf.vim

set noswapfile
set clipboard+=unnamed

set ttyfast

set number 
set title
set cursorline

set ambiwidth=double

set expandtab
set tabstop=2
set shiftwidth=2
set smarttab

set cindent
set cinoptions=g0

set confirm
set hidden
set autoread

set showmatch
set showmode
set matchtime=1

set splitbelow
set splitright

syntax enable
set t_Co=256
set background=dark
colorscheme autumn_flavors

filetype plugin indent on

set encoding=utf-8
set nobackup

set foldmethod=indent

set virtualedit=block
set ignorecase
