augroup editting
  autocmd!
  " automatically removing all trailing whitespace
  autocmd BufWritePre * %s/\s\+$//e

  " return to last edit position when opening files
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

augroup markdown_kb
  autocmd!
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
  " auto set spell check
  " autocmd FileType markdown setlocal spell
  autocmd BufRead,BufNewFile $KB_PATH* setlocal path+=$KB_PATH/**
  set suffixesadd+=.md
augroup END

