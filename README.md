# wsl-copy

## Description

Enables yanking text from vim to windows clipboard on Windows Subsystem for Linux.

Use the command `wy` from visual mode, or from normal mode with standard vim operands
like `wyaw` to yank a word, etc.

Technically what happens is we create a temp file /tmp/vimBuffer that we yank into,
and then we send the file contents to clip.exe

## How to install

This plugin can be installed with vim 8's native packages,
or using the package manager of your preference.

### Installation with vims native packages support

* Create or cd to your applicable packages directory

  * If you want vim to automatically load the plugin on startup:

      ```
      mkdir ~/.vim/pack/plugins/start  (if it doesn't exist)
      cd ~/.vim/pack/plugins/start
      ```

  * Or if you want to load plugin yourself (with `:packadd! wsl-copy`,
    e.g. from your .vimrc)

      ```
      mkdir ~/.vim/pack/plugins/opt  (if it doesn't exist)
      cd ~/.vim/pack/plugins/opt
      ```

  * Note `plugins` in above path can be called whatever you like,
    can be used to group plugins for example. See `help packages` for more info

* Clone repo

    ```
    git clone https://github.com/christianfosli/wsl-copy.git
    ```

* Update like with any other git repo 
