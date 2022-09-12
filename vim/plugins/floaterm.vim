" back to normal mode: use <esc> instead of <c-\><c-n>
tnoremap <leader><Esc> <C-\><C-n>
" let g:floaterm_wintype = 'split'
let g:floaterm_title = 'Terminal $1/$2'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.8
let g:floaterm_keymap_prev   = '<leader>fp'
let g:floaterm_keymap_next   = '<leader>fn'
let g:floaterm_keymap_toggle = '<leader>ft'
nnoremap <silent> <leader>fk :FloatermKill!<CR> \| :echom "Closed all terminals"<CR>
nnoremap <silent> <leader>fs :FloatermSend<CR> \| :FloatermToggle<CR>
