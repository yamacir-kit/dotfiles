if &compatible
  set nocompatible
endif


" -- Vundle ----------------------------------------------------
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'thinca/vim-quickrun'
Plugin 'tyru/caw.vim'

call vundle#end()
filetype plugin indent on


" -- Config files ----------------------------------------------
source ~/.vim/config/keymap_conf.vim
source ~/.vim/config/quickrun_conf.vim


" -- YouCompleteMe Plugin Configs ------------------------------
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_complete_in_comments = 0
let g:ycm_complete_in_strings = 1
let g:ycm_echo_current_diagnostic = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_filetype_blacklist = { 'markdown':1, 'tex':1, 'latex':1 }
let g:ycm_filetype_whitelist = { 'c':1, 'cpp':1 }
let g:ycm_global_ycm_extra_conf = '~/dotfiles/.vim/config/.ycm_better_conf.py'
let g:ycm_key_invoke_completion = '<C-c>'
let g:ycm_key_list_previous_completion = ['<C-Tab>', '<C-k>']
let g:ycm_key_list_select_completion = ['<Tab>', '<C-j>']
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_show_diagnostic_ui = 0
let g:ycm_use_ultisnips_completer = 0


" -- Settings --------------------------------------------------
set encoding=utf-8
set fileencoding=utf-8
set ambiwidth=double

set confirm hidden
set autoread autowrite
set noswapfile nobackup

set fileformat=unix

set ttyfast
set clipboard=unnamedplus

set title
set number cursorline laststatus=0
set showmode showcmd

set list listchars=tab:›\ ,trail:_


set timeout timeoutlen=1000 ttimeoutlen=100
set expandtab smarttab tabstop=2 shiftwidth=2
set nowrap

set cindent cinoptions=g0
set foldmethod=indent

set sidescroll=1 scrolloff=8

set showmatch matchtime=1
set nf="hex"

set virtualedit=block

set incsearch ignorecase smartcase wrapscan

set splitbelow splitright

set wildmenu wildmode=longest:full,full


" -- Syntax Highlighting ---------------------------------------
syntax enable
set t_Co=256
set background=dark
colorscheme hoge


" -- Auto Command BufRead --------------------------------------
autocmd BufRead,BufNewFile *.launch set filetype=xml
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.tex set nocursorline
autocmd BufRead,BufNewFile .tmux.conf*,tmux.conf* set filetype=tmux


" -- Auto Command BufWrite -------------------------------------
autocmd BufWritePre * :%s/\s\+$//ge
