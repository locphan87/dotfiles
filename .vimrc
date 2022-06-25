set nocompatible

" # KEY BINDINGS #

let maplocalleader="\\"
let mapleader=","

" quit the insert mode
inoremap jk <esc>

" Remap , for repeating latest search in opposite direction
nnoremap \ ,

" Remap <c-a> for adding a number
nnoremap <C-i> <C-a>

" select the current word
nnoremap <space> viw

" clear last search highlighting
nnoremap <silent> <leader><cr> :noh<cr>

" avoid the cursor keys when recalling commands from history
cnoremap <c-p> <up>
cnoremap <c-n> <down>

" navigate between windows
nnoremap <c-j> <C-W>j
nnoremap <c-k> <C-W>k
nnoremap <c-h> <C-W>h
nnoremap <c-l> <C-W>l

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
inoremap $b ``<esc>i

" surround the visual selection in parenthesis/brackets/etc.
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $t <esc>`>a><esc>`<i<<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>
vnoremap $b <esc>`>a`<esc>`<i`<esc>

" selecting your pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" store and restore sessions
nnoremap <F2> :mksession! ~/vim_session <cr>
nnoremap <F3> :source ~/vim_session <cr>

" treat long lines as break lines
nnoremap k gk
nnoremap j gj

" managing tabs
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tm :tabmove

" toggle spell checking
nnoremap <leader>ss :setlocal spell!<cr>

" Fixing meta-keys in Vim via Mac OS X Terminal
" https://www.progclub.org/blog/2014/12/06/fixing-meta-keys-in-vim-via-mac-os-x-terminal-app/
let c='a'
while c <= 'z'
exec "set <M-".tolower(c).">=\e".c
  exec "imap \e".c." <M-".tolower(c).">"
  let c = nr2char(1+char2nr(c))
endw

" # PLUGINS #

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'flazz/vim-colorschemes'
" Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'

" Plug 'plasticboy/vim-markdown'
" Syntax highlighting, matching rules and mappings for Markdown files

" Set header folding level
let g:vim_markdown_folding_level = 6
" https://github.com/plasticboy/vim-markdown#syntax-concealing
set conceallevel=2
" Enable TOC window auto-fit
let g:vim_markdown_toc_autofit = 1
" Strikethrough uses two tildes. ~~Scratch this.~~
let g:vim_markdown_strikethrough = 1
" Adjust new list item indent
let g:vim_markdown_new_list_item_indent = 0
" Do not require .md extensions for Markdown links
let g:vim_markdown_no_extensions_in_markdown = 1
" Auto-write when following link
let g:vim_markdown_autowrite = 1
" go to parent header (Up)
map asdf <Plug>Markdown_MoveToParentHeader

" Markdown Preview for (Neo)vim
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" " from markdown buffer to another buffer
" " default: 1
let g:mkdp_auto_close = 0

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 1

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = '~/github-markdown.css'

" MAPPINGS
nmap <C-m> <Plug>MarkdownPreview
nmap <M-m> <Plug>MarkdownPreviewStop

" Hyperfocus-writing in Vim.
" Plug 'junegunn/limelight.vim'
" Goyo.vim integration
" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!

" Distraction-free writing in Vim
" Plug 'junegunn/goyo.vim'

" Enables Jenkins DSL job syntax coloring + indentation
Plug 'martinda/Jenkinsfile-vim-syntax'

" A tree explorer plugin for vim
Plug 'scrooloose/nerdtree'
" Tells the NERDTree whether to display hidden files on startup
let NERDTreeShowHidden=1

" If a NERDTree already exists for this tab, it is reopened and rendered
" again. If <start-directory> or <bookmark> is given, the root of NERDTree
" is set to that path. If no NERDTree exists for this tab then this command
" acts the same as the |:NERDTree| command.
nnoremap <leader>nn :NERDTreeToggle<CR>

" Without the optional argument, find and reveal the file for the active
" buffer in the NERDTree window.  With the <path> argument, find and
" reveal the specified path.
" Focus will be shifted to the NERDTree window, and the cursor will be
" placed on the tree node for the determined path.  If a NERDTree for the
" current tab does not exist, a new one will be initialized.
nnoremap <leader>nf :NERDTreeFind<CR>

" Extra syntax and highlight for nerdtree files
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Vim motions on speed!
Plug 'easymotion/vim-easymotion'
" Change the default leader <leader><leader>
map <Leader> <Plug>(easymotion-prefix)

" 2-character search motion
" `s<CR>` repeat last find motion.
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
" This setting makes EasyMotion work similarly to Vim's smartcase option for global searches.
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" Plugin to toggle, display and navigate marks
Plug 'kshenoy/vim-signature'

Plug 'wellle/targets.vim'

" lean & mean status/tabline for vim that's light as air
Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#ale#enabled = 1

" A better JSON for Vim: distinct highlighting of keywords vs values,
" JSON-specific (non-JS) warnings, quote concealing
Plug 'elzr/vim-json'

" Tools and environment to make Vim superb for developing with Node.js
Plug 'moll/vim-node'

" A Vim plugin that provides GraphQL file detection, syntax highlighting, and indentation.
Plug 'jparise/vim-graphql'

" Typescript syntax files for Vim
Plug 'leafgarland/typescript-vim'

" Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
let g:coc_global_extensions = [ 'coc-tsserver', 'coc-json', 'coc-yaml', 'coc-tailwindcss' ]

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
  command! -nargs=0 Prettier :CocCommand prettier.formatFile
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Add CoC styled-components
if isdirectory('./node_modules') && isdirectory('./node_modules/styled-components')
  let g:coc_global_extensions += ['coc-styled-components']
endif

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Show autocomplete when Tab is pressed
inoremap <silent><expr> <Tab> coc#refresh()

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for range format
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" https://github.com/neoclide/coc-snippets
" Make <tab> used for trigger completion, completion confirm,
" snippet expand and jump like VSCode
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'
" `:CocList commands` to open the command list and choose one you need.
" Use `:CocCommand` with <tab> for command line completion
" Use <Plug>(coc-refactor) for create a refactor window of current symbol
" For rename variable across files in current cwd, use :CocSearch
" Use command :CocCommand document.renameCurrentWord to start cursors session
" with ranges contain current word.
" Use :CocList snippets to open snippets list.
" Use :CocCommand snippets.editSnippets to edit user snippet of current filetype.
" Use :CocCommand snippets.openSnippetFiles to open snippet files of current filetype.

" Vastly improved Javascript indentation and syntax support in Vim.
Plug 'pangloss/vim-javascript'
" Enables syntax highlighting for JSDocs
let g:javascript_plugin_jsdoc = 1

" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'

" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'
" Usage:
" Change surroundings: cs{x}{y}
" To go full circle (HTML tag): cst{y}
" Delete delimiters entirely: ds{x}
" Wrap a text object in parentheses: ysiw], use [ to add some space
" Wrap the entire line in parentheses: yss)
" Visual mode: S{<tag>}

" Enable repeating supported plugin maps with "."
Plug 'tpope/vim-repeat'

" A Git wrapper
Plug 'tpope/vim-fugitive'

" Show a diff using Vim its sign column.
" Plug 'mhinz/vim-signify'
" Configuration for async update
" default updatetime 4000ms is not good for async update
" set updatetime=100

" A Vim plugin for Prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" emmet-vim is a vim plug-in which provides support for expanding abbreviations similar to emmet.
Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key='<C-y>'
" Enable just for file types below
let g:user_emmet_install_global = 1
" autocmd FileType html,css,scss,javascript,typescript EmmetInstall

" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <c-p> :Files<CR>
nnoremap <leader>h :History<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

" Global search and replace for VI
Plug 'skwp/greplace.vim'
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

" Adds file type icons to Vim plugins
" Plug 'ryanoasis/vim-devicons'
call plug#end()

" # GENERAL #

colorscheme termschool
set mouse=a

set pastetoggle=<f5>

set ffs=unix,dos,mac " use Unix as the standard file type
set hidden " navigate away from a modified file without first saving it
set number " line number

set si " smart indent
set wrap " wrap lines
set expandtab " Use spaces instead of tabs
set shiftwidth=2
set tabstop=2

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

" # AUTOCMD #

augroup editting
  autocmd!
  " automatically removing all trailing whitespace
  autocmd BufWritePre * %s/\s\+$//e

  " return to last edit position when opening files
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

augroup markdown
  autocmd!
  " auto set spell check
  autocmd FileType markdown setlocal spell
augroup END

" Replace a series of dash bullet points with a numbered list
command! -range=% NumberedLists let [c,d]=[0,0] | <line1>,<line2>g/^- /let [c,d]=[line('.')==d+1 ? c+1 : 1, line('.')] | s//\=c.'. '

" # FUNCTIONS #

" Capture ex command output and paste to a new tab
function! TabMessage(cmd)
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    echoerr "no output"
  else
    " use "new" instead of "tabnew" below if you prefer split windows instead of tabs
    tabnew
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction
command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)

" remove <200b> character from text file
function! Remove200b()
  %s/\%u200b//g
endfunction

" # ABV #
iab approx. approximately
iab bc. because
iab def. definition
iab diff. different
iab ea. each
iab e.g. for example
iab etc. and so on
iab i.e. that means

" # MISC #

" Dictionary
set complete+=kspell " enable dictionary completion source
set spellfile=~/.vim/spell/en.utf-8.add

" Disable backups and swap files
set nobackup
set nowb
set noswapfile

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

" return the current time in format YMD.HMS
function! ZT()
  return system('date +%Y%m%d.%H%M%S')
endfunction

iab zt <C-R>=ZT()<CR>
