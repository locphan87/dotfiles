" ## ABRV
set complete+=k " enable dictionary completion source
set dictionary+=/usr/share/dict/words " add a dictionary

set nobackup
set nowb
set noswapfile

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
