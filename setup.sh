#!/usr/bin/env bash
# dotfiles/setup.sh — symlink dotfiles to their target locations

set -e

DOTFILES="$HOME/dotfiles"
BOLD="\033[1m"
GREEN="\033[32m"
YELLOW="\033[33m"
RED="\033[31m"
RESET="\033[0m"

info()  { echo -e "${BOLD}${GREEN}[+]${RESET} $1"; }
warn()  { echo -e "${BOLD}${YELLOW}[!]${RESET} $1"; }

# ── Detect nvim config path by OS ────────────────────────────────────────────
detect_nvim_path() {
  if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    # Git Bash on Windows
    echo "$HOME/AppData/Local/nvim"
  elif grep -qi microsoft /proc/version 2>/dev/null; then
    # WSL: symlink into Windows-side nvim config
    WIN_USER=$(cmd.exe /c "echo %USERNAME%" 2>/dev/null | tr -d '\r')
    echo "/mnt/c/Users/$WIN_USER/AppData/Local/nvim"
  else
    # Linux / macOS
    echo "$HOME/.config/nvim"
  fi
}

NVIM_CONFIG_DIR=$(detect_nvim_path)

# ── Config map: repo-relative path → symlink target ──────────────────────────
declare -A CONFIGS=(
  ["tmux/.tmux.conf"]="$HOME/.tmux.conf"
  ["nvim/init.lua"]="$NVIM_CONFIG_DIR/init.lua"
)

# ── Create one symlink, backing up any existing real file ────────────────────
make_link() {
  local src="$DOTFILES/$1"
  local dest="$2"

  mkdir -p "$(dirname "$dest")"

  if [[ -f "$dest" && ! -L "$dest" ]]; then
    warn "Backing up $dest -> $dest.bak"
    mv "$dest" "$dest.bak"
  fi

  [[ -L "$dest" ]] && rm "$dest"

  ln -s "$src" "$dest"
  info "Linked: $dest -> $src"
}

# ── Move real files into repo and init git ────────────────────────────────────
init_dotfiles() {
  info "Setting up dotfiles at $DOTFILES"
  mkdir -p "$DOTFILES/tmux" "$DOTFILES/nvim"

  if [[ -f "$HOME/.tmux.conf" && ! -L "$HOME/.tmux.conf" ]]; then
    info "Moving ~/.tmux.conf -> $DOTFILES/tmux/.tmux.conf"
    mv "$HOME/.tmux.conf" "$DOTFILES/tmux/.tmux.conf"
  fi

  if [[ -f "$NVIM_CONFIG_DIR/init.lua" && ! -L "$NVIM_CONFIG_DIR/init.lua" ]]; then
    info "Moving $NVIM_CONFIG_DIR/init.lua -> $DOTFILES/nvim/init.lua"
    mv "$NVIM_CONFIG_DIR/init.lua" "$DOTFILES/nvim/init.lua"
  fi

  if [[ ! -d "$DOTFILES/.git" ]]; then
    info "Initializing git repo"
    git -C "$DOTFILES" init
    git -C "$DOTFILES" add .
    git -C "$DOTFILES" commit -m "chore: initial dotfiles"
  fi
}

# ── Create all symlinks ───────────────────────────────────────────────────────
link_all() {
  info "Creating symlinks..."
  for rel_src in "${!CONFIGS[@]}"; do
    make_link "$rel_src" "${CONFIGS[$rel_src]}"
  done
}

# ── Print status ─────────────────────────────────────────────────────────────
print_status() {
  echo ""
  info "Symlink status:"
  for rel_src in "${!CONFIGS[@]}"; do
    dest="${CONFIGS[$rel_src]}"
    if [[ -L "$dest" ]]; then
      echo -e "  ${GREEN}OK${RESET}  $dest"
    else
      echo -e "  ${RED}FAIL${RESET} $dest (not linked)"
    fi
  done
}

# ── Main ──────────────────────────────────────────────────────────────────────
echo -e "\n${BOLD}Dotfiles Setup${RESET}"
echo "──────────────────────────────"

init_dotfiles
link_all
print_status

echo ""
info "Done! To push:"
echo "  cd ~/dotfiles"
echo "  git remote add origin git@github.com:<you>/dotfiles.git"
echo "  git push -u origin main"
echo ""
