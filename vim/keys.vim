" leader keys
let maplocalleader="\\"
let mapleader=","

" quit the insert mode
inoremap jj <esc>

" add current date, format DD/MM/YYYY
nnoremap <f5> "=strftime("%d/%m/%Y")<cr>P
inoremap <f5> <c-r>=strftime("%d/%m/%Y")<cr>

" Remap , for repeating latest search in opposite direction
" nnoremap \ ,

" Remap <c-a> for adding a number
" nnoremap <C-i> <C-a>

" select the current word
nnoremap <space> viw

" open wikilink
nnoremap <c-g> vi]gf

" open filename under cursor in a vertical split
nnoremap <leader>gf :vertical wincmd f<CR>

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
nnoremap <leader>rl :so $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Fast saving of a buffer
nnoremap <leader><space> :up!<cr>

" remap 0 to first non-blank character
nnoremap 0 ^

" toggle paste mode on and off
nnoremap <leader>pp :setlocal paste!<cr>

" selecting your pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" store and restore sessions
nnoremap <F2> :mksession! ~/vim_session <cr>
nnoremap <F3> :source ~/vim_session <cr>

" treat long lines as break lines
" nnoremap k gk
" nnoremap j gj
" https://stackoverflow.com/questions/20975928/moving-the-cursor-through-long-soft-wrapped-lines-in-vim
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" managing tabs
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tc :tabclose<cr>
" nnoremap <leader>tm :tabmove

" toggle spell checking
nnoremap <leader>ss :setlocal spell!<cr>
