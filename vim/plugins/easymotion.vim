" Change the default leader <leader><leader>
" map <Leader> <Plug>(easymotion-prefix)
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Turn on case insensitive feature
" This setting makes EasyMotion work similarly to Vim's smartcase option for global searches.
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
