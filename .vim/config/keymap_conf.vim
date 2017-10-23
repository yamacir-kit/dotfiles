" -- Normal ----------------------------------------------------
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
nnoremap <silent> <leader>gs  :<c-u>GitGutterStageHunk<cr>         " stage
nnoremap <silent> <leader>gr  :<c-u>GitGutterUndoHunk<cr>          " revert
nnoremap <silent> <leader>gn  :<c-u>GitGutterNextHunk<cr>          "
nnoremap <silent> <leader>gcv :!git<space>commit<space>-v<cr>      " commit
nnoremap <silent> <leader>gca :!git<space>commit<space>--amend<cr> " commit

nnoremap <silent> <leader>def :YcmCompleter<space>GoTo<cr>


inoremap <>  <><left>
inoremap {}  {}<left>
inoremap []  []<left>
inoremap ()  ()<left>

inoremap ""  ""<left>
inoremap ''  ''<left>

inoremap $$  $$<left>

" inoremap <c-o> <c-o>:<c-u>

" inoremap <down>      <c-o>:<c-u>normal<space>gjzz<cr>
" inoremap <up>        <c-o>:<c-u>normal<space>gkzz<cr>
" inoremap <pagedown>  <pagedown><c-o>:<c-u>normal<space>zz<cr>
" inoremap <pageup>    <pageup><c-o>:<c-u>normal<space>zz<cr>


vnoremap ;  :s/
vnoremap \! :!
vnoremap >  >gv
vnoremap <  <gv

vmap v      <Plug>(expand_region_expand)
vmap <c-v>  <Plug>(expand_region_shrink)


nnoremap /  :<c-u>set<space>hlsearch<cr>/
" nnoremap ?  :<c-u>set<space>hlsearch<cr>?
" nnoremap *  :<c-u>set<space>hlsearch<cr>*
" nnoremap #  :<c-u>set<space>hlsearch<cr>#

