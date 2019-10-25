call plug#begin()

" general
Plug 'tpope/vim-sensible' " MUST HAVE
Plug 'beloglazov/vim-online-thesaurus'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-apathy'

" editing
Plug 'tpope/vim-commentary' " MUST HAVE
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular' " TODO
Plug 'AndrewRadev/splitjoin.vim'

" mapping
Plug 'tpope/vim-unimpaired'

" search and replace
Plug 'tpope/vim-abolish'

" navigation
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim' " MUST HAVE
Plug 'easymotion/vim-easymotion'
Plug 'kshenoy/vim-signature'
Plug 'wellle/targets.vim' " TODO
Plug 'wikitopian/hardmode'

" interface
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'yggdroot/indentline'

" language
Plug 'elzr/vim-json'
Plug 'moll/vim-node'
Plug 'elmcast/elm-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'jparise/vim-graphql'
" typescript
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
" clojure
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-static'
" Plug 'guns/vim-sexp'
Plug 'tpope/vim-classpath'
Plug 'vim-scripts/paredit.vim'
" coffeescript
Plug 'kchmck/vim-coffee-script'
" svelte
Plug 'evanleck/vim-svelte'

" template
Plug 'lumiliet/vim-twig'
Plug 'statianzo/vim-jade'

" javascript
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" Plug 'heavenshell/vim-jsdoc'

" commands
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" source code
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'ruanyl/vim-gh-line'

" Syntax checking
Plug 'w0rp/ale'
Plug 'venantius/vim-cljfmt'
Plug 'chiel92/vim-autoformat'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'json', 'typescript'] }

" integration
Plug 'mileszs/ack.vim'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" css
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'

" completion
Plug 'Valloric/YouCompleteMe'
Plug 'mattn/emmet-vim'

" others
Plug 'Raimondi/delimitMate'

call plug#end()
