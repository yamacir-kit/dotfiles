if &compatible
  set nocompatible
endif

source ~/.vim/maps.vim
source ~/.vim/quickrun_conf.vim

set noswapfile nobackup
set clipboard=unnamed

set ttyfast

set number cursorline laststatus=0
set title

set ambiwidth=double

set expandtab smarttab tabstop=2 shiftwidth=2 
set nowrap

set list
set listchars=tab:>-,trail:_

set cindent cinoptions=g0

set confirm
set hidden
set autoread

set showmatch
set showmode
set matchtime=1

set splitbelow splitright

syntax enable
set t_Co=256
set background=dark
colorscheme autumn_flavors

filetype plugin indent on

set encoding=utf-8

set foldmethod=indent

set virtualedit=block
set ignorecase
