augroup editting
  autocmd!
  " automatically removing all trailing whitespace
  " autocmd BufWritePre * %s/\s\+$//e

  " return to last edit position when opening files
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

augroup markdown
  autocmd!
  " auto set spell check
  autocmd FileType markdown setlocal spell
augroup END

augroup vim
  autocmd!
  " set comment string " for vim instead of #
  autocmd FileType vim setlocal commentstring=\"%s
augroup END

" Replace a series of dash bullet points with a numbered list
command! -range=% NumberedLists let [c,d]=[0,0] | <line1>,<line2>g/^- /let [c,d]=[line('.')==d+1 ? c+1 : 1, line('.')] | s//\=c.'. '
