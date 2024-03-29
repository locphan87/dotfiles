" Dictionary
set complete+=kspell " enable dictionary completion source
set spellfile=~/.vim/spell/en.utf-8.add

" Disable backups and swap files
set nobackup
set nowb
set noswapfile

" Give more space for displaying messages.
set cmdheight=2

" Set the maximum commands recorded in history
set history=200

" Set default encoding to utf-8
set encoding=utf-8
set termencoding=utf-8

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,node_modules/**,dist/**,public/**,coverage/**,build/**
if has("win16") || has("win32")
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
  set wildignore+=.git\*,.hg\*,.svn\*
endif

" avoid adding extra space when joining with a special character
set nojoinspaces

" change window title
set title titlestring=%<%F%=%l/%L-%P titlelen=70

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

set list!
set listchars=tab:>·,trail:~,extends:>,precedes:<

" With the 'wildmenu' option enabled,
" Vim provides a navigable list of suggestions
set wildmenu
" Choosing from multiple matches
" Similar to the autocomplete menu in zsh)
set wildmode=full

" treat all numerals as decimal, regardless of whether they are padded with zeros.
" As of version 8.0 of Vim, the 'nrformats' setting excludes the octal option
" by default, which avoids this whole area of confusion.
set nrformats=

" Disable beep and flash
" No annoying sound on errors
set noerrorbells novisualbell t_vb= tm=500
autocmd GUIEnter * set visualbell t_vb=
set belloff=all
