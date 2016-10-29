if &compatible
  set nocompatible
endif


" -- Vundle ----------------------------------------------------
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'airblade/vim-gitgutter'
" Plugin 'honza/vim-snippets'
" Plugin 'SirVer/UltiSnips'
Plugin 'thinca/vim-quickrun'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on


" -- Config files ----------------------------------------------
source ~/.vim/config/keymap_conf.vim
source ~/.vim/config/quickrun_conf.vim


"-- YouCompleteMe Plugin Configs -------------------------------
let g:ycm_min_num_of_chars_for_completion = 1

let g:ycm_show_diagnostic_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 0

let g:ycm_complete_in_comments = 0
let g:ycm_complete_in_strings = 1

let g:ycm_key_invoke_completion = '<C-c>'
let g:ycm_key_list_select_completion = ['<Tab>', '<C-j>']
let g:ycm_key_list_previous_completion = ['<S-Tab>', '<C-k>']

let g:ycm_use_ultisnips_completer = 0

let g:ycm_global_ycm_extra_conf = '~/dotfiles/.vim/config/.ycm_extra_conf.py'


" -- UltiSnips Plugin Configs ----------------------------------
" let g:UltiSnipsExpandTrigger = '<C-l>'
" let g:UltiSnipsJumpForwardTrigger = '<C-j>'
" let g:UltiSnipsJumpBackwardTrigger = '<C-k>'


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

" -- Display Information ---------------------------------------
set title
set number cursorline laststatus=0
set showmode showcmd

set list listchars=tab:›\ ,trail:_


" -------------------------------------------------------------
"  EDIT
" -------------------------------------------------------------
set timeout timeoutlen=1000 ttimeoutlen=100
set expandtab smarttab tabstop=2 shiftwidth=2
set nowrap

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
