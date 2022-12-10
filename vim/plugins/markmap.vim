" Add a command to create markmap
command! -range=% Markmap CocCommand markmap.create <line1> <line2>

" Create markmap from the whole file
nmap <Leader>mm <Plug>(coc-markmap-create)

" Create markmap from the selected lines
vmap <Leader>mm <Plug>(coc-markmap-create-v)

