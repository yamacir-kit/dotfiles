if &compatible
  set nocompatible
endif

filetype off

set runtimepath+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bfrg/vim-cpp-modern' " syntax highlighting for C++
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'nickhutchinson/vim-cmake-syntax' " syntax highlighting for CMakeLists.txt
Plugin 'terryma/vim-expand-region'
Plugin 'tmux-plugins/vim-tmux' " syntax highlighting for .tmux.conf
Plugin 'tyru/caw.vim'
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()

filetype plugin indent on

set autoread
set background=dark
set clipboard=unnamedplus
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
set nojoinspaces
set noswapfile
set nowrap
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

if (exists('+colorcolumn'))
  set colorcolumn=72,80
endif

let &t_ZH = "\e[3m"
let &t_ZR = "\e[23m"

let g:is_bash = 1

source ~/.vim/configs/youcompleteme.conf.vim

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

vmap v <plug>(expand_region_expand)
vmap <c-v> <plug>(expand_region_shrink)

vnoremap ; :s/
vnoremap > >gv
vnoremap < <gv

syntax enable
syntax sync fromstart

colorscheme solarized

highlight Comment                            cterm=italic
highlight Folded     ctermfg=11 ctermbg=none cterm=italic
highlight Incsearch  ctermfg=1               cterm=underline
highlight Search     ctermfg=1               cterm=underline
highlight SignColumn            ctermbg=none
highlight Todo                               cterm=bold,italic

function! s:when_c_or_cpp() abort
  set cindent
  set cinkeys-=0#
  set cinoptions="#0,(0,+s,/0,:0,=s,>s,E0,Ls,N0,U1,Ws,c3,g0,hs,is,j1,l1,m0,ps,t0,us,w1"
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
