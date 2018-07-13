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
Plugin 'tyru/caw.vim'

call vundle#end()
filetype plugin indent on


" -- Source --
source ~/.vim/configs/keymap_conf.vim
source ~/.vim/configs/quickrun_conf.vim


" let g:loaded_youcompleteme = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_echo_current_diagnostic = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_filetype_blacklist = {'markdown':1, 'tex':1, 'latex':1}
let g:ycm_filetype_whitelist = {'c':1, 'cpp':1, 'python':1}
let g:ycm_global_ycm_extra_conf = '~/dotfiles/.vim/configs/.ycm_better_conf.py'
let g:ycm_key_invoke_completion = '<c-c>'
let g:ycm_key_list_previous_completion = [         '<c-k>']
let g:ycm_key_list_select_completion   = ['<tab>', '<c-j>']
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_show_diagnostic_ui = 1
let g:ycm_use_ultisnips_completer = 0


let g:python_highlight_all = 1


let                 &encoding = 'utf-8'
let &fileencoding = &encoding
let &ambiwidth = 'double'

set confirm
set autoread autowrite
set noswapfile nobackup

let &fileformat = 'unix'

set ttyfast
let &clipboard = 'unnamedplus'

set number
let &laststatus = 0
set showmode showcmd

set list listchars=tab:\|\ ,trail:_

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

set sidescroll=1
set scrolloff=8

set showmatch matchtime=1

let &virtualedit = 'block'

set incsearch ignorecase smartcase wrapscan

set splitbelow splitright

set wildmenu wildmode=longest:full,full

" set cursorline
if (exists('+colorcolumn'))
  " let &colorcolumn = 80
endif


let g:solarized_termcolors = 16
let g:solarized_termtrans  =  1
let g:solarized_degrade    =  0
let g:solarized_bold       =  1
let g:solarized_italic     =  1
let g:solarized_underline  =  1
let g:solarized_contrast   = 'normal'
let g:solarized_visibility = 'normal'

syntax enable

let &background = 'light'
colorscheme solarized
highlight MatchParen ctermbg=none
highlight LineNr     ctermbg=none


" -- Auto Command BufRead --------------------------------------
autocmd BufRead,BufNewFile *.cmake    let &filetype = 'cmake'
autocmd BufRead,BufNewFile *.launch   let &filetype = 'xml'
autocmd BufRead,BufNewFile *.md       let &filetype = 'markdown'
autocmd BufRead,BufNewFile .tmux.conf let &filetype = 'tmux'

" autocmd BufRead,BufNewFile *.cpp      let &syntax = 'cpp.doxygen'
" autocmd BufRead,BufNewFile *.hpp      let &syntax = 'cpp.doxygen'


" -- Auto Command BufWrite -------------------------------------
autocmd BufWritePre * :%s/\s\+$//ge

