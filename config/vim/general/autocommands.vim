" EDITTING
augroup editting
  autocmd!
  " automatically removing all trailing whitespace
  autocmd BufWritePre * %s/\s\+$//e

  " return to last edit position when opening files
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

augroup typescript
  autocmd!
  autocmd BufNewFile,BufRead *.ts set filetype=typescript
  autocmd BufNewFile,BufEnter *.tsx set filetype=typescript
  autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
augroup END

augroup javascript
  autocmd!
  autocmd BufEnter *.js set ft=javascript
augroup END

" CHECKTIME
augroup checktime
  autocmd!
  " check file change every 4 seconds ('CursorHold') and reload the buffer upon detecting change
  autocmd CursorHold * checktime

  " execute checktime for *.js files on write
  autocmd VimEnter *.js au BufWritePost *.js checktime
augroup END

" MARKDOWN
augroup filetype_markdown
  autocmd!
  autocmd BufNewFile,BufRead *.md setlocal spell
  autocmd filetype markdown nnoremap <buffer> <localleader>h I#<space>
augroup END
