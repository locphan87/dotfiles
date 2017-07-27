" jsdoc
let g:jsdoc_enable_es6=1
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1
let g:jsdoc_param_description_separator=' - '
nnoremap <leader>js :JsDoc<cr>

" vim-javascript
let g:javascript_enable_domhtmlcss = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

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

so ~/config/vim/plugins/ctrlp.vim
so ~/config/vim/plugins/elmcast.vim
so ~/config/vim/plugins/nerdtree.vim
so ~/config/vim/plugins/syntastic.vim
so ~/config/vim/plugins/tern.vim
so ~/config/vim/plugins/utilsnip.vim
so ~/config/vim/plugins/youcompleteme.vim
