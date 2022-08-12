call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-system-copy'
Plug 'digitaltoad/vim-pug'

Plug 'MattesGroeger/vim-bookmarks'
source $DOTFILES/vim/plugins/vim-bookmarks.vim

Plug 'kshenoy/vim-signature'

Plug 'mhinz/vim-startify'
source $DOTFILES/vim/plugins/startify.vim

Plug 'ruanyl/vim-gh-line'
let g:gh_github_domain = 'https://github.aus.thenational.com'

Plug '907th/vim-auto-save'
source $DOTFILES/vim/plugins/auto-save.vim

Plug 'preservim/vim-markdown'
source $DOTFILES/vim/plugins/markdown.vim

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
source $DOTFILES/vim/plugins/markdown-preview.vim

Plug 'junegunn/limelight.vim'
" Goyo.vim integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

Plug 'junegunn/goyo.vim'
Plug 'martinda/Jenkinsfile-vim-syntax'

Plug 'scrooloose/nerdtree'
source $DOTFILES/vim/plugins/nerdtree.vim
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'easymotion/vim-easymotion'
source $DOTFILES/vim/plugins/easymotion.vim

Plug 'wellle/targets.vim'
Plug 'Shougo/unite.vim'

Plug 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#unite#enabled = 1

Plug 'elzr/vim-json'
Plug 'moll/vim-node'
Plug 'ekalinin/Dockerfile.vim'
Plug 'hashivim/vim-terraform'
Plug 'jparise/vim-graphql'
Plug 'leafgarland/typescript-vim'

Plug 'SirVer/ultisnips'
source $DOTFILES/vim/plugins/ultisnips.vim
Plug 'honza/vim-snippets'

Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
source $DOTFILES/vim/plugins/coc.vim

Plug 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'voldikss/vim-floaterm'
source $DOTFILES/vim/plugins/floaterm.vim

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
let g:gitgutter_set_sign_backgrounds = 1
let g:gitgutter_highlight_lines = 1

Plug 'andrewstuart/vim-kubernetes'
au FileType yaml nmap <leader>ka :KubeApply<CR>

Plug 'mattn/emmet-vim'
source $DOTFILES/vim/plugins/emmet.vim

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
source $DOTFILES/vim/plugins/fzf.vim

Plug 'skwp/greplace.vim'
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

Plug 'christoomey/vim-tmux-navigator'

source $DOTFILES/vim/plugins/disabled.vim
Plug 'ryanoasis/vim-devicons'

call plug#end()
