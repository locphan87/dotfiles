" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let maplocalleader="\\"
let mapleader=","
" map \ ,

" select the current word
nnoremap <space> viw

" move a line down/up
nnoremap - ddp
nnoremap _ ddkP

" uppercase the current word
inoremap <c-u> <esc>viwUea
nnoremap <c-u> viwU

" disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" navigate between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" smart indentation
vnoremap < <gv
vnoremap > >gv

" Reload vim config
nnoremap <leader>ww :so ~/.vimrc<cr>

" Remap VIM 0 to first non-blank character
nnoremap 0 ^

" Toggle paste mode on and off
nnoremap <leader>pp :setlocal paste!<cr>

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

" Selecting your pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" session
nnoremap <F2> :mksession! ~/vim_session <cr>
nnoremap <F3> :source ~/vim_session <cr>

" Treat long lines as break lines
nnoremap k gk
" nnoremap gk k
nnoremap j gj
" nnoremap gj j

" Fast saving of a buffer
nnoremap <leader>w :up!<cr>

" Disable highlight when <leader><cr> is pressed
nnoremap <silent> <leader><cr> :noh<cr>

" Useful mappings for managing tabs
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tm :tabmove

" Toggle spell checking
nnoremap <leader>ss :setlocal spell!<cr>

" Avoid the Cursor Keys When Recalling Commands from History
cnoremap <c-p> <up>
cnoremap <c-n> <down>

" search for the current selection
" xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
" xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
