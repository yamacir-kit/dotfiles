if &compatible
  set nocompatible
endif

set noswapfile
set clipboard+=unnamed

set ttyfast

nnoremap ; :
nnoremap Y y$

nnoremap + <C-a>
nnoremap - <C-x>

imap <> <><left>
imap {} {}<left>
imap [] []<left>
imap () ()<left>
imap "" ""<left>
imap '' ''<left>
imap /* /*  */<left><left><left>

set number 
set title
set cursorline

set ambiwidth=double

set expandtab
set tabstop=2
set shiftwidth=2
set smarttab
set smartindent

set confirm
set hidden
set autoread

set showmatch
set showmode
set matchtime=1

set splitbelow
set splitright

syntax on
set t_Co=256
set background=dark
colorscheme autumn_flavors

filetype plugin indent on

set encoding=utf-8
set nobackup

set foldmethod=indent

set virtualedit=block
set ignorecase

let g:quickrun_config = {
\   "cpp/g++" : {
\       "cmdopt" : "-std=c++0x -Wall",
\       "hook/time/enable" : 1
\   },
\
\   "tex" : {
\       "command" : "latexmk",
\       "outputter" : "error",
\       "outputter/error/success" : "null",
\       "outputter/error/error" : "quickfix",
\       "srcfile" : expand("%"),
\       "cmdopt" : "-pdfdvi -pv",
\       "hook/sweep/files" : [
\           "%S:p:r.aux",
\           "%S:p:r.bbl",
\           "%S:p:r.blg",
\           "%S:p:r.dvi",
\           "%S:p:r.fdb_latexmk",
\           "%S:p:r.fls",
\           "%S:p:r.log",
\           "%S:p:r.out"
\       ],
\       "exec" : "%c %o %a %s",
\   }
\}
