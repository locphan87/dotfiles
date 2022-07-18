" AutoSave is disabled by default, run :AutoSaveToggle to enable/disable it
let g:auto_save = 0
" write all open buffers as if you would use :wa
let g:auto_save_write_all_buffers = 0
augroup ft_markdown
  au!
  au FileType markdown let b:auto_save = 1
augroup END
