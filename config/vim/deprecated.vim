"set mouse=a
" Set working directory to the current file
" autocmd BufEnter * silent! lcd %:p:h

" set clipboard=unnamed
" automatically execute ctags each time a file is saved
" :autocmd BufWritePost * call system("ctags -R")
"
" No annoying sound on errors
" set noerrorbells
" set novisualbell
" set t_vb=
" set tm=500
" map \ ,
" search for the current selection
" xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
" xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
"
" Elm
" nnoremap <leader>el :ElmEvalLine<CR>
" vnoremap <leader>es :<C-u>ElmEvalSelection<CR>
" nnoremap <leader>em :ElmMakeCurrentFile<CR>
" :au BufWritePost *.elm ElmMakeCurrentFile
