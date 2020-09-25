" Change the default leader <leader><leader>
map <Leader> <Plug>(easymotion-prefix)

" 2-character search motion
" `s<CR>` repeat last find motion.
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
" This setting makes EasyMotion work similarly to Vim's smartcase option for global searches.
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
