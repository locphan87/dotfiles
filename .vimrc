set nocompatible

" # KEY BINDINGS
let maplocalleader="\\"
let mapleader=","

inoremap jk <esc>

" select the current word
nnoremap <space> viw

" uppercase the current word
inoremap <c-u> <esc>viwUea
nnoremap <c-u> viwU

" avoid the cursor keys when recalling commands from history
cnoremap <c-p> <up>
cnoremap <c-n> <down>

" navigate between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" smart indentation
vnoremap < <gv
vnoremap > >gv

" Reload vim config
nnoremap <leader>ww :so $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Fast saving of a buffer
nnoremap <leader>w :up!<cr>

" remap 0 to first non-blank character
nnoremap 0 ^

" toggle paste mode on and off
nnoremap <leader>pp :setlocal paste!<cr>

" quickly insert parenthesis/brackets/etc.
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i

" surround the visual selection in parenthesis/brackets/etc.
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" selecting your pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" store and restore sessions
nnoremap <F2> :mksession! ~/vim_session <cr>
nnoremap <F3> :source ~/vim_session <cr>

" treat long lines as break lines
nnoremap k gk
nnoremap j gj

" Disable highlight
nnoremap <silent> <leader><cr> :noh<cr>

" managing tabs
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tm :tabmove

" toggle spell checking
nnoremap <leader>ss :setlocal spell!<cr>

" moving lines up and down
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" # PLUGINS
call plug#begin()

" general
Plug 'tpope/vim-sensible' 

Plug 'beloglazov/vim-online-thesaurus'
let g:online_thesaurus_map_keys = 0
nnoremap <leader>xk :OnlineThesaurusCurrentWord<CR>

Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-apathy'

" editing
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular' 
Plug 'AndrewRadev/splitjoin.vim'

" mapping
Plug 'tpope/vim-unimpaired'

" search and replace
Plug 'tpope/vim-abolish'

Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nb :NERDTreeFromBookmark
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nj :NERDTree-C-J<CR>
nnoremap <leader>nk :NERDTree-C-K<CR>

Plug 'ctrlpvim/ctrlp.vim'
so ~/dotfiles/config/vim/plugins/ctrlp.vim

" Vim motions on speed!
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap <Leader>s <Plug>(easymotion-overwin-f)
" or `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <Leader>s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

Plug 'kshenoy/vim-signature'
Plug 'wellle/targets.vim'

" Disables the arrow keys, the hjkl keys, the page up/down keys, 
" and a handful of other keys which allow one to rely on character-wise navigation
Plug 'wikitopian/hardmode'
" enable hard mode by default
let g:HardMode_level = 'wannabe'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

Plug 'majutsushi/tagbar'
nnoremap <f8> :TagbarToggle<cr>

Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

Plug 'yggdroot/indentline'
let g:indentLine_enabled = 0
map <F10> :IndentLinesToggle<CR>

" language
Plug 'elzr/vim-json'
Plug 'moll/vim-node'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'jparise/vim-graphql'

" Tsuquyomi works as a client for TSServer 
" (which is an editor service bundled into TypeScript)
Plug 'Quramy/tsuquyomi'
" Rename symbols
" You can rename the identifier under the cursor to a new name
autocmd FileType typescript nmap <buffer> <Leader>e <Plug>(TsuquyomiRenameSymbol)
" If you want to rename identifiers including in comments, you can use :TsuRenameSymbolC command
autocmd FileType typescript nmap <buffer> <Leader>E <Plug>(TsuquyomiRenameSymbolC)
" Tsuquyomi can display tooltip window about symbol under the mouse cursor
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

Plug 'leafgarland/typescript-vim'
" svelte
Plug 'evanleck/vim-svelte'

" javascript
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'

Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0
highlight link xmlEndTag xmlTag

" commands
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" source code
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Syntax checking
Plug 'w0rp/ale'
so ~/dotfiles/config/vim/plugins/ale.vim

Plug 'chiel92/vim-autoformat'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'json', 'typescript'] }

Plug 'mileszs/ack.vim'

Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
" enable keyboard shortcuts
let g:tern_map_prefix='<leader>'
let g:tern_map_keys=1
" show argument hints
let g:tern_show_argument_hints='on_hold'

" completion
Plug 'Valloric/YouCompleteMe'
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview
let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_semantic_triggers = {
"    \ 'typescript' : ['.'],
"    \}
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,javascript.jsx,typescript EmmetInstall

" others
Plug 'Raimondi/delimitMate'

call plug#end()

" # GENERAL
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

" ## INDENTATION
set ai " Auto indent
set si " Smart indent
set wrap " Wrap lines
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
Terms
" ## SEARCH
" Makes search act like search in modern browsers
set incsearch

" Highlight search results
set hls

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase
" ## AUTOCOMMANDS
" EDITTING
augroup editting
  autocmd!
  " automatically removing all trailing whitespace
  autocmd BufWritePre * %s/\s\+$//e

  " return to last edit position when opening files
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

augroup typescript
  autocmd!
  autocmd BufNewFile,BufRead *.ts set filetype=typescript
  autocmd BufNewFile,BufEnter *.tsx set filetype=typescript
  autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
augroup END

augroup javascript
  autocmd!
  autocmd BufEnter *.js set ft=javascript
augroup END

" CHECKTIME
augroup checktime
  autocmd!
  " check file change every 4 seconds ('CursorHold') and reload the buffer upon detecting change
  autocmd CursorHold * checktime

  " execute checktime for *.js files on write
  autocmd VimEnter *.js au BufWritePost *.js checktime
augroup END

" MARKDOWN
augroup filetype_markdown
  autocmd!
  autocmd BufNewFile,BufRead *.md setlocal spell
  autocmd filetype markdown nnoremap <buffer> <localleader>h I#<space>
augroup END
" ## ABRV
" enable dictionary completion source
set complete+=k

" add a dictionary
set dictionary+=/usr/share/dict/words
Terms
" ## OTHERS
" Turn backup off
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
