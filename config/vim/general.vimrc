" INTERFACE
colorscheme distinguished
set background=dark
set t_Co=256

" SYNTAX HIGHLIGHT
syntax on

" ENABLE FILETYPE PLUGINS
filetype plugin on
filetype indent on

" INDENTATION & TAB
set ai " Auto indent
set si " Smart indent
set wrap " Wrap lines
set expandtab " Use spaces instead of tabs
set smarttab
" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" LINE NUMBER
set number
set relativenumber

" navigate away from a modified file without first saving it
set hidden

" Set working directory to the current file
" autocmd BufEnter * silent! lcd %:p:h

set pastetoggle=<f5>
"set mouse=a
set encoding=utf-8
" Use Unix as the standard file type
set ffs=unix,dos,mac

" FOLDING
set foldlevel=99
set foldmethod=syntax
set foldcolumn=1
" set foldlevelstart=3
let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" SEARCH
"
" Makes search act like search in modern browsers
" set incsearch
" Highlight search results
set hls
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase

" CHECKTIME
"
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

" GRAMMAR
" set the dictionary
set dictionary+=/usr/share/dict/words

" set clipboard=unnamed

set list!
set listchars=tab:>·,trail:~,extends:>,precedes:<

" treat all numerals as decimal, regardless of whether they are padded with zeros.
set nrformats=

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
  set wildignore+=.git\*,.hg\*,.svn\*
endif

" Automatically removing all trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

set wildmode=longest,list

" populate the argument list with each of the files named in the quickfix list
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
" automatically execute ctags each time a file is saved
" :autocmd BufWritePost * call system("ctags -R")
