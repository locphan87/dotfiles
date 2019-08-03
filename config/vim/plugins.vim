so ~/dotfiles/config/vim/plugins/easymotion.vim
so ~/dotfiles/config/vim/plugins/javascript.vim
so ~/dotfiles/config/vim/plugins/jsdoc.vim
so ~/dotfiles/config/vim/plugins/ctrlp.vim
so ~/dotfiles/config/vim/plugins/elmcast.vim
so ~/dotfiles/config/vim/plugins/nerdtree.vim
so ~/dotfiles/config/vim/plugins/tern.vim
so ~/dotfiles/config/vim/plugins/ale.vim
so ~/dotfiles/config/vim/plugins/youcompleteme.vim
so ~/dotfiles/config/vim/plugins/tsuquyomi.vim

let g:clj_fmt_autosave = 1

" enable hard mode by default
let g:HardMode_level = 'wannabe'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" vim-jsx
let g:jsx_ext_required = 0
highlight link xmlEndTag xmlTag

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

" vim-emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,javascript.jsx,typescript EmmetInstall
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}
