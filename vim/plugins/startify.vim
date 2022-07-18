function! s:list_commits()
  let git = 'git'
  let commits = systemlist(git .' log --oneline | head -n10')
  let git = 'G'. git[1:]
  return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction

let g:startify_lists = [
  \ { 'type': 'files',     'header': ['   MRU']            },
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': function('s:list_commits'), 'header': ['Commits']},
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \ ]

let g:startify_commands = [
  \ ['Vim Reference', 'h ref'],
  \ {'h': 'h startify'}
  \ ]
" \ {'m': ['pwd', 'call pwd()']},

let g:startify_bookmarks = [
  \ { 'notes': '~/projects/zkn' },
  \ { 'dotfiles': '~/projects/dotfiles' },
  \ ]

let g:startify_custom_footer = [
  \ '',
  \ "\t\tFirst, solve the problem. Then, write the code",
  \ "\t\t- John Johnson",
  \ ''
  \ ]
