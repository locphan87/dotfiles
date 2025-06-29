" return the current time in format YMD.HMS
function! ZT()
  return system('date +%Y%m%d.%H%M%S')
endfunction
iab zt <C-R>=ZT()<CR>

