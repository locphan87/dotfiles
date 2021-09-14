Plug 'tpope/vim-sensible'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim' 
Plug 'kshenoy/vim-signature'
Plug 'elzr/vim-json'
Plug 'moll/vim-node'
Plug 'tpope/vim-fugitive'

Plug 'easymotion/vim-easymotion'
so $DOTFILES/config/vim/plugins/easymotion.vim

Plug 'scrooloose/nerdtree'
so $DOTFILES/config/vim/plugins/nerdtree.vim

Plug 'pangloss/vim-javascript'
" Enables syntax highlighting for JSDocs
let g:javascript_plugin_jsdoc = 1

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
so $DOTFILES/config/vim/plugins/fzf.vim
