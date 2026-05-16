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
