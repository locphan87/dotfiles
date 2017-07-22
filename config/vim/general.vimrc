set nocompatible
set t_Co=256
syntax on

" Enable filetype plugins
filetype plugin on
filetype indent on

set relativenumber
set background=dark

" navigate away from a modified file without first saving it
set hidden

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Set working directory to the current file
" autocmd BufEnter * silent! lcd %:p:h

colorscheme distinguished
set pastetoggle=<f5>
"set mouse=a
map <F7> mzgg=G`z
set encoding=utf-8

" Folding
set foldlevel=99
set foldmethod=syntax
" set foldlevelstart=3
let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Ignore case when searching
set ignorecase

" Makes search act like search in modern browsers
set incsearch

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hls

" set autowriteall
" :au FocusLost * silent! wa
" let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode

" Set to auto read when a file is changed from the outside
set autoread

" check file change every 4 seconds ('CursorHold') and reload the buffer
" upon detecting change
au CursorHold * checktime

" add an autocmd after vim started to execute checktime for *.js files on write
au VimEnter *.js au BufWritePost *.js checktime

" avaoid adding extra space when joining with a special character
set nojoinspaces

" change window title
set title titlestring=%<%F%=%l/%L-%P titlelen=70

" set the dictionary
set dictionary+=/usr/share/dict/words

" vim online thesaurus
let g:online_thesaurus_map_keys = 0
nnoremap <leader>xk :OnlineThesaurusCurrentWord<CR>
