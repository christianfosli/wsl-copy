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

    nmap <silent> <new command> <Plug>WslCopy
    xmap <silent> <new command> <Plug>WslCopy

For example:

    nmap <silent> <leader>y <Plug>WslCopy
    xmap <silent> <leader>y <Plug>WslCopy

## How to install

This plugin can be installed with vim 8's native packages,
or using the package manager of your preference.

### Installation with vims native packages support

* Cd to your applicable packages directory (mkdir if you haven't yet)
  `cd ~/.vim/pack/foo/start`, or if you want to load plugin manually
  (`:packadd!  wsl-copy`) `cd ~/.vim/pack/foo/opt`

* Clone repo
  `git clone https://github.com/christianfosli/wsl-copy.git`

  note: if your ~/.vim directory is already a repo check out
  [git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)

* Generate help-file
  `vim :helptags ~/.vim/pack/foo/start/wsl-copy/docs`
