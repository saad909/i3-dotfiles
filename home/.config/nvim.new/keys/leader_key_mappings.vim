" ----------------------mappings for running python files-----------------------------------
autocmd FileType python map <F9> <esc>:w<CR>:'!python3 shellescape(@%, 1)'<CR>
autocmd FileType python imap <F9> <esc>:w<CR>:'!python3 shellescape(@%, 1)'<CR>
" for running main.py
autocmd FileType python map <F10> <esc>:w<CR>:exec '!python3 main.py'<CR>

" ----------------------Plugins-----------------------------------
map <leader>/ :call Comment()<CR>
vm <leader>/ :call Comment()<CR>
" fzf buffer search
map <silent> <leader>q :Buffers<CR>
" ----------------------coc mappings-----------------------------------
" explorer
map <silent> <leader>e :CocCommand explorer --toggle --sources=file+<CR>
" ------------------------ scripts ----------------------------------
" compiler
map <leader>c  :w! \| !compiler "%"<CR>
