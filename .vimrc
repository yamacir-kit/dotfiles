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

" set regexpengine=1

auto filetype scheme setlocal autoindent lisp
auto FileType scheme setlocal iskeyword=@,33,35-38,42-43,45-58,60-64,94,_,126
auto FileType scheme set complete+=k~/.meevax_completions

auto filetype c,cpp setlocal cindent
let &cinoptions = '>s,Ls,:0,=s,l1,g0,hs,N0,E0,ps,t0,is,+s,c3,/0,(0,us,U1,w1,Ws,m0,#0'
set cinkeys-=0#

let &foldmethod = 'indent'
let &foldignore = ''
auto filetype c,cpp  let &foldlevel = 1
auto filetype scheme let &foldlevel = 0

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
" syntax sync fromstart

let &background = 'dark'

source ~/.vim/configs/solarized.conf.vim
colorscheme solarized

highlight! link SignColumn LineNr

" highlight matchparen   cterm=underline ctermbg=none
highlight CursorLineNr ctermbg=none cterm=bold
highlight       LineNr ctermbg=none
highlight Search       ctermfg=1 cterm=underline
highlight Incsearch    ctermfg=1 cterm=underline
highlight Comment      cterm=italic
highlight Todo         cterm=bold,italic
highlight Folded       ctermfg=11 ctermbg=none cterm=italic

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

auto filetype scheme syntax keyword function
  \ any
  \ binary-port?
  \ boolean=?
  \ bound-identifier=?
  \ construct-identifier
  \ eager
  \ error
  \ every
  \ exact
  \ exact-complex?
  \ exact-integer?
  \ find
  \ finite?
  \ free-identifier=?
  \ generate-identifier
  \ identifier->symbol
  \ identifier=?
  \ identifier?
  \ identity
  \ inexact
  \ infinite?
  \ length*
  \ make-syntactic-closure
  \ print
  \ symbol=?
  \ syntactic-closure
  \ syntactic-closure?
  \ syntactic-continuation?
  \ syntactic-keyword?
  \ textual-port?
  \ throw
  \ unspecified
  \ unwrap-syntax

auto filetype scheme syntax keyword keyword
  \ check
  \ lazy
  \ syntax
  \ unless
  \ when

auto filetype scheme syntax keyword macro
  \ er-macro-transformer
  \ fork-with-current-syntactic-continuation
  \ fork/csc
  \ ir-macro-transformer
  \ rsc-macro-transformer
  \ sc-macro-transformer
  \ syntax-quote

auto filetype scheme let &lispwords = '
  \ begin,
  \ case,
  \ define,
  \ define-library,
  \ define-record-type,
  \ define-syntax,
  \ delay,
  \ do,
  \ fork,
  \ lambda,
  \ let*,
  \ let,
  \ let-syntax,
  \ letrec*,
  \ letrec,
  \ letrec-syntax,
  \ make-parameter,
  \ parameterize,
  \ quasiquote,
  \ quote,
  \ receive,
  \ set!,
  \ syntax-rules,
  \ unless,
  \ unquote,
  \ unquote-splicing,
  \ when,
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
