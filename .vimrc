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
Plugin 'bfrg/vim-cpp-modern'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'nickhutchinson/vim-cmake-syntax'
Plugin 'rhysd/clever-f.vim'
Plugin 'terryma/vim-expand-region'
Plugin 'thinca/vim-quickrun'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tyru/caw.vim'

call vundle#end()

filetype plugin indent on

source ~/.vim/configs/quickrun.conf.vim
source ~/.vim/configs/vim-cpp-modern.conf.vim
source ~/.vim/configs/youcompleteme.conf.vim

let                 &encoding = 'utf-8'
let &fileencoding = &encoding
let &ambiwidth = 'double'

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

autocmd filetype scheme setlocal autoindent lisp
autocmd filetype c,cpp setlocal cindent
let &cinoptions = 'Ls,:0,=s,g0,N-s,#N,(0,us,U42,w42,Ws,m42'

let &foldmethod = 'indent'
let &foldignore = ''
let &foldlevel = 1

let &sidescroll = 1
let     &scrolloff = 128
let &sidescrolloff =  16

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
let &regexpengine = 1

let &background = 'light'

source ~/.vim/configs/solarized.conf.vim
colorscheme solarized

" highlight matchparen   cterm=underline ctermbg=none
highlight cursorlinenr cterm=bold
highlight linenr       ctermbg=none
highlight search       ctermfg=1 cterm=underline
highlight incsearch    ctermfg=1 cterm=underline

" autocmd BufRead,BufNewFile *.cmake    let &filetype = 'cmake'
autocmd bufread,bufnewfile *.cpp.cmake let &filetype = 'cpp'
autocmd bufread,bufnewfile *.hpp.cmake let &filetype = 'cpp'
autocmd bufread,bufnewfile *.launch    let &filetype = 'xml'
autocmd bufread,bufnewfile *.md        let &filetype = 'markdown'
autocmd bufread,bufnewfile *.plt       let &filetype = 'gnuplot'
autocmd bufread,bufnewfile .tmux.conf  let &filetype = 'tmux'

autocmd filetype cpp syntax match cppSymbol "[.:;,]"
highlight cppSymbol ctermfg=13

" autocmd filetype scheme syntax keyword function
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
" autocmd filetype scheme syntax keyword keyword
"  \ conditional
"
" autocmd filetype scheme syntax keyword macro
"  \ unhygienic-macro-transformer
"  \            macro-transformer
"  \ er-macro-transformer explicit-renaming-macro-transformer
"  \ ir-macro-transformer implicit-renaming-macro-transformer
"  \ rsc-macro-transformer reversed-syntactic-closure-macro-transformer
"  \  sc-macro-transformer          syntactic-closure-macro-transformer
"  \ conditionally-expand
"  \ fork

aut filetype scheme syntax keyword macro fork

au filetype scheme let &lispwords = '
      \ =>,
      "\ and,
      \ begin,
      \ case,
      \ cond,
      \ define,
      \ define-syntax,
      \ delay,
      \ do,
      "\ else,
      \ fork,
      "\ if,
      \ lambda,
      \ let*,
      \ let,
      \ let-syntax,
      \ letrec,
      \ letrec-syntax,
      "\ or,
      \ quasiquote,
      \ quote,
      \ set!,
      \ syntax-rules,
      \ unquote,
      \ unquote-splicing,
      \'

let g:is_bash = 1

autocmd BufWritePre * :%s/\s\+$//ge

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

command! DeleteAnsiEscapeSequence %s/\[[0-9;]*m//g$

