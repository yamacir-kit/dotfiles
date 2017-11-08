nnoremap ; :
" nnoremap \! :<c-u>!
nnoremap Y y$
nnoremap x "_x
nnoremap + <c-a>
nnoremap - <c-x>

" nnoremap j gjzz
" nnoremap k gkzz

" nnoremap <down>     gjzz
" nnoremap <up>       gkzz
" nnoremap <pagedown> <pagedown>zz
" nnoremap <pageup>   <pageup>zz

" nnoremap <silent> <leader>gt  :<c-u>GitGutterToggle<cr>            " toggle
nnoremap <leader>gs  :<c-u>GitGutterStageHunk<cr>         " stage
nnoremap <leader>gr  :<c-u>GitGutterUndoHunk<cr>          " revert
nnoremap <leader>gn  :<c-u>GitGutterNextHunk<cr>          "

nnoremap <leader>gcv :!git<space>commit<space>-v<cr>      " commit
nnoremap <leader>gca :!git<space>commit<space>--amend<cr> " commit

nnoremap <leader>def :YcmCompleter<space>GoTo<cr>


inoremap ""  ""<left>
inoremap $$  $$<left>
inoremap ''  ''<left>
inoremap ()  ()<left>
inoremap <>  <><left>
inoremap []  []<left>
inoremap {}  {}<left>


vnoremap ;  :s/
vnoremap \! :!
vnoremap >  >gv
vnoremap <  <gv


nnoremap /  :<c-u>set<space>hlsearch<cr>/
" nnoremap ?  :<c-u>set<space>hlsearch<cr>?
" nnoremap *  :<c-u>set<space>hlsearch<cr>*
" nnoremap #  :<c-u>set<space>hlsearch<cr>#

