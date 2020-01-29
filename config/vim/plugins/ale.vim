" Asynchronous Lint Engine (ALE)
" Limit linters used for JavaScript.
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'typescript': ['tsserver', 'tslint'],
\  'vue': ['eslint'],
\}
let g:ale_fixers = {
\  'javascript': ['eslint'],
\  'typescript': ['prettier'],
\  'vue': ['eslint'],
\  'scss': ['prettier'],
\  'html': ['prettier'],
\}
let g:ale_sign_column_always = 1
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_open_list = 1

" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
" let g:ale_keep_list_window_open = 1

let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
" Enable completion where available.
let g:ale_completion_enabled = 1
nmap <F7> <Plug>(ale_fix)
nnoremap <leader>l :ALELint<cr>
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_list_window_size = 10
