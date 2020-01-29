call plug#begin()

" general
Plug 'tpope/vim-sensible' 

Plug 'beloglazov/vim-online-thesaurus'
let g:online_thesaurus_map_keys = 0
nnoremap <leader>xk :OnlineThesaurusCurrentWord<CR>

Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-apathy'

" editing
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular' 
Plug 'AndrewRadev/splitjoin.vim'

" mapping
Plug 'tpope/vim-unimpaired'

" search and replace
Plug 'tpope/vim-abolish'

Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nb :NERDTreeFromBookmark
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nj :NERDTree-C-J<CR>
nnoremap <leader>nk :NERDTree-C-K<CR>

Plug 'ctrlpvim/ctrlp.vim'
so ~/dotfiles/config/vim/plugins/ctrlp.vim

" Vim motions on speed!
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap <Leader>s <Plug>(easymotion-overwin-f)
" or `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <Leader>s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

Plug 'kshenoy/vim-signature'
Plug 'wellle/targets.vim'

" Disables the arrow keys, the hjkl keys, the page up/down keys, 
" and a handful of other keys which allow one to rely on character-wise navigation
Plug 'wikitopian/hardmode'
" enable hard mode by default
let g:HardMode_level = 'wannabe'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

Plug 'majutsushi/tagbar'
nnoremap <f8> :TagbarToggle<cr>

Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

Plug 'yggdroot/indentline'
let g:indentLine_enabled = 0
map <F10> :IndentLinesToggle<CR>

" language
Plug 'elzr/vim-json'
Plug 'moll/vim-node'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'jparise/vim-graphql'

" Tsuquyomi works as a client for TSServer 
" (which is an editor service bundled into TypeScript)
Plug 'Quramy/tsuquyomi'
" Rename symbols
" You can rename the identifier under the cursor to a new name
autocmd FileType typescript nmap <buffer> <Leader>e <Plug>(TsuquyomiRenameSymbol)
" If you want to rename identifiers including in comments, you can use :TsuRenameSymbolC command
autocmd FileType typescript nmap <buffer> <Leader>E <Plug>(TsuquyomiRenameSymbolC)
" Tsuquyomi can display tooltip window about symbol under the mouse cursor
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

Plug 'leafgarland/typescript-vim'
" svelte
Plug 'evanleck/vim-svelte'

" javascript
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'

Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0
highlight link xmlEndTag xmlTag

" commands
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" source code
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Syntax checking
Plug 'w0rp/ale'
so ~/dotfiles/config/vim/plugins/ale.vim

Plug 'chiel92/vim-autoformat'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'json', 'typescript'] }

Plug 'mileszs/ack.vim'

Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
" enable keyboard shortcuts
let g:tern_map_prefix='<leader>'
let g:tern_map_keys=1
" show argument hints
let g:tern_show_argument_hints='on_hold'

" completion
Plug 'Valloric/YouCompleteMe'
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

Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,javascript.jsx,typescript EmmetInstall

" others
Plug 'Raimondi/delimitMate'

call plug#end()
