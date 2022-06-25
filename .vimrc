set nocompatible

" # KEY BINDINGS
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

" uppercase the current word
" inoremap <c-u> <esc>viwUea
" nnoremap <c-u> viwU

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

" [M] Fixing meta-keys in Vim via Mac OS X Terminal
" https://www.progclub.org/blog/2014/12/06/fixing-meta-keys-in-vim-via-mac-os-x-terminal-app/
let c='a'
while c <= 'z'
exec "set <M-".tolower(c).">=\e".c
  exec "imap \e".c." <M-".tolower(c).">"
  let c = nr2char(1+char2nr(c))
endw

" # PLUGINS
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'flazz/vim-colorschemes'
" Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'

" BEGIN MARKDOWN
" [M] Syntax highlighting, matching rules and mappings for Markdown files
" https://github.com/plasticboy/vim-markdown
" Plug 'plasticboy/vim-markdown'
" Syntax highlighting, matching rules and mappings for Markdown files
" https://github.com/plasticboy/vim-markdown#options

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

" [S] Markdown Preview for (Neo)vim
" https://github.com/iamcco/markdown-preview.nvim
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

" [C] Hyperfocus-writing in Vim.
" https://github.com/junegunn/limelight.vim
" Plug 'junegunn/limelight.vim'
" Goyo.vim integration
" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!

" [C] Distraction-free writing in Vim
" https://github.com/junegunn/goyo.vim
" Plug 'junegunn/goyo.vim'
" END MARKDOWN

" [S] Enables Jenkins DSL job syntax coloring + indentation
" https://github.com/martinda/Jenkinsfile-vim-syntax
Plug 'martinda/Jenkinsfile-vim-syntax'

" [C] A tree explorer plugin for vim
" https://github.com/preservim/nerdtree
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

" [C] Extra syntax and highlight for nerdtree files
" https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" [M] Vim motions on speed!
" https://github.com/easymotion/vim-easymotion
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

" [M] Plugin to toggle, display and navigate marks
" https://github.com/kshenoy/vim-signature
Plug 'kshenoy/vim-signature'

Plug 'wellle/targets.vim'

" [S] Disables the arrow keys, the hjkl keys, the page up/down keys,
" and a handful of other keys which allow one to rely on character-wise navigation
" Plug 'wikitopian/hardmode'
" enable hard mode by default
" let g:HardMode_level = 'wannabe'
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" [S] lean & mean status/tabline for vim that's light as air
" https://github.com/vim-airline/vim-airline
Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#ale#enabled = 1

" [M] A better JSON for Vim: distinct highlighting of keywords vs values,
" JSON-specific (non-JS) warnings, quote concealing
" https://github.com/elzr/vim-json
Plug 'elzr/vim-json'

" [M] Tools and environment to make Vim superb for developing with Node.js
" https://github.com/moll/vim-node
Plug 'moll/vim-node'

" [S] A Vim plugin that provides GraphQL file detection, syntax highlighting, and indentation.
" https://github.com/jparise/vim-graphql
Plug 'jparise/vim-graphql'

" [S] Typescript syntax files for Vim
" https://github.com/leafgarland/typescript-vim
Plug 'leafgarland/typescript-vim'

" [M] Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode
" https://github.com/neoclide/coc.nvim
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

" [S] https://github.com/neoclide/coc-snippets
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

" [M] Vastly improved Javascript indentation and syntax support in Vim.
" https://github.com/pangloss/vim-javascript
Plug 'pangloss/vim-javascript'
" Enables syntax highlighting for JSDocs
let g:javascript_plugin_jsdoc = 1

" [S] Seamless navigation between tmux panes and vim splits
" https://github.com/christoomey/vim-tmux-navigator
Plug 'christoomey/vim-tmux-navigator'

" [M] quoting/parenthesizing made simple
" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'
" Usage:
" Change surroundings: cs{x}{y}
" To go full circle (HTML tag): cst{y}
" Delete delimiters entirely: ds{x}
" Wrap a text object in parentheses: ysiw], use [ to add some space
" Wrap the entire line in parentheses: yss)
" Visual mode: S{<tag>}

" [S] enable repeating supported plugin maps with "."
" https://github.com/tpope/vim-repeat
Plug 'tpope/vim-repeat'

" [C] a Git wrapper
" https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'
" Usage: :Git calls any arbitrary Git command

" [S] Show a diff using Vim its sign column.
" https://github.com/mhinz/vim-signify
" Plug 'mhinz/vim-signify'
" Configuration for async update
" default updatetime 4000ms is not good for async update
" set updatetime=100

" [C] A Vim plugin for Prettier
" https://github.com/prettier/vim-prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
" Usage: :Prettier

" [C] emmet-vim is a vim plug-in which provides support for expanding abbreviations similar to emmet.
" https://github.com/mattn/emmet-vim
" https://emmet.io/
Plug 'mattn/emmet-vim'
" Usage: <leader>,
" Redefine trigger key <C-y>
let g:user_emmet_leader_key='<C-y>'
" Enable just for file types below
let g:user_emmet_install_global = 1
" autocmd FileType html,css,scss,javascript,typescript EmmetInstall

" [M] A command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" It is a command line application that filters each line
" from given input with a query that the user types.
" When the query changes, the results update in realtime
" https://github.com/junegunn/fzf
" https://github.com/junegunn/fzf.vim
" https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861

" Common Usages:
" :Files    - Open files in the current directory
" :Buffers  - Open buffers
" :Rg       - rg search result (ALT - A to select all, ALT - D to deselect all)
" :Maps     - Normal mode mappings
" :Marks    - Marks
" :Windows  - Windows
" :Commits  - Git commits
" :History  - v:oldfiles and open buffers
" :History/ - Search history
" :Commits  - Git commits
" :BCommits - Git commits for the current buffer

nnoremap <c-p> :Files<CR>
nnoremap <leader>h :History<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

" [S] Global search and replace for VI
" https://github.com/skwp/greplace.vim
Plug 'skwp/greplace.vim'
" customize command used for :Gsearch
" Usage:
" - Use `:Gsearch {searchTerm} ./` to get a buffer window of your search results
" - then you can make the replacements inside the buffer window using traditional tools (%s/foo/bar/)
" - Invoke :Greplace to make your changes across all files. It will ask you interatively y/n/a - you can hit 'a' to do all.
" - Save changes to all files with :wall (write all)
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

" [S] Track the engine.
" Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" [C] Adds file type icons to Vim plugins
" https://github.com/ryanoasis/vim-devicons
" Plug 'ryanoasis/vim-devicons'
call plug#end()

" # GENERAL
" ## BASICS
colorscheme termschool
set mouse=a

set pastetoggle=<f5>

set ffs=unix,dos,mac " use Unix as the standard file type
set hidden " navigate away from a modified file without first saving it
set number " line number

" ## INDENTATION
set si " smart indent
set wrap " wrap lines
set expandtab " Use spaces instead of tabs
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
set hls " Highlight search results
set ignorecase " Ignore case when searching
set smartcase " When searching try to be smart about cases

" # AUTOCMD
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

" # FUNCTIONS
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

" # ABV
" abbreviations for note taking
iab approx. approximately
iab bc. because
iab b4. before
iab bk. book
iab cp. compare
iab def. definition
iab diff. different
iab ea. each
iab e.g. for example
iab fr. from
iab etc. and so on
iab i.e. that means
iab impt. important
iab nb. notice this
iab nec. necessary
iab re. regarding
iab sim. similar
iab st. something
iab tho though
iab thro through
iab w with
iab wo without
iab v. very
iab vv. extremely
iab vs. against
iab ppl people
iab res research
iab natl national
iab edu education
iab dep department
iab esp especially
iab ustand understand
iab am. morning
iab pm. afternoon
iab asap as soon as possible
iab wrt with respect to
iab ert everything
iab infl influence
iab devel development
iab expl explanation
iab trad traditional
iab cult culture
iab instit institution
iab justific justification
iab nt nothing
iab lrg large
iab soc. society
iab stats statistics
iab amt amount
iab subj subject
iab ind individual
iab ckg checking
iab estg establishing
iab expting experimenting
iab bkgd background
iab ppd prepared
iab prob problem
iab ltd limited
iab max. maximum
iab min. minimum
iab gb. great britain
iab uk. united kingdom
iab eng. english
iab brit. british
iab sts students

" less frequently used abbreviations
iab a. answer
iab adm. administration
iab adj. adjective
iab abr. abridged
iab abbr. abbreviation
iab acad. academic
iab aka. also known as
iab app. appendix
iab assoc. association
iab bio. biology
iab biblio. bibliography
iab cap. capitalise
iab chap. chapter
iab chem. chemical
iab co. company
iab conf. conference
iab cont. continue
iab com. communication
iab cr. credit
iab crit. criticism
iab diag. diagram
iab disc. discovered
iab dist. distinguished
iab div. dividend, division
iab distr. distribution
iab econ. economy
iab esp. especially
iab est. estimate
iab ex. example
iab excl. excluding
iab fre. frequency
iab gen. general
iab govt. government
iab hist. history
iab inc. including
iab info. information
iab lang. language
iab orig. original
iab p. page
iab pp. pages
iab para. paragraph
iab poss. possibly
iab prin. principal
iab prob. problem
iab probs problems
iab prod. production
iab q. question
iab ref. reference
iab reg. region
iab rev. review
iab sci. science
iab sect. section
iab sp. specific
iab st. study
iab univ. universal
iab usu. usually
iab vers. version
iab yr. year

" Common abbreviations in software development
" iab AWS Amazon Web Services
" iab IDE Integrated Development Environment
" iab IIFE Immediately invoked function expression
" iab DOM Document Object Model
" iab JSON JavaScript Object Notation
" iab AJAX Asynchronous JavaScript And XML
" iab HTML HyperText Markup Language
" iab XML eXtensible Markup Language
" iab SEO Search Engine Optimization
" iab UX User Experience
" iab JS JavaScript
" iab regex Regular expression
" iab API Application programming interface
" iab CDN Content delivery network
" iab CMS Content management system
" iab ERP Enterprise resource planning
" iab CRUD Create, read, update, and delete
" iab MVC Model, View, and Controller
" iab UTC Coordinated Universal Time
" iab EOF End of File
" iab FIFO First In First Out
" iab FTP File Transfer Protocol
" iab SDK Software development kit
" iab JDK Java Development Kit
" iab JRE Java Runtime Environment
" iab JVM Java Virtual Machine
" iab SOAP Simple Object Access Protocol
" iab SQL Structured Query Language
" iab ORM Object Relational Mapping
" iab ETL Extract, Transform, Load
" iab OOP Object-oriented programming
" iab FP functional programming
" iab REST Representational state transfer
" iab CSS Cascading Style Sheets
" iab CSV Comma-separated values
" iab TDD Test-driven development
" iab BDD Behavior-driven development
" iab XP Extreme Programming
" iab UAT User Acceptance Testing
" iab AD Active Directory
" iab SASS Software as a Service
" iab UUID Universally unique identifier
" iab WYSIWYG What you see is what you get
" iab SOLID Single responsibility principle, Open-closed principle, Liskov substitution principle, Interface segregation principle, and Dependency inversion principle
" iab YAGNI You Ain't Gonna Need It
" iab DRY Don't repeat yourself
" iab SSH Secure Shell
" iab ASCII American Standard Code for Information Interchange
" iab RSS Rich Site Summary
" iab SSL Secure Sockets Layer
" iab UML Unified Modeling Language
" iab VPN Virtual Private Network
" iab RFC Request for Comments
" " Cloud computing
" iab AWS Amazon Web Services
" iab S3 Simple Storage System
" iab GCP Google Cloud Platform
" iab GCLB Google Cloud Load Balancer
" iab AmazonES Amazon Elasticsearch Service
" iab AMI Amazon Machine Image
" iab ARN Amazon Resource Name
" iab EC2 Elastic Compute Cloud
" iab ECS EC2 Container Service
" iab EFS Elastic File System
" iab EMR Elastic Map Reduce
" iab IaaS Infrastructure-as-a-Service
" iab SWS Simple Workflow Service
" iab SNS Simple Notification Service
" iab GCS Google Cloud Storage
" iab VPC Virtual Private Cloud
" iab AmazonEBS Amazon Elastic Block Store
" iab AZ Availability Zone
" iab ASG Auto Scaling Group
" iab EBS Elastic Block Store
" iab ELB Elastic Load Balancer
" iab EIP Elastic IP
" iab ENI Elastic Network Interface
" iab FaaS Function as-a-Service
" iab HPC High-Performance Compute
" iab HVM Hardware Virtual Machine
" iab S3_IA S3 Infrequent Access
" iab IG Internet Gateway
" iab KMS Key Management Service
" iab AmazonSES Amazon Simple Email System
" iab RRS Reduced Redundancy Storage
" iab SQS Simple Queue Service
" iab TPM Trusted Platform Module
" iab VPG Virtual Private Gateway
" iab VPS Virtual Private Server
" iab HP_CSA HP Cloud Service Automation
" " Bloging/Search Engine Optimization
" iab SEO Search Engine Optimization
" iab SCM Search Content Marketing
" iab SEM Search Engine Marketing
" iab WP WordPress
" iab PPC Pay Per Click
" iab CPC Cost Per Click
" iab SERP Search Engine Results Page
" iab CTS Click-Through Rate
" iab CR Conversion Rate
" iab CPM Cost Per Thousand Impressions
" iab SVG Scalable Vector Graphics
" iab DMCA Digital Millennium Copyright Act
" iab CMS Content Management System
" iab CRO Conversion Rate Optimization
" iab CTA Call to Action
" iab CTR Click Through Rate
" iab PR  PageRank
" iab DA  Domain Authority
" iab ROI Return on Investment
" iab UI_UX User Interface/User Experience
" iab SEA Search Engine Advertising
" iab SMO Social Media Optimization
" iab SMM Social Media Marketing
" iab SERM  Search Engine Reputation Management
" iab AMA Ask Me Anything
" iab B2B Business to Business
" iab B2C Business to Consumer
" iab CRM Customer Relationship Management
" iab CX  Customer Experience
" iab FOMO  Fear of Missing Out
" iab GA  Google Analytics
" iab IO  Insertion Order
" iab SM  Social Media
" iab SMP Social Media Platform
" iab ToS Terms of Service
" iab UA  Universal Analytics
" iab CPL Cost Per Lead
" iab NPS Net Promoter Score
" iab QDD Query Deserves Diversity
" iab QDF Query Deserves Freshness
" iab SC  Supplementary Content
" iab ZMOT  Zero Moment of Truth
" iab HITS  Hyperlink-Induced Topic Search
" iab LSI Latent Semantic Indexing
" iab PBN Private Blog Network
" " AI
" iab AI  Artificial Intelligence
" iab IMS Intelligent Maintenance Systems
" iab ML  Machine Learning
" iab NI  Natural Intelligence
" iab MI  Machine Intelligence
" iab NLP Natural Language Processing
" iab CNN Convolutional Neural Network
" iab RNN Recurrent Neural Network
" iab LSTM  Long Short-term Memory
" iab CTC Connectionist Temporal Classification
" iab CV  Computer Vision
" iab HMD Head Mounted Displays
" iab RL  Reinforcement Learning
" iab NLNN  Non-Learning Neural Networks
" iab SR  Speech Recognition
" iab M2M Machine to Machine
" iab DSBS  Dual Sensor Brake Support
" iab LNN Learning Neural Networks
" iab NLU Natural Language Understanding
" iab RPA Robotic Process Automation
" iab ANN Artificial Neural Network
" " Database
" iab SQL Structured Query Language
" iab DQL Data Query Language
" iab DDL Data Definition Language
" iab DML Data Manipulation Language
" iab RDSMS Relational Data Stream Management System
" iab OLAP  Online Analytical Processing
" iab OLTP  Online Transaction Processing
" iab DRDA  Distributed Relational Database Architecture
" iab 4D_QL 4D Query Language
" iab DMS Database Migration Service
" " Developement
" iab FIFO  First In First Out
" iab PHP Hypertext Preprocessor
" iab HTML  Hypertext Markup Language
" iab JS  JavaScript
" iab CSS Cascading Style Sheets
" iab SaaS  Software-as-a-Service
" iab API Application Programming Interface
" iab XML Extensible Markup Language
" iab SOAP  Simple Object Access Protocol
" iab XHTML Extensible Hypertext Markup Language
" iab JSON  JavaScript Object Notation
" iab EOF End Of File
" iab SDK Software Development Kit
" iab ASCII American Standard Code for Information Interchange
" iab IO  Input & Output
" iab WYSIWYG What You See Is What You Get
" iab VCS Version Control Systems
" iab IDE Integrated Development Environment
" iab Java EE Java, Enterprise Edition
" iab EOL End Of Life
" iab XSD XML Schema Definition
" iab VBS Visual Basic Script
" iab RAD Rapid Application Development
" iab JCE Java Cryptography Extension
" iab JDK Java Development Kit
" " IT Security
" iab IPSec Internet Protocol Security
" iab SSE Server Side Encryption
" iab SSL Secure Socket Layer
" iab TLS Transport Layer Security
" iab DOS Denial of Services
" iab DDoS  Distributed Denial Of Services
" iab XSS Cross-site Scripting
" iab CSP Content Security Policy
" iab CSRF  Cross-Site Request Forgery
" iab SQLi  SQL Injection
" iab CBSP  Cloud-based Security Providers
" iab ACL Access Control List
" iab AES Advanced Encryption System
" iab CORS  Cross-Origin Resource Sharing
" iab IAM Identity & Access Management
" iab MFA Multi-Factor Authentication
" iab WAF Web Application Firewall
" iab OWASP Open Web Application Security Project
" iab MITM  Man in the Middle Attack
" iab PCI DSS Payment Card Industry Data Security Standard
" iab SAML  Security Assertion Markup Language
" iab STS Security Token Service
" iab FUD Fully Undetectable
" iab RAT Remote Administration Tool
" iab SE  Social Engineering
" iab SKid  Script Kiddie
" iab DNSSEC  Domain Name System Security Extensions
" iab DKIM  Domain Keys Identified Mail
" iab DMARC Domain-based Message Authentication Reporting and Conformance
" iab SPF Sender Policy Framework
" iab CVSS  Common Vulnerability Scoring System
" iab SAST  Static Application Security Testing
" iab DAST  Dynamic Application Security Testing
" iab WAP Web Application Protection
" iab RFI Remote File Inclusion
" iab LFI Local File Inclusion
" iab DT  Directory Traversal
" iab PT  Path Traversal
" iab SCD Source Code Disclosure
" iab OSCI  OS Command Injection
" iab CWE Common Weakness Enumeration
" iab DSA Digital Signature Algorithm
" iab DES Data Encryption Standard
" " IT Infrastructure
" iab OSS Open Source Software
" iab FOSS  Free and open-source software
" iab OS  Operating System
" iab HA  High Availability
" iab BYOD  Bring Your Own Device
" iab PaaS  Platform-as-a-Service
" iab DaaS  Desktop-as-a-Service
" iab VM  Virtual Machine
" iab KVM Kernel-based Virtual Machine
" iab ESX Elastic Sky X
" iab DRS Distributed Resource Scheduler
" iab VSM Virtual Supervisor Module
" iab QEMU  Quick Emulator
" iab SSD Solid-state Drive
" iab IOPS  Input/output Operations Per Second
" iab ADFS  Active Directory Federation Service
" iab CLI Command Line Interface
" iab CI_CD Continous Integration/Continous Deployment
" iab iSCSI Internet Small Computer Storage Interface
" iab SSH Secure Shell
" iab MSTSC Microsoft Terminal Service Client
" iab MPP Massive Parallel Processing
" iab NFS Network File System
" iab RAID  Redundant Array of Independent Disk
" iab RAM Random-access Memory
" iab SLA Service Level Agreement
" iab OLA Operational-level Agreement
" iab SSO Single Sign-On
" iab VTL Virtual Tape Library
" iab VDI Virtual Desktop Infrastructure
" iab BIOS  Basic Input Output System
" iab DVD Digital Versatile Disc
" iab PSU Power Supply Unit
" iab ROM Read Only Memory
" iab UPS Uninterruptible Power Supply
" iab DC  Data Center
" iab GUI Graphical User Interface
" iab TPU Tensor Processing Unit
" iab RISC  Reduced Instruction Set Computer
" iab AU  Activation Unit
" iab ALU Arithmetic Logic Units
" iab AVX Advanced Vector Extensions
" iab P2V Physical to Virtual
" iab VXLAN Virtual Extensible Local Area Network
" iab VCS Veritas Cluster Server
" iab HAC High-availability Clusters
" iab RUM Real-user Measurement
" iab ERP Enterprise Resource Planning
" iab BPO Business Process Outsourcing
" iab BI  Business Intelligence
" iab IT  Information Technology
" iab DW  Data Warehouse
" iab WINS  Windows Internet Name Service
" iab WMI Windows Management Instrumentation
" iab VG  Volume Group
" iab TTY Teletype
" iab SFTP  SSH File Transfer Protocol
" iab SAN Storage Area Network
" " Network/Internet
" iab DNS Domain Name System
" iab HTTP  HyperText Transport Protocol
" iab HTTPS HyperText Transport Protocol Secure
" iab CDN Content Delivery Network
" iab LAN Local Area Network
" iab WAN Wide Area Network
" iab DHCP  Dynamic Host Configuration Protocol
" iab TCP Transmission Control Protocol
" iab IP  Internet Protocol
" iab WWW World Wide Web
" iab IoT Internet Of Things
" iab D2D Device to Device
" iab VPN Virtual Private Network
" iab BGP Border Gateway Protocol
" iab VLAN  Virtual Local Area Network
" iab DOM Document Object Model
" iab UDP User Datagram Protocol
" iab CIDR  Classless Inter-Domain Routing
" iab VIP Virtual IP
" iab ICMP  Internet Control Message Protocol
" iab LB  Load Balancer
" iab SMTP  Simple Mail Transfer Protocol
" iab FTP File Transfer Protocol
" iab RDP Remote Desktop Protocol
" iab MPLS  Multi-Protocol Label Switching
" iab NS  Name Server
" iab NAT Network Address Translation
" iab SOA Start of Authority
" iab TTL Time To Live
" iab TPS Transaction Per Second
" iab NDA Nondisclosure Agreement
" iab AP  Access Point
" iab MAC Media Access Control
" iab NIC Network Interface Card
" iab ISP Internet Service Provider
" iab URL Uniform Resource Locator
" iab PDF Portable Document Format
" iab TLD Top-level domain
" iab RSS Really Simple Syndication
" iab IFTTT If This Then That
" iab IE Internet Explorer
" iab AFAIK As far as I Know
" iab CAN_SPAM Controlling the Assault of Non-Solicited Pornography and Marketing Act
" iab DM  Direct Message
" iab FB  Facebook
" iab PM  Private Message
" iab QoS Quality of Service
" iab MIME  Multipurpose Internet Mail Extensions
" iab POP Post Office Protocol
" iab IMAP  Internet Message Access Protocol
" iab CNAME Canonical Name
" iab MX  Mail Exchange
" iab PPTP  Point-to-Point Tunneling Protocol
" iab LLT Low Latency Transport
" iab POP (CDN) Point Of Presence of CDN
" iab ASN Autonomous System Number
" iab SCM (Commerce)  Supply Chain Management
" iab WPAN  Wireless Personal Area Network
" iab WLAN  Wireless Local Area Network
" iab URI Uniform Resource Identifier
" iab TTF TrueType Font
" iab NACK  Negative ACKnowledgement
" iab HAR HTTP Archive
" iab QUIC  Quick UDP Internet Connections

" # MISC
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

" With the ‘wildmenu’ option enabled,
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

" ABRV
iab zt <C-R>=ZT()<CR>
