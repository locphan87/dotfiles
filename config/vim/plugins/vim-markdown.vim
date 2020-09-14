" Syntax highlighting, matching rules and mappings for Markdown files
" https://github.com/plasticboy/vim-markdown#options

" Set header folding level
let g:vim_markdown_folding_level = 6
" https://github.com/plasticboy/vim-markdown#syntax-concealing
set conceallevel=2
" Enable TOC window auto-fit
let g:vim_markdown_toc_autofit = 1
" Strikethrough uses two tildes. ~~Scratch this.~~
let g:vim_markdown_strikethrough = 1
" Adjust new list item indent
let g:vim_markdown_new_list_item_indent = 2
" Do not require .md extensions for Markdown links
let g:vim_markdown_no_extensions_in_markdown = 1
" Auto-write when following link
let g:vim_markdown_autowrite = 1
" go to parent header (Up)
map asdf <Plug>Markdown_MoveToParentHeader
