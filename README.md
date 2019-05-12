# wsl-copy

## Description

Enables yanking text from vim to windows clipboard on Windows Subsystem for Linux.

Use the command `wy` from visual mode, or from normal mode with standard vim operands
like `wyaw` to yank a word, `wy$` to yank until the end of the line, etc.

## Remapping

If you would like to use another mapping just remap in vimrc:

    nmap <silent> <new command> <Plug>WslCopy
    xmap <silent> <new command> <Plug>WslCopy

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
