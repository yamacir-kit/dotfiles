set autoread
set background=dark
set clipboard=unnamedplus
set colorcolumn=72,80
set confirm
set cursorline
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set fileformat=unix
set foldignore=""
set foldmethod=indent
set incsearch
set laststatus=0
set list
set listchars=tab:>\ ,trail:_
set matchtime=1
set nobackup
set nocompatible " Required by Vundle.vim
set nojoinspaces
set noswapfile
set nowrap
set runtimepath+=~/.vim/bundle/Vundle.vim
set scrolloff=128
set shiftwidth=2
set showcmd
set showmatch
set showmode
set sidescroll=1
set sidescrolloff=16
set smartcase
set smarttab
set splitbelow
set splitright
set tabstop=2
set timeout
set timeoutlen=1000
set ttimeoutlen=100
set ttyfast
set updatetime=100
set virtualedit=block
set wildmenu
set wildmode=longest:full,full
set wrapscan

filetype off " Required by Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bfrg/vim-cpp-modern' " Syntax highlighting for C++
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'nickhutchinson/vim-cmake-syntax' " Syntax highlighting for CMakeLists.txt
Plugin 'tmux-plugins/vim-tmux' " Syntax highlighting for .tmux.conf
Plugin 'tyru/caw.vim' " Comment plugin
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()

filetype plugin indent on " Required by Vundle.vim

let g:is_bash = 1

let g:cpp_attributes_highlight = 1
let g:cpp_function_highlight = 1
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 0

let g:solarized_bold = 1
let g:solarized_contrast = 'high'
let g:solarized_degrade = 0
let g:solarized_italic = 1
let g:solarized_termcolors = 16
let g:solarized_termtrans = 1
let g:solarized_underline = 1
let g:solarized_visibility = 'normal'

let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_auto_hover = ''
let g:ycm_auto_trigger = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_echo_current_diagnostic = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_key_invoke_completion = '<c-c>'
let g:ycm_key_list_previous_completion = ['<s-tab>', '<c-k>']
let g:ycm_key_list_select_completion = ['<tab>', '<c-j>']
let g:ycm_max_num_candidates = 10
let g:ycm_max_num_identifier_candidates = 10
let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_show_diagnostic_ui = 0
let g:ycm_use_clangd = 1
let g:ycm_use_ultisnips_completer = 0

let &t_ZH = "\e[3m"
let &t_ZR = "\e[23m"

nnoremap : ;
nnoremap ; :
nnoremap + <c-a>
nnoremap / :<c-u>set<space>hlsearch<cr>/
nnoremap ? :<c-u>set<space>hlsearch<cr>?
nnoremap - <c-x>
nnoremap <leader>def :YcmCompleter<space>GoTo<cr>
nnoremap <leader>gc :!git<space>commit<space>-sv<cr>
nnoremap <leader>gn :<c-u>GitGutterNextHunk<cr>
nnoremap <leader>gp :<c-u>GitGutterPrevHunk<cr>
nnoremap <leader>gr :<c-u>GitGutterUndoHunk<cr>
nnoremap <leader>gs :<c-u>GitGutterStageHunk<cr>
nnoremap x "_x
nnoremap Y y$

inoremap "" ""<left>
inoremap $$ $$<left>
inoremap '' ''<left>
inoremap () ()<left>
inoremap <> <><left>
inoremap [] []<left>
inoremap {} {}<left>

vnoremap ; :s/
vnoremap > >gv
vnoremap < <gv

syntax enable
syntax sync fromstart

if isdirectory(expand("$HOME/.vim/bundle/vim-colors-solarized"))
  colorscheme solarized

  highlight Comment                            cterm=italic
  highlight Folded     ctermfg=11 ctermbg=none cterm=italic
  highlight Incsearch  ctermfg=1               cterm=underline
  highlight Search     ctermfg=1               cterm=underline
  highlight SignColumn            ctermbg=none
  highlight Todo                               cterm=bold,italic
endif

function! s:when_c_or_cpp() abort
  set cindent
  set cinkeys-=0#
  set cinoptions=#0,(0,+s,/0,:0,=s,>s,E0,Ls,N0,U1,Ws,c3,g0,hs,is,j1,l1,m0,ps,t0,us,w1
  set comments="s:/*,m:  ,e-3:*/,://"
  set foldlevel=1
  set formatoptions="cjnoqr"
endfunction

auto BufRead,BufNewFile *.launch    set filetype=xml
auto BufRead,BufNewFile *.md        set filetype=markdown
auto BufRead,BufNewFile *.plt       set filetype=gnuplot
auto BufRead,BufNewFile *.repos     set filetype=yaml
auto BufRead,BufNewFile *.tmux.conf set filetype=tmux

auto BufWritePre * :%s/\s\+$//ge

auto FileType c,cpp call s:when_c_or_cpp()
