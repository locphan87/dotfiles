" ── Claude Code in :terminal ───────────────────────────────
set autoread                 " reload files Claude edits on disk
set updatetime=1000          " make CursorHold fire ~1s
set termguicolors            " let the TUI render full color

augroup ClaudeSync           " pick up Claude's on-disk edits
  autocmd!
  autocmd CursorHold,BufEnter,FocusGained,WinEnter * silent! checktime
augroup END

let g:claude_buf = -1

" Toggle a persistent Claude terminal in a right-hand vsplit
function! ClaudeToggle() abort
  if g:claude_buf > 0 && bufexists(g:claude_buf)
    let l:win = bufwinid(g:claude_buf)
    if l:win != -1                              " visible → hide (job lives on)
      call win_gotoid(l:win) | hide | return
    endif
    execute 'vertical sbuffer' g:claude_buf     " hidden → reshow
    vertical resize 90 | startinsert | return
  endif
  let l:root = systemlist('git -C '.shellescape(expand('%:p:h')).' rev-parse --show-toplevel')
  let l:cwd  = (len(l:root) && isdirectory(get(l:root,0,''))) ? l:root[0] : getcwd()
  execute 'vertical terminal ++noclose ++cwd='.fnameescape(l:cwd).' claude'
  vertical resize 90
  let g:claude_buf = bufnr('%')
endfunction

" Send a file/line reference (single line = safe in a TUI)
function! ClaudeRef() range abort
  if g:claude_buf <= 0 | echo 'No Claude terminal' | return | endif
  let l:ref = expand('%:p').':'.a:firstline
  if a:firstline != a:lastline | let l:ref .= '-'.a:lastline | endif
  call term_sendkeys(g:claude_buf, l:ref.' ')
endfunction

nnoremap <silent> <leader>cc :call ClaudeToggle()<CR>
nnoremap <silent> <leader>cf :call ClaudeRef()<CR>
xnoremap <silent> <leader>cf :call ClaudeRef()<CR>
nnoremap <silent> <leader>cw :call win_gotoid(bufwinid(g:claude_buf))<CR>
" In the terminal: <C-w>N to scroll/yank, <C-w>h/l to switch windows.
