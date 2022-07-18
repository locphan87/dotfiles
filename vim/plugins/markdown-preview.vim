let g:mkdp_theme = 'light'
let g:mkdp_page_title = '${name}'
let g:mkdp_preview_options = {
  \ 'mkit': {},
  \ 'katex': {},
  \ 'uml': {},
  \ 'maid': {},
  \ 'disable_sync_scroll': 0,
  \ 'sync_scroll_type': 'middle',
  \ 'hide_yaml_meta': 1,
  \ 'sequence_diagrams': {},
  \ 'flowchart_diagrams': {},
  \ 'content_editable': v:false,
  \ 'disable_filename': 0,
  \ 'toc': {}
  \ }

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" " from markdown buffer to another buffer
" " default: 1
let g:mkdp_auto_close = 0

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 1

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = '~/github-markdown.css'

" MAPPINGS
nmap <C-m> <Plug>MarkdownPreview
nmap <M-m> <Plug>MarkdownPreviewStop

