" INTERFACE
" colorscheme distinguished
colorscheme termschool
set background=dark
set t_Co=256

" SYNTAX HIGHLIGHT
syntax on

" ENABLE FILETYPE PLUGINS
filetype plugin on
filetype indent on

" GENERAL
set pastetoggle=<f5>
set encoding=utf-8
" Use Unix as the standard file type
set ffs=unix,dos,mac
" navigate away from a modified file without first saving it
set hidden
" Set to auto read when a file is changed from the outside
set autoread

" LINE NUMBER
set number

so ~/config/vim/general/indentation.vim
so ~/config/vim/general/folding.vim
so ~/config/vim/general/search.vim
so ~/config/vim/general/autocommands.vim
so ~/config/vim/general/abbreviations.vim
so ~/config/vim/general/others.vim
