# Vim configurations

[[toc]]

## Plugin list

Plugin | Description | MOSCOW | Link | Tag
-------|-------------|--------|------|----
vim-unimpaired | Pairs of handy bracket mappings | M | https://github.com/tpope/vim-unimpaired | bracket, list
splitjoin.vim | Switch between single-line and multiline forms of code | S | https://github.com/AndrewRadev/splitjoin.vim | split, join
vim-sensible | Defaults everyone can agree on | M | https://github.com/tpope/vim-sensible | default
vim-colorschemes | One stop shop for vim colorschemes | S | https://github.com/flazz/vim-colorschemes | color, scheme
vim-commentary | Comment stuff out | M | https://github.com/tpope/vim-commentary | comment
vim-abolish | Easily search for, substitute, and abbreviate multiple variants of a word | S | https://github.com/tpope/vim-abolish
targets.vim | Vim plugin that provides additional text objects | M | https://github.com/wellle/targets.vim | objects
tabular | Vim script for text filtering and alignment | S | https://github.com/godlygeek/tabular | table, alignment

## Usage

### vim-unimpaired
#### Next & Previous

Argument list
- `[a`     |:previous|
- `]a`     |:next|
- `[A`     |:first|
- `]A`     |:last|

Buffer list
- `[b`     |:bprevious|
- `]b`     |:bnext|
- `[B`     |:bfirst|
- `]B`     |:blast|

Location list
- `[l`     |:lprevious|
- `]l`     |:lnext|
- `[L`     |:lfirst|
- `]L`     |:llast|

Quickfix list
- `[q`     |:cprevious|
- `]q`     |:cnext|
- `[Q`     |:cfirst|
- `]Q`     |:clast|

Tag list
- `[t`     |:tprevious|
- `]t`     |:tnext|
- `[T`     |:tfirst|
- `]T`     |:tlast|

File list
- `[f`     Go to the file preceding the current one alphabetically in the current file's directory.
- `]f`     Go to the file succeeding the current one alphabetically in the current file's directory.

#### Line operations
- `[<Space>` Add [count] blank lines above the cursor.
- `]<Space>` Add [count] blank lines below the cursor.
- `[e` Exchange the current line with [count] lines above it.
- `]e` Exchange the current line with [count] lines below it.

#### Pasting
- `>p`    Paste after linewise, increasing indent.
- `>P`    Paste before linewise, increasing indent.
- `<p`    Paste after linewise, decreasing indent.
- `<P`    Paste before linewise, decreasing indent.
- `=p`    Paste after linewise, reindenting.
- `=P`    Paste before linewise, reindenting.

### splitjoin.vim
- `gS` to split a one-liner into multiple lines
- `gJ` to join a block into a single-line statement.

### vim-commentary
" `gc{x}` to comment out the target of a motion (x)
" You can also use it as a command
" - either with a range like `:7,17Commentary`
" - or as part of a `:global` invocation like with `:g/TODO/Commentary`

### vim-abolish
- Substitution: `:Subvert`
- Abbreviation: `:Abolish`
- Coercion
  - `crs`       - coerce to snake_case
  - `crm`       - coerce to MixedCase
  - `crc`       - coerce to camelCase
  - `cru`       - coerce to UPPER_CASE
  - `cr`        - coerce to dash-case
  - `cr.`       - coerce to dot.case
  - `crt`       - coerce to Title Case
  - `cr<space>` - coerce to space case

### targets.vim
Pair text objects
- in pair `i{x}`
- a pair `a{x}`
- inside pair `I{x}`
- around pair `A{x}`
- next and last pair `in{x}` `il{x}`
- pair seek: executed when the cursor is not positioned inside a pair, in only seeks on the current line

Quote text objects
- work over multiple lines and support seeking
- supported separators: ' " \`

Separator text objects
- work over multiple lines and support seeking
- supported separators: , . ; : + - = ~ _ * # / | \ & $

Argument text objects: `{x}a`

Multi Text Objects
- Any block `{x}b`
- Any quote `{x}q`

### tabular
`:Tabularize /{exp}`
