" jsdoc
let g:jsdoc_enable_es6=1
let g:jsdoc_allow_input_prompt=1

" Tern
" enable keyboard shortcuts
let g:tern_map_prefix='<leader>'
let g:tern_map_keys=1
" show argument hints
let g:tern_show_argument_hints='on_hold'

" Elm
nnoremap <leader>el :ElmEvalLine<CR>
vnoremap <leader>es :<C-u>ElmEvalSelection<CR>
nnoremap <leader>em :ElmMakeCurrentFile<CR>
:au BufWritePost *.elm ElmMakeCurrentFile

" ElmCast
let g:elm_jump_to_error = 0
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 0
let g:elm_syntastic_show_warnings = 1
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 1

" tmux
" let g:tmux_navigator_no_mappings = 1
" nnoremap <silent> <c-w-h> :tmuxnavigateleft<cr>
" nnoremap <silent> <c-w-j> :tmuxnavigatedown<cr>
" nnoremap <silent> <c-w-k> :tmuxnavigateup<cr>
" nnoremap <silent> <c-w-l> :tmuxnavigateright<cr>
" nnoremap <silent> <c-w-\\> :tmuxnavigateprevious<cr>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" vim-javascript config
let g:javascript_enable_domhtmlcss = 1
let g:javascript_ignore_javaScriptdoc = 1
" let g:javascript_conceal_function       = "ƒ"
" let g:javascript_conceal_null           = "ø"
" let g:javascript_conceal_this           = "@"
" let g:javascript_conceal_return         = "⇚"
" let g:javascript_conceal_undefined      = "¿"
" let g:javascript_conceal_NaN            = "ℕ"
" let g:javascript_conceal_prototype      = "¶"
" let g:javascript_conceal_static         = "•"
" let g:javascript_conceal_super          = "Ω"
" let g:javascript_conceal_arrow_function = "⇒"

" emmet-vim config
let g:user_emmet_leader_key=','
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,js EmmetInstall

" youcompleteme config
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_semantic_triggers = {
   \ 'elm' : ['.'],
   \}
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
" execute eslint with --fix flag
let g:syntastic_javascript_eslint_args = ['--fix']
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'
let g:syntastic_auto_jump = 1
let g:syntastic_mode_map = {
  \ "mode": "passive",
  \ "active_filetypes": ["javascript"],
  \ "passive_filetypes": []
  \ }

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ }
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" vim-jsx config
let g:jsx_ext_required = 0

" scss-syntax-vim config
autocmd FileType css,scss set iskeyword+=-

" indentline config
" :IndentLinesToggle toggles lines on and off.
let g:indentLine_enabled = 0
map <F10> :IndentLinesToggle<CR>

" nerdtree config
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nb :NERDTreeFromBookmark
nnoremap <leader>nf :NERDTreeFind<CR>

" Ag configs
let g:ag_working_path_mode="r"

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<leader>np"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
