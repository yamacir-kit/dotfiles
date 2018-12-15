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
Plugin 'nickhutchinson/vim-cmake-syntax'
Plugin 'terryma/vim-expand-region'
Plugin 'thinca/vim-quickrun'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tyru/caw.vim'

call vundle#end()

filetype plugin indent on

source ~/.vim/configs/quickrun.conf.vim
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

set number
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

set cindent
let &cinoptions = 'g0,:0,N-s,#N'

let &foldmethod = 'indent'
let &foldignore = ''
let &foldlevel = 42

let &sidescroll = 1
let &scrolloff = 4

set showmatch
let &matchtime = 1

let &virtualedit = 'block'

set incsearch ignorecase smartcase wrapscan

set splitbelow

set wildmenu
let &wildmode = 'longest:full,full'

" set cursorline
if (exists('+colorcolumn'))
  " let &colorcolumn = 80
endif

nnoremap ; :
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

inoremap ""  ""<left>
inoremap $$  $$<left>
inoremap ''  ''<left>
inoremap ()  ()<left>
inoremap <>  <><left>
inoremap []  []<left>
inoremap {}  {}<left>

vnoremap ;  :s/
vnoremap >  >gv
vnoremap <  <gv

vmap v     <plug>(expand_region_expand)
vmap <c-v> <plug>(expand_region_shrink)

syntax enable
let &background = 'light'

source ~/.vim/configs/solarized.conf.vim
colorscheme solarized

highlight MatchParen ctermbg=none
highlight LineNr     ctermbg=none
highlight Search     cterm=underline
highlight IncSearch  cterm=underline

autocmd BufRead,BufNewFile *.cmake    let &filetype = 'cmake'
autocmd BufRead,BufNewFile *.launch   let &filetype = 'xml'
autocmd BufRead,BufNewFile *.md       let &filetype = 'markdown'
autocmd BufRead,BufNewFile *.mvx      let &filetype = 'lisp'
autocmd BufRead,BufNewFile .tmux.conf let &filetype = 'tmux'

autocmd BufWritePre * :%s/\s\+$//ge

