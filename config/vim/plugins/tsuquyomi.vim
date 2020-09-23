" Rename symbols
" You can rename the identifier under the cursor to a new name
autocmd FileType typescript nmap <buffer> <Leader>e <Plug>(TsuquyomiRenameSymbol)
" If you want to rename identifiers including in comments, you can use :TsuRenameSymbolC command
autocmd FileType typescript nmap <buffer> <Leader>E <Plug>(TsuquyomiRenameSymbolC)
" Tsuquyomi can display tooltip window about symbol under the mouse cursor
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
