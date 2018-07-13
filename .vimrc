if &compatible
  set nocompatible
endif


filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'hdima/python-syntax'
Plugin 'nickhutchinson/vim-cmake-syntax'
Plugin 'thinca/vim-quickrun'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tyru/caw.vim'

call vundle#end()

filetype plugin indent on


source ~/.vim/configs/keymap_conf.vim
source ~/.vim/configs/quickrun_conf.vim

let g:loaded_youcompleteme = 0
source ~/.vim/configs/youcompleteme.conf.vim

let g:python_highlight_all = 1


let                 &encoding = 'utf-8'
let &fileencoding = &encoding
let &ambiwidth = 'double'

set confirm

set autoread
set autowrite

set noswapfile
set nobackup

let &fileformat = 'unix'

set ttyfast
let &clipboard = 'unnamedplus'

set number
let &laststatus = 0

set showmode
set showcmd

set list
set listchars=tab:\|\ ,trail:_

set timeout
let  &timeoutlen = 1000
let &ttimeoutlen = 100

let               &tabstop = 2
let &shiftwidth = &tabstop
set expandtab smarttab

set nowrap

set cindent
set cinoptions=g0,:0,N-s,#N

set foldmethod=indent
set foldignore=

let &sidescroll = 1
let &scrolloff = 8

set showmatch matchtime=1

let &virtualedit = 'block'

set incsearch ignorecase smartcase wrapscan

set splitbelow
set splitright

set wildmenu
set wildmode=longest:full,full

" set cursorline
if (exists('+colorcolumn'))
  " let &colorcolumn = 80
endif


syntax enable
let &background = 'light'

source ~/.vim/configs/solarized.conf.vim
colorscheme solarized

highlight MatchParen ctermbg=none
highlight LineNr     ctermbg=none


autocmd BufRead,BufNewFile *.cmake    let &filetype = 'cmake'
autocmd BufRead,BufNewFile *.launch   let &filetype = 'xml'
autocmd BufRead,BufNewFile *.md       let &filetype = 'markdown'
autocmd BufRead,BufNewFile .tmux.conf let &filetype = 'tmux'

autocmd BufWritePre * :%s/\s\+$//ge

