let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_center = 1
let g:bookmark_highlight_lines = 1

" Finds the Git super-project directory
function! g:BMWorkDirFileLocation()
  let filename = 'bookmarks'
  let location = ''
  if isdirectory('.git')
    " Current work dir is git's work tree
    let location = getcwd().'/.git'
  else
    " Look upwards (at parents) for a directory named '.git'
    let location = finddir('.git', '.;')
  endif
  if len(location) > 0
    return location.'/'.filename
  else
    return getcwd().'/.'.filename
  endif
endfunction

" avoid keybinding conflicts with the Nerdtree plugin
let g:bookmark_no_default_key_mappings = 1
function! BookmarkMapKeys()
  nmap <leader>mm :BookmarkToggle<CR>
  nmap <leader>mi :BookmarkAnnotate<CR>
  nmap <leader>mn :BookmarkNext<CR>
  nmap <leader>mp :BookmarkPrev<CR>
  nmap <leader>ma :BookmarkShowAll<CR>
  nmap <leader>mc :BookmarkClear<CR>
  nmap <leader>mx :BookmarkClearAll<CR>
  nmap <leader>mkk :BookmarkMoveUp
  nmap <leader>mjj :BookmarkMoveDown
endfunction
function! BookmarkUnmapKeys()
  unmap mm
  unmap mi
  unmap mn
  unmap mp
  unmap ma
  unmap mc
  unmap mx
  unmap mkk
  unmap mjj
endfunction
" autocmd BufEnter * :call BookmarkMapKeys()
" autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()
