colorscheme onedark
set mouse=a

" toggle between paste mode
" turn off auto-indent when pasting text
set pastetoggle=<f5>

set ffs=unix,dos,mac " use Unix as the standard file type
set hidden " navigate away from a modified file without first saving it
set number " line number

set si " smart indent
set wrap " wrap lines
set expandtab " Use spaces instead of tabs
set shiftwidth=2
set tabstop=2

" Open new stbelowplit panes to right and bottom,
" which feels more natural than Vim’s default:
set splitbelow
set splitright

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

set hls " Highlight search results
set ignorecase " Ignore case when searching
set smartcase " When searching try to be smart about cases

" Configuration for async update
" default updatetime 4000ms is not good for async update
set updatetime=100
