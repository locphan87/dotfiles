call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'flazz/vim-colorschemes'
" Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
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

" [C] Extra syntax and highlight for nerdtree files
" https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" [M] Vim motions on speed!
" https://github.com/easymotion/vim-easymotion
Plug 'easymotion/vim-easymotion'
so $DOTFILES/config/vim/plugins/easymotion.vim

" [M] Plugin to toggle, display and navigate marks
" https://github.com/kshenoy/vim-signature
Plug 'kshenoy/vim-signature'

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

" [S] Typescript syntax files for Vim
" https://github.com/leafgarland/typescript-vim
Plug 'leafgarland/typescript-vim'

" [M] Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode
" https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
so $DOTFILES/config/vim/plugins/coc.vim
" `:CocList commands` to open the command list and choose one you need.
" Use `:CocCommand` with <tab> for command line completion
" Use <Plug>(coc-refactor) for create a refactor window of current symbol
" For rename variable across files in current cwd, use :CocSearch
" Use command :CocCommand document.renameCurrentWord to start cursors session
" with ranges contain current word.
" Use :CocList snippets to open snippets list.
" Use :CocCommand snippets.editSnippets to edit user snippet of current filetype.
" Use :CocCommand snippets.openSnippetFiles to open snippet files of current filetype.

" [M] Vastly improved Javascript indentation and syntax support in Vim.
" https://github.com/pangloss/vim-javascript
Plug 'pangloss/vim-javascript'
" Enables syntax highlighting for JSDocs
let g:javascript_plugin_jsdoc = 1

" [S] Seamless navigation between tmux panes and vim splits
" https://github.com/christoomey/vim-tmux-navigator
Plug 'christoomey/vim-tmux-navigator'

" [M] quoting/parenthesizing made simple
" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'
" Usage:
" Change surroundings: cs{x}{y}
" To go full circle (HTML tag): cst{y}
" Delete delimiters entirely: ds{x}
" Wrap a text object in parentheses: ysiw], use [ to add some space
" Wrap the entire line in parentheses: yss)
" Visual mode: S{<tag>}

" [S] enable repeating supported plugin maps with "."
" https://github.com/tpope/vim-repeat
Plug 'tpope/vim-repeat'

" [C] a Git wrapper
" https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'
" Usage: :Git calls any arbitrary Git command

" [S] Show a diff using Vim its sign column.
" https://github.com/mhinz/vim-signify
" Plug 'mhinz/vim-signify'
" Configuration for async update
" default updatetime 4000ms is not good for async update
" set updatetime=100

" [C] A Vim plugin for Prettier
" https://github.com/prettier/vim-prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
" Usage: :Prettier

" [C] emmet-vim is a vim plug-in which provides support for expanding abbreviations similar to emmet.
" https://github.com/mattn/emmet-vim
" https://emmet.io/
Plug 'mattn/emmet-vim'
" Usage: <leader>,
" Redefine trigger key <C-y>
let g:user_emmet_leader_key='<C-y>'
" Enable just for file types below
let g:user_emmet_install_global = 1
" autocmd FileType html,css,scss,javascript,typescript EmmetInstall

" [M] A command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
so $DOTFILES/config/vim/plugins/fzf.vim

" [S] Global search and replace for VI
" https://github.com/skwp/greplace.vim
Plug 'skwp/greplace.vim'
" customize command used for :Gsearch
" Usage:
" - Use `:Gsearch {searchTerm} ./` to get a buffer window of your search results
" - then you can make the replacements inside the buffer window using traditional tools (%s/foo/bar/)
" - Invoke :Greplace to make your changes across all files. It will ask you interatively y/n/a - you can hit 'a' to do all.
" - Save changes to all files with :wall (write all)
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

" [S] Track the engine.
" Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" [C] Adds file type icons to Vim plugins
" https://github.com/ryanoasis/vim-devicons
" Plug 'ryanoasis/vim-devicons'

call plug#end()

