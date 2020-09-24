" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" " from markdown buffer to another buffer
" " default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 1

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = '~/github-markdown.css'

" MAPPINGS
" Start the preview
nmap <C-s> <Plug>MarkdownPreview
" Stop the preview
" :MarkdownPreviewStop
nmap <M-s> <Plug>MarkdownPreviewStop
" Toggle the preview
" :MarkdownPreviewToggle
