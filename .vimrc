if &compatible
  set nocompatible
endif


" -- Config files ----------------------------------------------
source ~/.vim/config/keymap_conf.vim
source ~/.vim/config/quickrun_conf.vim

let g:ycm_global_ycm_extra_conf = '~/dotfiles/.vim/config/.ycm_extra_conf.py'
let g:ycm_key_invoke_completion = '<C-x>'
let g:ycm_key_list_select_completion = ['<tab>']
let g:ycm_key_list_previous_completion = ['<S-tab>']


" -- Vundle ----------------------------------------------------
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'thinca/vim-quickrun'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on


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
"  EDIT
" -------------------------------------------------------------
set timeout timeoutlen=1000 ttimeoutlen=100
set expandtab smarttab tabstop=2 shiftwidth=2
set nowrap

set list listchars=tab:›\ ,trail:_

set cindent cinoptions=g0
set foldmethod=indent

set sidescroll=2 "scrolloff=8

set showmatch matchtime=1
set nf="hex"

" -------------------------------------------------------------
"  VISUAL
" -------------------------------------------------------------
set virtualedit=block

" -------------------------------------------------------------
"  SEARCH
" -------------------------------------------------------------
set incsearch ignorecase smartcase wrapscan


" -- Window Split ----------------------------------------------
set splitbelow splitright


" -- Wildmenu --------------------------------------------------
set wildmenu wildmode=longest:full,full


" -- Syntax Highlighting ---------------------------------------
syntax enable
set t_Co=256
set background=dark
colorscheme hoge


" -- Filetype --------------------------------------------------
set syntax=markdown
au BufRead,BufNewFile *.md set filetype=markdown
