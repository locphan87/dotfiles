# Managing Vim Sessions Without tmux (Floaterm + vim-obsession)

A sample setup for getting tmux-style **predefined pane layouts** and
**switchable named sessions** when tmux isn't available — using only Vim/Neovim,
[vim-floaterm](https://github.com/voldikss/vim-floaterm), and
[vim-obsession](https://github.com/tpope/vim-obsession). Pairs well with iTerm2
window arrangements for the outer shell.

> **The one gap:** neither Floaterm nor obsession keeps a process alive after you
> quit the editor the way `tmux attach` does. You get the *layout* and *session
> switching* back; for genuinely long-lived processes, run them as background
> services and let a layout command cheaply rebuild the foreground panes.

This config is plain Vimscript, so it works in **both Vim 8+ and Neovim**, and
uses **vim-plug** for install.

---

## 1. Plugins (vim-plug)

Add to the plugin section of `~/.vimrc` (or `~/.config/nvim/init.vim`):

```vim
" ── ~/.vimrc ──────────────────────────────────────────────
call plug#begin('~/.vim/plugged')

Plug 'voldikss/vim-floaterm'        " terminal panes
Plug 'tpope/vim-obsession'          " auto-saving sessions
Plug 'dhruvasagar/vim-prosession'   " manages multiple Session.vim files + switching
Plug 'junegunn/fzf'                 " fuzzy picker (session switcher UI)
Plug 'junegunn/fzf.vim'

call plug#end()
```

Then run `:PlugInstall`.

- prosession depends on obsession.
- fzf powers the session switcher. If you already have fzf installed via
  Homebrew, the `junegunn/fzf` line can be `Plug '/opt/homebrew/opt/fzf'`.

---

## 2. Floaterm — the "panes"

```vim
" ── Floaterm settings ─────────────────────────────────────
let g:floaterm_width    = 0.9
let g:floaterm_height   = 0.9
let g:floaterm_position = 'center'
let g:floaterm_title    = '($1/$2) $name'   " shows index + name in border
let g:floaterm_autoclose = 1                " close window when process exits cleanly
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_toggle = '<F12>'

" tmux-like navigation between terminals
nnoremap <silent> <leader>tt :FloatermToggle<CR>
tnoremap <silent> <F12>      <C-\><C-n>:FloatermToggle<CR>
nnoremap <silent> <leader>tn :FloatermNext<CR>
tnoremap <silent> <C-l>      <C-\><C-n>:FloatermNext<CR>
nnoremap <silent> <leader>tp :FloatermPrev<CR>
tnoremap <silent> <C-h>      <C-\><C-n>:FloatermPrev<CR>
nnoremap <silent> <leader>tk :FloatermKill<CR>

" jump straight to a named terminal (creates it if missing, else shows it)
nnoremap <silent> <leader>tg :FloatermShow lazygit<CR>
nnoremap <silent> <leader>ts :FloatermShow shell<CR>

" escape terminal mode without killing muscle memory
tnoremap <Esc> <C-\><C-n>
```

---

## 3. Project layouts — the "predefined panes"

Each function spins up the named terminals for a project. `--silent` opens them
without stealing focus, so you end up back in your code buffer with all panes
ready to cycle into.

```vim
" ── Project layouts ───────────────────────────────────────
" Helper: open a named floaterm only if it isn't already running.
function! s:ensure(name, cwd, cmd) abort
  " --name makes it addressable via :FloatermShow <name>
  let l:base = 'FloatermNew --silent --name=' . a:name . ' --cwd=' . a:cwd
  execute empty(a:cmd) ? l:base : l:base . ' ' . a:cmd
endfunction

" Pricing backend layout: dev server + test watcher + lazygit + a free shell
command! Pricing call s:layout_pricing()
function! s:layout_pricing() abort
  let l:root = expand('~/projects/pricing')
  call s:ensure('server', l:root, 'npm run dev')
  call s:ensure('test',   l:root, 'npm test -- --watch')
  call s:ensure('lazygit',l:root, 'lazygit')
  call s:ensure('shell',  l:root, '')
  echo 'Pricing layout ready  —  <leader>tn / <leader>tp to cycle'
endfunction

" A generic layout for the current file's project root (git toplevel)
command! Dev call s:layout_dev()
function! s:layout_dev() abort
  let l:root = trim(system('git -C ' . shellescape(expand('%:p:h')) . ' rev-parse --show-toplevel'))
  if v:shell_error | let l:root = getcwd() | endif
  call s:ensure('shell',   l:root, '')
  call s:ensure('lazygit', l:root, 'lazygit')
endfunction
```

Copy the `s:layout_pricing` block per project, swapping the root/commands.
`:Pricing` rebuilds the whole pane set; because `s:ensure` checks the name
first, re-running it won't spawn duplicates.

---

## 4. Sessions — vim-obsession + prosession

prosession stores one `Session.vim` per directory under a central dir and lets
you switch between them. obsession keeps the active one continuously saved
(splits, buffers, and the Floaterm layout via its session hooks).

```vim
" ── Sessions ──────────────────────────────────────────────
let g:prosession_dir = expand('~/.vim/session')   " all sessions live here
let g:prosession_on_startup = 1                    " auto-restore session for cwd
let g:prosession_default_session = 0               " don't force a default
let g:prosession_per_branch = 1                    " separate session per git branch

" Make Floaterm terminals survive a session save/restore.
" (Obsession persists window layout; this re-arms terminals cleanly.)
set sessionoptions+=terminal
set sessionoptions-=blank

" Start tracking the current dir as a session if not already
command! SessionStart execute 'Obsess ' . g:prosession_dir . '/' . substitute(getcwd(), '/', '%', 'g') . '.vim'
```

> **Vim vs Neovim:** classic **Vim** can serialize terminal buffers via
> `set sessionoptions+=terminal`. **Neovim** does *not* persist terminal job
> state across `:mksession` — on restore you'll get the layout back but need to
> re-run your `:Pricing` command to repopulate the panes. On Neovim, bind
> `:Pricing` to a key and re-fire it after opening a session; it's a
> one-keystroke rebuild.

---

## 5. Session switcher (fzf picker)

Your `tmux choose-session` / `<prefix>s` equivalent:

```vim
" ── Session switcher (fzf) ────────────────────────────────
function! s:session_list() abort
  return map(
        \ split(globpath(g:prosession_dir, '*.vim'), "\n"),
        \ 'fnamemodify(v:val, ":t:r")')
endfunction

function! s:session_switch(name) abort
  execute 'Obsession'   " pause/save current
  execute 'source ' . g:prosession_dir . '/' . a:name . '.vim'
endfunction

command! Sessions call fzf#run(fzf#wrap({
      \ 'source':  s:session_list(),
      \ 'sink':    function('s:session_switch'),
      \ 'options': '--prompt="session> "' }))

nnoremap <silent> <leader>ss :Sessions<CR>
```

---

## Cheat sheet

| Key / command | Action |
|---|---|
| `:Pricing` | build the predefined pane set for that project |
| `<F12>` / `<leader>tt` | toggle the floating terminal in/out |
| `<leader>tn` / `<leader>tp` (or `C-l`/`C-h` in term) | next / prev terminal — like switching tmux panes |
| `<leader>tg` / `<leader>ts` | jump straight to the `lazygit` / `shell` terminal |
| `<F7>` | new terminal |
| `<leader>tk` | kill current terminal |
| `<leader>ss` / `:Sessions` | fuzzy-switch between saved sessions |
| `:SessionStart` | begin tracking the current dir as a session |
| `:Obsession` (toggle) | pause/resume auto-saving the active session |

---

## How it maps to tmux habits

- **Predefined panes** → `:Pricing` (or `:Dev`) layout functions.
- **Switch panes** → `<leader>tn/tp` cycling named Floaterms.
- **Named sessions + switching** → prosession's per-dir/per-branch
  `Session.vim` + `<leader>ss` picker.
- **Detach/reattach with live processes** → the one thing that doesn't carry
  over (Neovim especially). Keep genuinely long-lived processes as background
  services and let `:Pricing` cheaply rebuild the foreground panes on restore.
