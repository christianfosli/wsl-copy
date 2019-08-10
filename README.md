# wsl-copy

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

Install using your favorite package manager, or...

If you're using vim 8 or neovim, no package manager is required, just
clone the git repo into the applicable directory.

### Vim 8

```bash
mkdir -p ~/.vim/pack/christianfosli/start
cd ~/.vim/pack/christianfosli/start
git clone https://github.com/christianfosli/wsl-copy.git
vim :helptags ~/.vim/pack/christianfosli/start/wsl-copy/docs
```

### Neovim

```bash
mkdir -p ~/.local/share/nvim/site/pack/christianfosli/start
cd ~/.local/share/nvim/site/pack/christianfosli/start
git clone https://github.com/christianfosli/wsl-copy.git
nvim :helptags ~/.local/share/nvim/site/pack/christianfosli/start/wsl-copy/docs
```


If you want to load plugin manually with `:packadd! wsl-copy` replace
`start` with `opt`

See `:h packages` in vim/nvim for more info.
