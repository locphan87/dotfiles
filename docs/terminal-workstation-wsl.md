An opinionated, CLI-first dev workstation on **Windows + WSL2**. Same philosophy as
`terminal-workstation.md` (the macOS version) — the difference is only the *host* layer.

Mental model: **Windows is the host, WSL2 is where you live.** Keep your toolchain,
dotfiles, and project files *inside* the Linux filesystem (`~/`), never on `/mnt/c` —
cross-filesystem I/O is the #1 WSL2 performance killer.

Companion config drafts live in `wsl/`:

- `wsl/.wslconfig`            → goes to `C:\Users\<you>\.wslconfig` (Windows side)
- `wsl/wsl.conf`             → goes to `/etc/wsl.conf` (inside the distro)
- `wsl/windows-terminal-settings.json` → merge into Windows Terminal settings
- `wsl/bootstrap.sh`         → one-shot WSL provisioning (apt + brew + dotfiles + mise)

---

## Foundation

- **Package manager:** Two layers.
  - On **Windows**: `winget` for GUI apps (Windows Terminal, fonts, Docker Desktop).
  - Inside **WSL2**: `apt` for system packages, plus **Homebrew on Linux** (`brew`) for
    fresher versions of the modern CLI tools — the same formulae as the macOS guide.
    Brew prefix on Linux is `/home/linuxbrew/.linuxbrew` (vs `/opt/homebrew` on Apple Silicon).
- **Terminal emulator:** **Windows Terminal** — GPU-accelerated, tabs/panes, JSON config.
  Set the Ubuntu/WSL profile as default. WezTerm-on-Windows is the power alternative if you
  want one config that follows you across machines.
- **Shell:** zsh inside WSL with **antidote** or **zinit** (skip oh-my-zsh — slow). Or fish.
- **Prompt:** **Starship** — one `starship.toml`, identical to macOS.

## Session & window management

- **Multiplexer:** tmux works identically in WSL2. Or **Zellij** for discoverable keybinds.
  A tmux-free vim workflow (Floaterm + vim-obsession) carries over unchanged.
  - **Auto-start a tmux session on launch:** point the Windows Terminal profile's
    `commandline` at tmux instead of a bare shell. The Ubuntu profile in
    `wsl/windows-terminal-settings.json` opens straight into a session named `sb` rooted at
    `~/projects/second-brain`:

    ```jsonc
    "commandline": "wsl.exe -d Ubuntu --cd ~/projects/second-brain -- tmux new-session -A -s sb"
    ```

    `--cd ~/...` sets the working dir (expanded inside the distro, so it stays on the fast
    Linux filesystem). `tmux new-session -A -s sb` **attaches** to `sb` if it exists,
    otherwise **creates** it — so every new window reattaches to the same persistent session
    instead of spawning a fresh one. A second `Ubuntu (shell)` profile keeps a bare,
    tmux-free prompt available.
- **Window management:** the big macOS→Windows divergence. AeroSpace/yabai don't exist here.
  - Terminal splits: **Windows Terminal panes**.
  - OS-level tiling: built-in **Snap Layouts** (Win+Z), or **komorebi** (i3-like, the
    closest thing to yabai) + **whkd** for hotkeys.

## Editor

- **Neovim inside WSL** with **LazyVim** or **kickstart.nvim** — identical to macOS. Run it
  in the WSL terminal, not Windows-native nvim.
- **AI loop:** Neovim + **Claude Code** in an adjacent Windows Terminal pane, both in WSL.
- If you also use VS Code, install the **WSL extension** so the editor runs on Windows but
  the language servers/toolchain run in Linux.

## Core CLI toolkit

**Identical to the macOS guide.** Every tool installs via brew/apt in WSL and behaves the
same — this is WSL2's whole point: your CLI muscle memory is portable.

| Need         | Tool                |
|--------------|---------------------|
| cat          | bat                 |
| ls           | eza                 |
| cd           | zoxide (`z foo`)    |
| find         | fd                  |
| grep         | ripgrep (`rg`)      |
| fuzzy finder | fzf                 |
| du           | dust                |
| df           | duf                 |
| top          | btop                |
| diff         | delta (git pager)   |
| JSON         | jq / fx             |
| HTTP         | httpie or xh        |

## Git & GitHub

- `git` + **delta**, **lazygit**, **gh** — all inside WSL.
- WSL-specific settings worth doing once:
  - `git config --global core.autocrlf input` — avoid CRLF churn.
  - Share Windows' credential manager so you don't re-auth, or just `gh auth login` and let
    gh handle it.

## Dev environment management

- **mise** — manages Node/Python/Java/Ruby + per-project env/tasks. Works perfectly in WSL2.
- **Containers:** OrbStack is macOS-only. WSL2 equivalents:
  - **Docker Desktop** with the WSL2 backend (daemon in a managed distro, `docker`/`kubectl`
    in your Ubuntu shell), or
  - **Docker Engine installed natively inside the distro** — leaner, no licensing, but you
    manage the daemon (with systemd enabled it's just `systemctl enable --now docker`).

## Dotfiles & reproducibility

- **chezmoi** or a bare git repo. chezmoi's templating shines here: template the handful of
  WSL-vs-macOS differences (credential helper path, brew prefix) into one shared repo.
- **Secrets:** gopass works in WSL. 1Password CLI (`op`) has first-class WSL support and can
  bridge to the Windows 1Password SSH agent.

## WSL2-specific tuning (no macOS equivalent)

1. **`~/.wslconfig` on the Windows side** (`C:\Users\<you>\.wslconfig`) caps the VM's
   resource grab and enables niceties — see `wsl/.wslconfig`.
2. **`/etc/wsl.conf` inside the distro** enables systemd so `systemctl` and service units
   work — see `wsl/wsl.conf`.

After editing either file, run `wsl --shutdown` from PowerShell and reopen the terminal for
changes to take effect.

## Bootstrap

From a fresh Ubuntu-on-WSL2 install:

```bash
git clone <your-dotfiles-repo> ~/dotfiles
cd ~/dotfiles && ./wsl/bootstrap.sh
```

That installs apt essentials, Homebrew + the Brewfile tools, sets zsh as the default shell,
runs `mise install`, and symlinks dotfiles via the existing `setup.sh`.

---

**One-paragraph summary:** Everything *inside* the terminal is identical to the macOS guide —
that's WSL2's gift. What changes is the host layer: Windows Terminal replaces Ghostty,
`winget` replaces `cask`, Docker Desktop/Engine replaces OrbStack, komorebi replaces
AeroSpace — plus two config files (`.wslconfig`, `wsl.conf`) and the discipline of keeping
files in `~/` not `/mnt/c`.
