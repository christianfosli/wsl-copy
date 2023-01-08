# wsl-copy

![ci](https://github.com/christianfosli/wsl-copy/workflows/ci/badge.svg)

## Maybe obsolete disclaimer ⚠️

I made this plugin back in 2018, back when WSL had no GUI support,
and connecting it to an X server was not officially supported and a hassle.

Now in 2023 WSL 2 supports X11 and Wayland natively,
on both Windows 11 and Windows 10, through [WSLg](https://github.com/microsoft/wslg). 
Therefore you can now in most cases copy to system clipboard on WSL using the
same approach and tools as on a native Linux installation.

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
