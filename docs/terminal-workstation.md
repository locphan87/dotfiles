Here's an opinionated, CLI-first macOS dev workstation setup. I've grouped it by layer and led each with a recommendation so you can just adopt the defaults if you want.

Foundation

- Package manager: Homebrew — the spine of everything. Put everything in a Brewfile (brew bundle dump) so the whole machine is reproducible: brew bundle --file=~/.Brewfile.
- Terminal emulator: Ghostty (fast, native, zero-config GPU rendering) or WezTerm (Lua-configurable, built-in multiplexing if you want to skip tmux). Both beat iTerm2 on speed; Ghostty for simplicity, WezTerm for power.
- Shell: zsh (macOS default) with zinit or antidote for plugin management. Skip the heavyweight "oh-my-zsh" — it's slow. Or go fish if you want great autosuggestions out of the box with no config.
- Prompt: Starship — single binary, fast, shows git/lang/context. One starship.toml.

Session & window management

- Multiplexer: tmux (or skip it if you use WezTerm/Zellij). Zellij is a friendlier modern alternative with discoverable keybindings and layouts.
- Note: your history shows you've explored a tmux-free vim workflow (Floaterm + vim-obsession) — if you liked that, WezTerm's native panes + a Neovim session manager covers the same ground without tmux.
- Window mgmt (the one GUI concession worth making): AeroSpace (tiling, i3-like, scriptable) or yabai + skhd. Keeps you off the mouse.

Editor

- Neovim with a distribution to start fast: LazyVim or kickstart.nvim (kickstart if you want to understand every line). LSP, treesitter, fuzzy-find, git all wired up.
- If you want AI in the terminal editor: pair Neovim with Claude Code in an adjacent pane — that's a very effective TUI loop.

Core CLI toolkit (modern replacements)

┌──────────────┬─────────────────────────────────────┐
│     Need     │                Tool                 │
├──────────────┼─────────────────────────────────────┤
│ cat          │ bat (syntax highlight)              │
├──────────────┼─────────────────────────────────────┤
│ ls           │ eza                                 │
├──────────────┼─────────────────────────────────────┤
│ cd           │ zoxide (z foo jumps)                │
├──────────────┼─────────────────────────────────────┤
│ find         │ fd                                  │
├──────────────┼─────────────────────────────────────┤
│ grep         │ ripgrep (rg)                        │
├──────────────┼─────────────────────────────────────┤
│ fuzzy finder │ fzf (wire into history, files, git) │
├──────────────┼─────────────────────────────────────┤
│ du           │ dust                                │
├──────────────┼─────────────────────────────────────┤
│ df           │ duf                                 │
├──────────────┼─────────────────────────────────────┤
│ top          │ btop                                │
├──────────────┼─────────────────────────────────────┤
│ diff         │ delta (git pager)                   │
├──────────────┼─────────────────────────────────────┤
│ JSON         │ jq / fx                             │
├──────────────┼─────────────────────────────────────┤
│ HTTP         │ httpie or xh                        │
└──────────────┴─────────────────────────────────────┘

Git & GitHub

- git + delta for diffs, lazygit for a TUI when staging hunks, gh CLI for PRs/issues (you already use it). gitui is a faster lazygit alternative if you want Rust speed.

Dev environment management

- mise (formerly rtx) — single tool to manage Node/Python/Java/Ruby versions and per-project env vars and tasks. Replaces nvm/pyenv/asdf/direnv. Big quality-of-life win for a polyglot stack.
- Containers: OrbStack — dramatically faster and lighter than Docker Desktop on macOS, drop-in docker/kubectl compatible. This is the standout macOS-specific recommendation.

Dotfiles & reproducibility

- Manage dotfiles with chezmoi (templating + secrets-aware) or a bare git repo. Combined with the Brewfile and mise, you can rebuild your whole machine from a git clone.
- Secrets: you already use gopass — keep it, or use 1Password CLI (op) which integrates cleanly with shells and SSH agent.

Nice extras

- tldr (tldr tar for example-first man pages), atuin (SQLite-backed shell history with sync + fuzzy search), navi (interactive cheatsheets), glow (render markdown in terminal — handy for your second-brain notes).

---
Minimal starting Brewfile to get rolling:

brew "starship"; brew "zoxide"; brew "fzf"; brew "ripgrep"; brew "fd"
brew "bat"; brew "eza"; brew "git-delta"; brew "lazygit"; brew "gh"
brew "neovim"; brew "tmux"; brew "mise"; brew "jq"; brew "btop"; brew "atuin"
cask "ghostty"; cask "orbstack"; cask "nikitabobko/tap/aerospace"

