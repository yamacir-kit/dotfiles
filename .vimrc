if &compatible
  set nocompatible
endif

filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bfrg/vim-cpp-modern'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'nickhutchinson/vim-cmake-syntax'
Plugin 'rhysd/clever-f.vim'
Plugin 'terryma/vim-expand-region'
Plugin 'thinca/vim-quickrun'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tyru/caw.vim'
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()

filetype plugin indent on

source ~/.vim/configs/quickrun.conf.vim
source ~/.vim/configs/vim-cpp-modern.conf.vim
source ~/.vim/configs/youcompleteme.conf.vim

let                 &encoding = 'utf-8'
let &fileencoding = &encoding
" let &ambiwidth = 'double'

let &updatetime = 100

set confirm

set autoread

set noswapfile
set nobackup

let &fileformat = 'unix'

set ttyfast
let &clipboard = 'unnamedplus'

" set number
" set relativenumber
let &laststatus = 0

set showmode
set showcmd

set list
let &listchars = 'tab:> ,trail:_'

set timeout
let  &timeoutlen = 1000
let &ttimeoutlen = 100

let               &tabstop = 2
let &shiftwidth = &tabstop
set expandtab smarttab

set nowrap

set regexpengine=1

auto filetype scheme setlocal autoindent lisp
auto filetype c,cpp setlocal cindent
let &cinoptions = 'Ls,:0,=s,g0,N-s,#N,(0,us,U42,w42,Ws,m42'

let &foldmethod = 'indent'
let &foldignore = ''
let &foldlevel = 1

let &sidescroll    =   1
let &sidescrolloff =  16
let     &scrolloff = 128

set showmatch
let &matchtime = 1

let &virtualedit = 'block'

set incsearch ignorecase smartcase wrapscan

set splitbelow splitright

set wildmenu
let &wildmode = 'longest:full,full'

set cursorline
if (exists('+colorcolumn'))
  " let &colorcolumn = 80
  let &colorcolumn = join(range(81, 65535), ',')
endif

nnoremap ; :
nnoremap : ;
nnoremap Y y$
nnoremap x "_x
nnoremap + <c-a>
nnoremap - <c-x>

nnoremap <leader>def :YcmCompleter<space>GoTo<cr>

nnoremap <leader>gc :!git<space>commit<space>--verbose<cr>
nnoremap <leader>gn :<c-u>GitGutterNextHunk<cr>
nnoremap <leader>gp :<c-u>GitGutterPrevHunk<cr>
nnoremap <leader>gr :<c-u>GitGutterUndoHunk<cr>
nnoremap <leader>gs :<c-u>GitGutterStageHunk<cr>

nnoremap / :<c-u>set<space>hlsearch<cr>/
nnoremap ? :<c-u>set<space>hlsearch<cr>?

nnoremap <leader>c+ :<c-u>set cole=1<cr>
nnoremap <leader>c- :<c-u>set cole=0<cr>
nnoremap <leader>cc :<c-u>set <c-r>=&cole ? 'cole=0' : 'cole=1'<cr><cr>

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

vmap v     <plug>(expand_region_expand)
vmap <c-v> <plug>(expand_region_shrink)

syntax enable
syntax sync fromstart

let &background = 'dark'

source ~/.vim/configs/solarized.conf.vim
colorscheme solarized

highlight! link SignColumn LineNr

" highlight matchparen   cterm=underline ctermbg=none
highlight CursorLineNr ctermbg=none cterm=bold
highlight       LineNr ctermbg=none
highlight Search       ctermfg=1 cterm=underline
highlight Incsearch    ctermfg=1 cterm=underline

" auto BufRead,BufNewFile *.cmake    let &filetype = 'cmake'
auto BufRead,BufNewFile *.cpp.cmake let &filetype = 'cpp'
auto BufRead,BufNewFile *.hpp.cmake let &filetype = 'cpp'
auto BufRead,BufNewFile *.launch    let &filetype = 'xml'
auto BufRead,BufNewFile *.md        let &filetype = 'markdown'
auto BufRead,BufNewFile *.plt       let &filetype = 'gnuplot'
auto BufRead,BufNewFile .tmux.conf  let &filetype = 'tmux'

auto BufWritePre * :%s/\s\+$//ge

auto BufEnter * :syntax sync fromstart

auto filetype cpp syntax match cppSymbol "[.:;,]"
highlight cppSymbol ctermfg=13

" auto filetype scheme syntax keyword function
"  \ any
"  \ equals?
"  \ equivalent?
"  \ evaluate
"  \ every
"  \ find
"  \ identifier=?
"  \ identifier?
"  \ identity
"  \ length*
"  \ procedure-from
"  \ undefined
"  \ unspecified
"
" auto filetype scheme syntax keyword keyword
"  \ conditional
"
" auto filetype scheme syntax keyword macro
"  \ unhygienic-macro-transformer
"  \            macro-transformer
"  \ er-macro-transformer explicit-renaming-macro-transformer
"  \ ir-macro-transformer implicit-renaming-macro-transformer
"  \ rsc-macro-transformer reversed-syntactic-closure-macro-transformer
"  \  sc-macro-transformer          syntactic-closure-macro-transformer
"  \ conditionally-expand
"  \ fork

auto filetype scheme syntax keyword macro fork

auto filetype scheme let &lispwords = '
      \ begin,
      \ case,
      \ cond,
      \ define,
      \ define-syntax,
      \ delay,
      \ do,
      \ fork,
      \ lambda,
      \ let*,
      \ let,
      \ let-syntax,
      \ letrec,
      \ letrec-syntax,
      \ quasiquote,
      \ quote,
      \ set!,
      \ syntax-rules,
      \ unquote,
      \ unquote-splicing,
      \'

      "\ =>,
      "\ and,
      "\ else,
      "\ if,
      "\ or,

let g:is_bash = 1

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

command! DeleteAnsiEscapeSequence %s/\[[0-9;]*m//g$

