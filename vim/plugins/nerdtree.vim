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
" Start Startify and NERDTree at startup
" NERDTree | wincmd p
autocmd VimEnter *
  \ if !argc()
  \ |   Startify
  \ |   NERDTree
  \ |   wincmd w
  \ | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Extra syntax and highlight for nerdtree files
