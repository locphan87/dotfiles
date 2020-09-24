call plug#begin()

" [M] Defaults everyone can agree on
" https://github.com/tpope/vim-sensible
Plug 'tpope/vim-sensible'

" [S] one stop shop for vim colorschemes.
" https://github.com/flazz/vim-colorschemes
Plug 'flazz/vim-colorschemes'

" Plug 'tpope/vim-apathy'

" [M] comment stuff out
" https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'
" Usage:
" gc{x} to comment out the target of a motion (x)
" You can also use it as a command
" - either with a range like :7,17Commentary
" - or as part of a :global invocation like with :g/TODO/Commentary

" [S] Vim script for text filtering and alignment
" https://github.com/godlygeek/tabular
" Usaage: :Tabularize /{exp}
Plug 'godlygeek/tabular'

" [S] Switch between single-line and multiline forms of code
" https://github.com/AndrewRadev/splitjoin.vim
Plug 'AndrewRadev/splitjoin.vim'
" Usage:
" gS to split a one-liner into multiple lines
" gJ to join a block into a single-line statement.

" [S] Pairs of handy bracket mappings
" https://github.com/tpope/vim-unimpaired
Plug 'tpope/vim-unimpaired'
" NEXT & PREVIOUS
" Argument list
" - [a     |:previous|
" - ]a     |:next|
" - [A     |:first|
" - ]A     |:last|
" Buffer list
" - [b     |:bprevious|
" - ]b     |:bnext|
" - [B     |:bfirst|
" - ]B     |:blast|
" Location list
" - [l     |:lprevious|
" - ]l     |:lnext|
" - [L     |:lfirst|
" - ]L     |:llast|
" Quickfix list
" - [q     |:cprevious|
" - ]q     |:cnext|
" - [Q     |:cfirst|
" - ]Q     |:clast|
" Tag list
" - [t     |:tprevious|
" - ]t     |:tnext|
" - [T     |:tfirst|
" - ]T     |:tlast|
" - [f     Go to the file preceding the current one alphabetically in the current file's directory.
" - ]f     Go to the file succeeding the current one alphabetically in the current file's directory.
" LINE OPERATIONS
" - [<Space> Add [count] blank lines above the cursor.
" - ]<Space> Add [count] blank lines below the cursor.
" - [e Exchange the current line with [count] lines above it.
" - ]e Exchange the current line with [count] lines below it.
" PASTING
" >p    Paste after linewise, increasing indent.
" >P    Paste before linewise, increasing indent.
" <p    Paste after linewise, decreasing indent.
" <P    Paste before linewise, decreasing indent.
" =p    Paste after linewise, reindenting.
" =P    Paste before linewise, reindenting.

" [S] easily search for, substitute, and abbreviate multiple variants of a word
" https://github.com/tpope/vim-abolish
Plug 'tpope/vim-abolish'
" Usage:
" Substitution: :Subvert
" Abbreviation: :Abolish
" Coercion
" - crs       - coerce to snake_case
" - crm       - coerce to MixedCase
" - crc       - coerce to camelCase
" - cru       - coerce to UPPER_CASE
" - cr        - coerce to dash-case
" - cr.       - coerce to dot.case
" - crt       - coerce to Title Case
" - cr<space> - coerce to space case

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

" [M] Vim plugin that provides additional text objects
" https://github.com/wellle/targets.vim
" https://github.com/wellle/targets.vim/blob/master/cheatsheet.md
Plug 'wellle/targets.vim'
" Usage:
" Pair text objects
" - in pair i{x}
" - a pair a{x}
" - inside pair I{x}
" - around pair A{x}
" - next and last pair in{x} il{x}
" - pair seek: executed when the cursor is not positioned inside a pair, in only seeks on the current line
" Quote text objects
" - work over multiple lines and support seeking
" - supported separators: ' " `
" Separator text objects
" - work over multiple lines and support seeking
" - supported separators: , . ; : + - = ~ _ * # / | \ & $
" Argument text objects: {x}a
" Multi Text Objects
" - Any block {x}b
" - Any quote {x}q

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

" Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode
" https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
so $DOTFILES/config/vim/plugins/coc.vim

" [M] Vastly improved Javascript indentation and syntax support in Vim.
" https://github.com/pangloss/vim-javascript
Plug 'pangloss/vim-javascript'
" Enables syntax highlighting for JSDocs
let g:javascript_plugin_jsdoc = 1

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
Plug 'mhinz/vim-signify'
" Configuration for async update
" default updatetime 4000ms is not good for async update
set updatetime=100

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
" Redefine trigger key
let g:user_emmet_leader_key=','
" Enable just for file types below
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,javascript,typescript EmmetInstall

" [M] A command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
so $DOTFILES/config/vim/plugins/fzf.vim

call plug#end()

