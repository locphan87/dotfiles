" ## BASICS
colorscheme termschool

set pastetoggle=<f5>
set encoding=utf-8

set ffs=unix,dos,mac " use Unix as the standard file type
set hidden " navigate away from a modified file without first saving it
set autoread " set to auto read when a file is changed from the outside
set number " line number

" ## INDENTATION
set ai " auto indent
set si " smart indent
set wrap " wrap lines
set expandtab " Use spaces instead of tabs
set smarttab
set shiftwidth=2
set tabstop=2

" ## FOLDING
set foldlevel=99
set foldmethod=indent
set foldcolumn=1
" set foldlevelstart=1
let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

" ## SEARCH
set incsearch " Makes search act like search in modern browsers
set hls " Highlight search results
set ignorecase " Ignore case when searching
set smartcase " When searching try to be smart about cases
