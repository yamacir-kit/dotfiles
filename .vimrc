if &compatible
  set nocompatible
endif


" -- Vundle ----------------------------------------------------
filetype off
set runtimepath+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'thinca/vim-quickrun'
Plugin 'tyru/caw.vim'

" Syntax Highlight Plugins
Plugin 'hdima/python-syntax'
Plugin 'nickhutchinson/vim-cmake-syntax'

call vundle#end()
filetype plugin indent on


" -- Config files ----------------------------------------------
source ~/.vim/config/keymap_conf.vim
source ~/.vim/config/quickrun_conf.vim


" -- YouCompleteMe Plugin Configs ------------------------------
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_echo_current_diagnostic = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_filetype_blacklist = {'markdown':1, 'tex':1, 'latex':1}
let g:ycm_filetype_whitelist = {'c':1, 'cpp':1, 'python':1}
let g:ycm_global_ycm_extra_conf = '~/dotfiles/.vim/config/.ycm_better_conf.py'
let g:ycm_key_invoke_completion = '<c-c>'
let g:ycm_key_list_previous_completion = [         '<c-k>']
let g:ycm_key_list_select_completion   = ['<tab>', '<c-j>']
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_show_diagnostic_ui = 1
let g:ycm_use_ultisnips_completer = 0

let g:python_highlight_all = 1


" -- Settings --------------------------------------------------
let                 &encoding = 'utf-8'
let &fileencoding = &encoding
let &ambiwidth = 'double'

set confirm
set hidden
set autoread autowrite
set noswapfile nobackup

let &fileformat = 'unix'

set ttyfast
let &clipboard = 'unnamedplus'

set title
set number nocursorline
let &laststatus = 0
set showmode showcmd

set list listchars=tab:›\ ,trail:_


set timeout
let  &timeoutlen = 1000
let &ttimeoutlen = 100

set expandtab smarttab tabstop=2 shiftwidth=2
set nowrap

set cindent cinoptions=g0,:0,N-s,#0
set foldmethod=indent
set foldignore=

set sidescroll=1 scrolloff=8

set showmatch matchtime=1
" set &nrformats = 'hex'

set virtualedit=block

set incsearch ignorecase smartcase wrapscan

set splitbelow

set wildmenu wildmode=longest:full,full

set cursorline


" -- Syntax Highlighting ---------------------------------------
syntax enable
let &t_Co = 256
set background=dark
colorscheme meevax


" -- Auto Command BufRead --------------------------------------
autocmd BufRead,BufNewFile *.launch   let &filetype = 'xml'
autocmd BufRead,BufNewFile *.md       let &filetype = 'markdown'
autocmd BufRead,BufNewFile .tmux.conf let &filetype = 'tmux'


" -- Auto Command BufWrite -------------------------------------
autocmd BufWritePre * :%s/\s\+$//ge

