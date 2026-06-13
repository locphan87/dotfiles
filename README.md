# dotfiles

Personal dotfiles.

## Structure

```
dotfiles/
├── nvim/
│   └── init.lua         # -> ~/AppData/Local/nvim/init.lua  (Windows/Git Bash)
│                        #    /mnt/c/Users/.../AppData/...   (WSL)
│                        #    ~/.config/nvim/init.lua         (Linux/macOS)
├── tmux/
│   └── .tmux.conf       # -> ~/.tmux.conf
├── setup.sh
└── README.md
```

## Neovim

Config lives in `nvim/init.lua`, symlinked to the platform-appropriate path by `setup.sh`.
Plugin manager: [lazy.nvim](https://github.com/folke/lazy.nvim). Leader key: `Space`.

**Plugins:** onedarkpro · telescope · gitsigns · nvim-tree · lualine · nvim-autopairs · Comment.nvim · claudecode.nvim

**Telescope (fuzzy finder)**

| Action | Key |
|--------|-----|
| Find files | `<leader>ff` |
| Live grep | `<leader>fg` |
| Buffers | `<leader>fb` |
| Help tags | `<leader>fh` |

**File explorer (nvim-tree)**

| Action | Key |
|--------|-----|
| Toggle tree | `<leader>e` |
| Reveal current file | `<leader>tf` |

**Windows & tabs**

| Action | Key |
|--------|-----|
| Navigate windows | `C-h/j/k/l` |
| New tab | `<leader>tn` |
| Close tab | `<leader>tc` |
| Close other tabs | `<leader>to` |

**Editing**

| Action | Key |
|--------|-----|
| Save file | `<leader>w` |
| Edit vimrc | `<leader>v` |
| Escape (insert mode) | `jj` |
| Indent (keep selection) | `<` / `>` in visual |
| Jump to first non-blank | `0` |
| Open Mason | `<leader>cm` |

## tmux

Config lives in `tmux/.tmux.conf`, symlinked to `~/.tmux.conf`.

**Prefix:** `C-a` (replaces default `C-b`)

| Action | Key |
|--------|-----|
| Reload config | `prefix r` |
| Kill session | `prefix Q` |
| Split horizontal | `prefix \|` |
| Split vertical | `prefix -` |
| Navigate panes | `prefix h/j/k/l` |
| Previous window | `prefix C-h` |
| Next window | `prefix C-l` |
| Resize pane | `prefix H/J/K/L` (repeatable) |
| Enter copy mode | `prefix Enter` |
| Begin selection | `v` (vi copy mode) |
| Copy selection | `y` (vi copy mode) |

## Fresh install

```bash
git clone https://github.com/<you>/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x setup.sh
./setup.sh
```

The script will:
- Auto-detect OS (Git Bash, WSL, Linux, macOS)
- Back up any existing config as `.bak` before linking
- Create symlinks to all the right locations

## Add a new config

1. Move the file into the repo:
   ```bash
   mv ~/.someconfig ~/dotfiles/tool/.someconfig
   ```
2. Add the entry in `setup.sh` under `declare -A CONFIGS`:
   ```bash
   ["tool/.someconfig"]="$HOME/.someconfig"
   ```
3. Re-run `./setup.sh`
