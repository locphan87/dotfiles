call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
" Plug 'flazz/vim-colorschemes'
Plug 'marcopaganini/termschool-vim-theme'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'christoomey/vim-system-copy'
Plug 'digitaltoad/vim-pug'
Plug 'kshenoy/vim-signature'
Plug 'jiangmiao/auto-pairs'

Plug 'MattesGroeger/vim-bookmarks'
source $DOTFILES/vim/plugins/vim-bookmarks.vim

Plug 'mhinz/vim-startify'
source $DOTFILES/vim/plugins/startify.vim

Plug 'ruanyl/vim-gh-line'
let g:gh_github_domain = 'https://github.aus.thenational.com'

Plug '907th/vim-auto-save'
source $DOTFILES/vim/plugins/auto-save.vim

Plug 'mzlogin/vim-markdown-toc'

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
Plug 'alvan/vim-closetag'

Plug 'easymotion/vim-easymotion'
source $DOTFILES/vim/plugins/easymotion.vim

Plug 'bling/vim-airline'
source $DOTFILES/vim/plugins/airline.vim

Plug 'wellle/targets.vim'
Plug 'Shougo/unite.vim'
Plug 'elzr/vim-json'
Plug 'moll/vim-node'
Plug 'ekalinin/Dockerfile.vim'
Plug 'hashivim/vim-terraform'
Plug 'jparise/vim-graphql'
Plug 'leafgarland/typescript-vim'

" Plug 'SirVer/ultisnips'
" source $DOTFILES/vim/plugins/ultisnips.vim
" Plug 'honza/vim-snippets'

Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
source $DOTFILES/vim/plugins/coc.vim

Plug 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

Plug 'voldikss/vim-floaterm'
source $DOTFILES/vim/plugins/floaterm.vim

Plug 'andrewstuart/vim-kubernetes'
au FileType yaml nmap <leader>ka :KubeApply<CR>

Plug 'mattn/emmet-vim'
source $DOTFILES/vim/plugins/emmet.vim

Plug 'mileszs/ack.vim'
nnoremap <Leader>ck :Ack!<Space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

set rtp+=/usr/local/opt/fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
source $DOTFILES/vim/plugins/fzf.vim

Plug 'skwp/greplace.vim'
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
let g:grep_cmd_opts = '--no-heading'

Plug 'christoomey/vim-tmux-navigator'
Plug 'tversteeg/registers.nvim'
let g:registers_paste_in_normal_mode = 1

Plug 'ryanoasis/vim-devicons'

call plug#end()
