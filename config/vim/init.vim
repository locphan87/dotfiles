call plug#begin()

" general
Plug 'tpope/vim-sensible'
Plug 'beloglazov/vim-online-thesaurus'
Plug 'flazz/vim-colorschemes'

" editing
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular' " TODO
Plug 'styled-components/vim-styled-components'

" mapping
Plug 'tpope/vim-unimpaired'

" search and replace
Plug 'tpope/vim-abolish'

" navigation
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
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
Plug 'Quramy/tsuquyomi' " TODO
Plug 'leafgarland/typescript-vim' " TODO
Plug 'HerringtonDarkholme/yats.vim' " TODO
Plug 'reasonml-editor/vim-reason'

" template
Plug 'lumiliet/vim-twig'
Plug 'statianzo/vim-jade'

" javascript
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'heavenshell/vim-jsdoc'

" commands
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" source code
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'ruanyl/vim-gh-line'

" Syntax checking
" Plug 'flowtype/vim-flow'
" Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }

" integration
Plug 'mileszs/ack.vim'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'rizzatti/dash.vim'

" css
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'

" completion
Plug 'valloric/youcompleteme'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'

" others
Plug 'Raimondi/delimitMate'

call plug#end()
