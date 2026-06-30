#!/usr/bin/env bash
# wsl/bootstrap.sh — one-shot provisioning for a fresh Ubuntu-on-WSL2 install.
#
#   git clone <your-dotfiles-repo> ~/dotfiles
#   cd ~/dotfiles && ./wsl/bootstrap.sh
#
# Idempotent: safe to re-run. Installs apt essentials, Homebrew + Brewfile tools,
# sets zsh as the login shell, installs the /etc/wsl.conf guest config, runs the
# existing setup.sh symlinker, and runs `mise install` if a config is present.

set -euo pipefail

DOTFILES="${DOTFILES:-$HOME/dotfiles}"
BOLD="\033[1m"; GREEN="\033[32m"; YELLOW="\033[33m"; RESET="\033[0m"
info() { echo -e "${BOLD}${GREEN}[+]${RESET} $1"; }
warn() { echo -e "${BOLD}${YELLOW}[!]${RESET} $1"; }

# ── Sanity: are we actually on WSL? ──────────────────────────────────────────
if ! grep -qi microsoft /proc/version 2>/dev/null; then
  warn "This doesn't look like WSL. Continuing anyway in 3s (Ctrl-C to abort)…"
  sleep 3
fi

# ── 1. apt essentials (build toolchain that Homebrew + plugins need) ─────────
info "Updating apt and installing build essentials…"
sudo apt-get update -y
sudo apt-get install -y \
  build-essential procps curl file git zsh unzip ca-certificates

# ── 2. Homebrew on Linux ─────────────────────────────────────────────────────
if ! command -v brew >/dev/null 2>&1; then
  info "Installing Homebrew…"
  NONINTERACTIVE=1 /bin/bash -c \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
# Load brew into this shell, and persist for future zsh sessions.
BREW_ENV='eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'
eval "$BREW_ENV"
grep -qxF "$BREW_ENV" "$HOME/.zprofile" 2>/dev/null || echo "$BREW_ENV" >> "$HOME/.zprofile"

# ── 3. CLI toolkit via Brewfile ──────────────────────────────────────────────
info "Installing CLI tools from Brewfile…"
brew bundle --file="$DOTFILES/wsl/Brewfile"

# ── 4. Make zsh the login shell ──────────────────────────────────────────────
ZSH_BIN="$(command -v zsh)"
if [[ "${SHELL:-}" != "$ZSH_BIN" ]]; then
  info "Setting zsh as the default shell…"
  grep -qxF "$ZSH_BIN" /etc/shells || echo "$ZSH_BIN" | sudo tee -a /etc/shells >/dev/null
  sudo chsh -s "$ZSH_BIN" "$USER" || warn "chsh failed — set zsh manually with: chsh -s $ZSH_BIN"
fi

# ── 5. Install guest WSL config (/etc/wsl.conf) ──────────────────────────────
if [[ -f "$DOTFILES/wsl/wsl.conf" ]]; then
  info "Installing /etc/wsl.conf (enables systemd, sets defaults)…"
  sudo cp "$DOTFILES/wsl/wsl.conf" /etc/wsl.conf
  warn "Run 'wsl --shutdown' from PowerShell, then reopen, for /etc/wsl.conf to take effect."
fi

# ── 6. Symlink dotfiles via the existing cross-platform setup.sh ─────────────
if [[ -x "$DOTFILES/setup.sh" ]]; then
  info "Symlinking dotfiles…"
  "$DOTFILES/setup.sh"
fi

# ── 7. mise: install toolchain versions if a config exists ───────────────────
if command -v mise >/dev/null 2>&1 && \
   { [[ -f "$HOME/.config/mise/config.toml" ]] || [[ -f "$HOME/.mise.toml" ]]; }; then
  info "Running mise install…"
  mise install || warn "mise install reported errors — check your mise config."
fi

info "Done. Open a new terminal (or 'exec zsh') to land in your configured shell."
echo
echo "Next, on the WINDOWS side (not WSL):"
echo "  • Copy wsl/.wslconfig                  -> C:\\Users\\<you>\\.wslconfig"
echo "  • Merge wsl/windows-terminal-settings.json into Windows Terminal settings"
echo "  • winget install Microsoft.WindowsTerminal DEVCOM.JetBrainsMonoNerdFont"
echo "  • (optional) winget install Docker.DockerDesktop LGUG2Z.komorebi LGUG2Z.whkd"
echo "  • Then run 'wsl --shutdown' in PowerShell to apply .wslconfig."
