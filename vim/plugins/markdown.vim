" Set header folding level
let g:vim_markdown_folding_level = 6
set conceallevel=2
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_frontmatter = 1
" Enable TOC window auto-fit
let g:vim_markdown_toc_autofit = 1
" Strikethrough uses two tildes. ~~Scratch this.~~
let g:vim_markdown_strikethrough = 1
" Adjust new list item indent
let g:vim_markdown_new_list_item_indent = 0
" Do not require .md extensions for Markdown links
let g:vim_markdown_no_extensions_in_markdown = 1
" Auto-write when following link
let g:vim_markdown_autowrite = 1
" go to parent header (Up)
map asdf <Plug>Markdown_MoveToParentHeader
