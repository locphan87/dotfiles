" PLUGINS

call plug#begin()

Plug 'tpope/vim-sensible'

Plug 'beloglazov/vim-online-thesaurus'
let g:online_thesaurus_map_keys = 0
nnoremap <leader>xk :OnlineThesaurusCurrentWord<CR>

Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'

Plug 'plasticboy/vim-markdown'
so $DOTFILES/config/vim/plugins/vim-markdown.vim

" enables Jenkins DSL job syntax coloring + indentation
" https://github.com/martinda/Jenkinsfile-vim-syntax
Plug 'martinda/Jenkinsfile-vim-syntax'

" Hyperfocus-writing in Vim.
" https://github.com/junegunn/limelight.vim
Plug 'junegunn/limelight.vim'

" Distraction-free writing in Vim
" https://github.com/junegunn/goyo.vim
Plug 'junegunn/goyo.vim'

" Markdown Preview for (Neo)vim
" https://github.com/iamcco/markdown-preview.nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
so $DOTFILES/config/vim/plugins/markdown-preview.vim

Plug 'scrooloose/nerdtree'
so $DOTFILES/config/vim/plugins/nerdtree.vim

Plug 'ctrlpvim/ctrlp.vim'
so $DOTFILES/config/vim/plugins/ctrlp.vim

Plug 'easymotion/vim-easymotion'
so $DOTFILES/config/vim/plugins/easymotion.vim

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

" A better JSON for Vim: distinct highlighting of keywords vs values,
" JSON-specific (non-JS) warnings, quote concealing
" https://github.com/elzr/vim-json
Plug 'elzr/vim-json'

Plug 'moll/vim-node'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'jparise/vim-graphql'

Plug 'Quramy/tsuquyomi'
so $DOTFILES/config/vim/plugins/tsuquyomi.vim

Plug 'leafgarland/typescript-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'

Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0
highlight link xmlEndTag xmlTag

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

Plug 'w0rp/ale'
so $DOTFILES/config/vim/plugins/ale.vim

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

Plug 'Valloric/YouCompleteMe'
so $DOTFILES/config/vim/plugins/ycm.vim

Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,javascript.jsx,typescript EmmetInstall

" others
Plug 'Raimondi/delimitMate'

" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

