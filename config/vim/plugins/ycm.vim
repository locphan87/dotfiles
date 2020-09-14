let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview
let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_semantic_triggers = {
"    \ 'typescript' : ['.'],
"    \}
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
