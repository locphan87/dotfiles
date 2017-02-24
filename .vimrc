set nocompatible

call plug#begin()
Plug 'heavenshell/vim-jsdoc'
" Plug 'vim-scripts/vim-auto-save'
Plug 'lumiliet/vim-twig'
Plug 'statianzo/vim-jade'
Plug 'wikitopian/hardmode'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'majutsushi/tagbar'
" Plug 'christoomey/vim-tmux-navigator'
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-repeat'
" Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-sensible'
Plug 'Raimondi/delimitMate'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'lambdatoast/elm.vim'
" Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'elzr/vim-json'
Plug 'jelera/vim-javascript-syntax'
Plug 'mattn/emmet-vim'
Plug 'mxw/vim-jsx'
" Plug 'othree/yajs.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'valloric/youcompleteme'
Plug 'moll/vim-node'
Plug 'bling/vim-airline'
Plug 'mhinz/vim-signify'
Plug 'rizzatti/dash.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'yggdroot/indentline'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'tpope/vim-commentary'
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
call plug#end()

set t_Co=256
syntax on

" Enable filetype plugins
filetype plugin on
filetype indent on

set number
set background=dark

" navigate away from a modified file without first saving it
set hidden

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" jsdoc
let g:jsdoc_enable_es6=1
let g:jsdoc_allow_input_prompt=1

" Tern
" enable keyboard shortcuts
let g:tern_map_prefix='<leader>'
let g:tern_map_keys=1
" show argument hints
let g:tern_show_argument_hints='on_hold'

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
set foldlevel=99
set encoding=utf-8

" Folding
set foldmethod=syntax
" set foldlevelstart=1
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

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
" let mapleader="\\"
let mapleader=","
noremap \ ,

" set clipboard=unnamed
set list!
set listchars=tab:>·,trail:~,extends:>,precedes:<

" treat all numerals as decimal, regardless of whether they are padded with zeros.
set nrformats=

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

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

" Reload vim config
nmap <leader>ww :so ~/.vimrc<cr>

" Remap VIM 0 to first non-blank character
map 0 ^

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Add a bit extra margin to the left
set foldcolumn=1

" Selecting your pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" vim-javascript config
let g:javascript_enable_domhtmlcss = 1
let g:javascript_ignore_javaScriptdoc = 1
" let g:javascript_conceal_function       = "ƒ"
" let g:javascript_conceal_null           = "ø"
" let g:javascript_conceal_this           = "@"
" let g:javascript_conceal_return         = "⇚"
" let g:javascript_conceal_undefined      = "¿"
" let g:javascript_conceal_NaN            = "ℕ"
" let g:javascript_conceal_prototype      = "¶"
" let g:javascript_conceal_static         = "•"
" let g:javascript_conceal_super          = "Ω"
" let g:javascript_conceal_arrow_function = "⇒"

" emmet-vim config
let g:user_emmet_leader_key=','
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,js EmmetInstall

" session
map <F2> :mksession! ~/vim_session <cr>
map <F3> :source ~/vim_session <cr>

" vim-jsx config
let g:jsx_ext_required = 0

" scss-syntax-vim config
autocmd FileType css,scss set iskeyword+=-

" indentline config
" :IndentLinesToggle toggles lines on and off.
let g:indentLine_enabled = 0
map <F10> :IndentLinesToggle<CR>

" nerdtree config
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <leader>nn :NERDTreeToggle<CR>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<CR>

" Fast saving of a buffer
nmap <leader>w :w!<cr>

" Treat long lines as break lines
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" Map <Space> to / (search) and <Ctrl>+<Space> to ? (backwards search)
map <space> /

" map <c-space> ?
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Ag configs
let g:ag_working_path_mode="r"

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Quickly insert parenthesis/brackets/etc.
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i

" Surround the visual selection in parenthesis/brackets/etc.
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
  set wildignore+=.git\*,.hg\*,.svn\*
endif

" Toggle spell checking
map <leader>ss :setlocal spell!<cr>

" youcompleteme config
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'
let g:syntastic_auto_jump = 1
let g:syntastic_mode_map = {
  \ "mode": "passive",
  \ "active_filetypes": ["javascript"],
  \ "passive_filetypes": []
  \ }

" repeat the last ex command
nnoremap ]] @:

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ }
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Automatically removing all trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Elm
nnoremap <leader>el :ElmEvalLine<CR>
vnoremap <leader>es :<C-u>ElmEvalSelection<CR>
nnoremap <leader>em :ElmMakeCurrentFile<CR>
:au BufWritePost *.elm ElmMakeCurrentFile

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<leader>np"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" configs at work
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

set wildmode=longest,list

" Avoid the Cursor Keys When Recalling Commands from History
cnoremap <c-p> <up>
cnoremap <c-n> <down>

" tmux
" let g:tmux_navigator_no_mappings = 1
" nnoremap <silent> <c-w-h> :tmuxnavigateleft<cr>
" nnoremap <silent> <c-w-j> :tmuxnavigatedown<cr>
" nnoremap <silent> <c-w-k> :tmuxnavigateup<cr>
" nnoremap <silent> <c-w-l> :tmuxnavigateright<cr>
" nnoremap <silent> <c-w-\\> :tmuxnavigateprevious<cr>

" Tagbar
" nmap <F8> :TagbarToggle<CR>

inoremap jj <esc>

" search for the current selection
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

" populate the argument list with each of the files named in the quickfix list
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" automatically execute ctags each time a file is saved
" :autocmd BufWritePost * call system("ctags -R")

" toggle tagbar
nmap <F8> :TagbarToggle<CR>
