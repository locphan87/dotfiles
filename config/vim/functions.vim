function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

function! QuickfixFilenames()
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

function! Meow()
  echom "Meow!!!"
endfunction

function! Hello(name)
  echom 'Hello, ' . a:name
endfunction

function! Vargs(foo,...)
  echom a:foo
  echom a:0
  echom a:1
  echo a:000
endfunction
