so ~/config/vim/plugins/easymotion.vim
so ~/config/vim/plugins/javascript.vim
so ~/config/vim/plugins/jsdoc.vim
so ~/config/vim/plugins/prettier.vim
so ~/config/vim/plugins/ctrlp.vim
so ~/config/vim/plugins/elmcast.vim
so ~/config/vim/plugins/nerdtree.vim
so ~/config/vim/plugins/tern.vim
so ~/config/vim/plugins/utilsnip.vim
so ~/config/vim/plugins/youcompleteme.vim
so ~/config/vim/plugins/ale.vim

" enable hard mode by default
let g:HardMode_level = 'wannabe'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" vim-jsx
let g:jsx_ext_required = 0

" scss-syntax-vim
autocmd FileType css,scss set iskeyword+=-

" indentline
let g:indentLine_enabled = 0
map <F10> :IndentLinesToggle<CR>

" vim-online-thesaurus
let g:online_thesaurus_map_keys = 0
nnoremap <leader>xk :OnlineThesaurusCurrentWord<CR>

" tagbar
nnoremap <f8> :TagbarToggle<cr>

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

