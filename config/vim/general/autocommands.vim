" automatically removing all trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" check file change every 4 seconds ('CursorHold') and reload the buffer upon detecting change
autocmd CursorHold * checktime

" execute checktime for *.js files on write
autocmd VimEnter *.js au BufWritePost *.js checktime
