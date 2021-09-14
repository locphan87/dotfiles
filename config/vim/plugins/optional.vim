Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'jparise/vim-graphql'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-repeat'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }


Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#ale#enabled = 1

Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key='<C-y>'
let g:user_emmet_install_global = 1
" Enable just for file types below
" autocmd FileType html,css,scss,javascript,typescript EmmetInstall

Plug 'skwp/greplace.vim'
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

