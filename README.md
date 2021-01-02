# wsl-copy

![ci](https://github.com/christianfosli/wsl-copy/workflows/ci/badge.svg)

## Description

Enables yanking text from vim to windows clipboard on Windows Subsystem for Linux.

Use `:Wsly` from visual mode to copy the current selection.

Use `:Wsly` from normal mode to copy the last selection.

Map to a key combination in order to use it with standard vim operands,
like `*aw` to yank a word, `*$` to yank until the end of the line, etc
(replacing * with the key combination you choose).

## Remapping

Map the plugin to the keys of your choice:

```vim
nmap <silent> <new command> <Plug>WslCopy
xmap <silent> <new command> <Plug>WslCopy
```

For example:

```vim
nmap <silent> <leader>y <Plug>WslCopy
xmap <silent> <leader>y <Plug>WslCopy
```

## How to install

Install using your favorite package manager or use vim's built in package
support:

```bash
mkdir -p ~/.vim/pack/christianfosli/start
cd ~/.vim/pack/christianfosli/start
git clone https://github.com/christianfosli/wsl-copy.git
vim :helptags ~/.vim/pack/christianfosli/start/wsl-copy/docs
```

If you are using neovim, replace `~/.vim` with `$XDG_DATA_HOME/nvim`
(normally `~/.local/share/nvim`).
Also, if you are using neovim, you might have a better experience dropping this
plugin and using Neovim's `win32yank.exe` instead :-)
