" ## ABRV
set complete+=k " enable dictionary completion source

" Disable backups and swap files
set nobackup
set nowb
set noswapfile

" Set default encoding to utf-8
set encoding=utf-8
set termencoding=utf-8

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
  set wildignore+=.git\*,.hg\*,.svn\*
endif

" avoid adding extra space when joining with a special character
set nojoinspaces

" change window title
set title titlestring=%<%F%=%l/%L-%P titlelen=70

set list!
set listchars=tab:>·,trail:~,extends:>,precedes:<
set wildmode=longest,list

" treat all numerals as decimal, regardless of whether they are padded with zeros.
set nrformats=

" Disable beep and flash
set noerrorbells visualbell t_vb=
