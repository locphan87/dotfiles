so ~/config/vim/init.vimrc
so ~/config/vim/general.vimrc
so ~/config/vim/plugins.vimrc

" set clipboard=unnamed
set list!
set listchars=tab:>·,trail:~,extends:>,precedes:<

" treat all numerals as decimal, regardless of whether they are padded with zeros.
set nrformats=

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Add a bit extra margin to the left
set foldcolumn=1

" Selecting your pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'


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
nmap <leader>w :up!<cr>

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

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
  set wildignore+=.git\*,.hg\*,.svn\*
endif

" Toggle spell checking
map <leader>ss :setlocal spell!<cr>


" repeat the last ex command
nnoremap ]] @:

" Automatically removing all trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<leader>np"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

set wildmode=longest,list

" Avoid the Cursor Keys When Recalling Commands from History
cnoremap <c-p> <up>
cnoremap <c-n> <down>

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

so ~/config/vim/keys.vimrc
