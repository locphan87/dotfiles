" It is a command line application that filters each line
" from given input with a query that the user types.
" When the query changes, the results update in realtime
" https://github.com/junegunn/fzf
" https://github.com/junegunn/fzf.vim
" https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861

" Common Usages:
" :Files    - Open files in the current directory
" :Buffers  - Open buffers
" :Rg       - rg search result (ALT - A to select all, ALT - D to deselect all)
" :Maps     - Normal mode mappings
" :Marks    - Marks
" :Windows  - Windows
" :Commits  - Git commits
" :History  - v:oldfiles and open buffers
" :History/ - Search history
" :Commits  - Git commits
" :BCommits - Git commits for the current buffer

nnoremap <c-p> :Files<CR>
nnoremap <c-b> :Buffers<CR>
nnoremap <leader>h :History<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}
