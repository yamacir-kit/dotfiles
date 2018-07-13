nnoremap ; :
nnoremap Y y$
nnoremap x "_x
nnoremap + <c-a>
nnoremap - <c-x>

nnoremap <leader>gs  :<c-u>GitGutterStageHunk<cr>         " stage
nnoremap <leader>gr  :<c-u>GitGutterUndoHunk<cr>          " revert
nnoremap <leader>gn  :<c-u>GitGutterNextHunk<cr>          "

nnoremap <leader>gcv :!git<space>commit<space>--verbose<cr> " commit
nnoremap <leader>gca :!git<space>commit<space>--amend<cr>   " commit

nnoremap <leader>def :YcmCompleter<space>GoTo<cr>

nnoremap /  :<c-u>set<space>hlsearch<cr>/
nnoremap ?  :<c-u>set<space>hlsearch<cr>?


inoremap ""  ""<left>
inoremap $$  $$<left>
inoremap ''  ''<left>
inoremap ()  ()<left>
inoremap <>  <><left>
inoremap []  []<left>
inoremap {}  {}<left>

inoremap /**  /**<cr><left><left><bs><right><right><cr><bs>/<up>


vnoremap ;  :s/
" vnoremap \! :!
vnoremap >  >gv
vnoremap <  <gv

