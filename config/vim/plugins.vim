" PLUGINS

call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'

" [S] Vim script for text filtering and alignment
" https://github.com/godlygeek/tabular
" Usaage: :Tabularize /{exp}
Plug 'godlygeek/tabular'

Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'

" BEGIN MARKDOWN
" [M] Syntax highlighting, matching rules and mappings for Markdown files
" https://github.com/plasticboy/vim-markdown
Plug 'plasticboy/vim-markdown'
so $DOTFILES/config/vim/plugins/vim-markdown.vim

" [S] Markdown Preview for (Neo)vim
" https://github.com/iamcco/markdown-preview.nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
so $DOTFILES/config/vim/plugins/markdown-preview.vim

" [C] Hyperfocus-writing in Vim.
" https://github.com/junegunn/limelight.vim
Plug 'junegunn/limelight.vim'
" Goyo.vim integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" [C] Distraction-free writing in Vim
" https://github.com/junegunn/goyo.vim
Plug 'junegunn/goyo.vim'
" END MARKDOWN

" [S] Enables Jenkins DSL job syntax coloring + indentation
" https://github.com/martinda/Jenkinsfile-vim-syntax
Plug 'martinda/Jenkinsfile-vim-syntax'

" [C] A tree explorer plugin for vim
" https://github.com/preservim/nerdtree
Plug 'scrooloose/nerdtree'
so $DOTFILES/config/vim/plugins/nerdtree.vim

" [M] Vim motions on speed!
" https://github.com/easymotion/vim-easymotion
Plug 'easymotion/vim-easymotion'
so $DOTFILES/config/vim/plugins/easymotion.vim

" [M] Plugin to toggle, display and navigate marks
" https://github.com/kshenoy/vim-signature
Plug 'kshenoy/vim-signature'

" [S] Vim plugin that provides additional text objects
" Pair text objects
" Quote text objects
" Separator text objects
" Argument text objects
" Tag text objects
" https://github.com/wellle/targets.vim
Plug 'wellle/targets.vim'

" [S] Disables the arrow keys, the hjkl keys, the page up/down keys,
" and a handful of other keys which allow one to rely on character-wise navigation
Plug 'wikitopian/hardmode'
" enable hard mode by default
let g:HardMode_level = 'wannabe'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" [S] lean & mean status/tabline for vim that's light as air
" https://github.com/vim-airline/vim-airline
Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#ale#enabled = 1

" [M] A better JSON for Vim: distinct highlighting of keywords vs values,
" JSON-specific (non-JS) warnings, quote concealing
" https://github.com/elzr/vim-json
Plug 'elzr/vim-json'

" [M] Tools and environment to make Vim superb for developing with Node.js
" https://github.com/moll/vim-node
Plug 'moll/vim-node'

" [S] A Vim plugin that provides GraphQL file detection, syntax highlighting, and indentation.
" https://github.com/jparise/vim-graphql
Plug 'jparise/vim-graphql'

" [M] Tsuquyomi works as a client for TSServer
" (which is an editor service bundled into TypeScript)
" https://github.com/Quramy/tsuquyomi
Plug 'Quramy/tsuquyomi'
so $DOTFILES/config/vim/plugins/tsuquyomi.vim

" [S] Typescript syntax files for Vim
" https://github.com/leafgarland/typescript-vim
Plug 'leafgarland/typescript-vim'

" [M] Vastly improved Javascript indentation and syntax support in Vim.
" https://github.com/pangloss/vim-javascript
Plug 'pangloss/vim-javascript'
" Enables syntax highlighting for JSDocs
let g:javascript_plugin_jsdoc = 1

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Asynchronous Lint Engine (ALE)
" Limit linters used for JavaScript.
Plug 'w0rp/ale'
so $DOTFILES/config/vim/plugins/ale.vim

Plug 'chiel92/vim-autoformat'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'json', 'typescript'] }

" [M] A code-completion engine for Vim
" https://github.com/ycm-core/YouCompleteMe
Plug 'Valloric/YouCompleteMe'
so $DOTFILES/config/vim/plugins/ycm.vim

Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,javascript.jsx,typescript EmmetInstall

" [M] A command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
so $DOTFILES/config/vim/plugins/fzf.vim

call plug#end()

