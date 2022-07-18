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

" Replace a series of dash bullet points with a numbered list
command! -range=% NumberedLists let [c,d]=[0,0] | <line1>,<line2>g/^- /let [c,d]=[line('.')==d+1 ? c+1 : 1, line('.')] | s//\=c.'. '

" return the current time in format YMD.HMS
function! ZT()
  return system('date +%Y%m%d.%H%M%S')
endfunction
iab zt <C-R>=ZT()<CR>

