# Cheatsheet

> Note: This cheatsheet is built based on the customized key mappings **in this repository**.
> It's not the default Vim or pluggin mappings.

## Vim

### General

- Leader key: `,`
- Quit the insert mode: [I] `jk`
- Select current word: `<space>`
- Open Wikilink: `<c-g>`
- Open filename under cursor in a vertical split: `<leader>gf`
- Recall commands from history: [C] `<c-p>`, `<c-n>`
- Clear last search highlighting: `<leader><cr>`
- Navigate between windows: `<c-h>`, `<c-j>`, `<c-k>`, `<c-l>`
- Smart indentation: [V] `>`, `<`
- Reload .vimrc: `<leader>ww`
- Open .vimrc in a vertical window: `<leader>ev`
- Toggle paste mode: `<leader>pp`, `<f5>`
- Selecting your pasted text: `gp`
- Save session: `<f2>`
- Restore session: `<f3>`
- New tab: `<leader>tn`
- Close other tabs: `<leader>to`
- Close tab: `<leader>tc`
- Move tab: `<leader>tm`
- Toggle spell checking: `<leader>ss`

### Plugins

#### vim-kubernetes

- `<leader>ka`: Apply current YAML file

#### ack.vim

- `<leader>ck`: Search without showing the first result on the current buffer

#### coc.vim

- `gd`: Go to definition
- `gy`: Go to type definition
- `gi`: Go to implementation
- `gr`: Go to references
- `K`: Show documentation in preview window
- `<leader>rn`: Rename symbol
- Navigate diagnostics: `[g`, `]g`
- `:Format`: Format current buffer
- `:Fold`: Fold current buffer
- `:OR`: Organize imports
- `:Swagger`: Render Swagger UI
- `<space>a`: Show diagnostics
- `<space>e`: Show extensions
- `<space>c`: Show commands
- `<space>o`: Find symbol of current buffer
- `<space>s`: Search workspace symbols
- `<space>j`: Do default action for next item
- `<space>k`: Do default action for previous item
- `<space>p`: Resume latest coc list

#### easymotion

- `<leader>f`{char}: Move to {char}
- `s`{char}{char}: Move to {char}{char}
- `t`{char}{char}: Move to one character before {char}{char}
- `<leader>L`: Move to line

#### emmet

- `<c-y>`: Leader key
- `<emmet-leader>,`: Expand abbreviations

#### floaterm

- `<leader>ft`: Toggle the window / Create a new one
- `<leader>fp`: Open previous window
- `<leader>fn`: Open next window
- `<leader>fk`: Kill all floaterm instances
- `<leader>fs`: Send current line as command and open the window

#### fzf

- `<c-p>`: Show files
- `<leader>h`: Show history
- `:Rg`: Search content using ripgrep
- `:RG`: Search content using ripgrep, reload command on change
- `<leader>fd`: Call :RG with space
- `<leader>ck`: Call :Ack! with space

#### markdown-preview

- `<leader>P`: Open Preview in browser

#### NERDTree

- `<leader>nn`: Toggle explorer
- `<leader>nf`: Show current file in explorer

#### UltiSnips

- `<tab>`: Expand trigger
- `<c-b>`: Jump forward
- `<c-z>`: Jump backward

## tmux

- `<c-a>`: Prefix
- `<prefix>C`: Clear scrollback buffer
- `M-n`: New window
- `M-1`: Select window 1
- `M-2`: Select window 2
- `M-3`: Select window 3
- `M-.`: Select next window
- `M-,`: Select previous window
- `M->`: Swap next window
- `M-<`: Swap previous window
- `M-f`: Toggle fullscreen
- `M-x`: Kill pane
- `M-X`: Kill window
- `M--`, `<prefix>-`: Split window vertically
- `M-\`, `<prefix>|`: Split window horizontally
- `M-R`: Rename window
- `M-/`: Copy mode
- `<prefix>r`: Reload the config
- `<prefix>Q`: Kill session
- `<prefix>p`: Paste buffer
