My collection of dotfiles
=========================
Setup
-----
This only need to be done if you're starting from scratch. If you're looking to clone/restore your dotfiles skip this section and see [Cloning](#cloning) below.
``` bash
git init --bare $HOME/.myconf
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
config config status.showUntrackedFiles no
```

Usage
-----
Set up an alias in your .bashrc:
``` bash
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
```
Then you manage your config files by executing git commands via your config alias:
``` bash
config status
config add .vimrc
config commit -m "adding .vimrc"
config push
```

Cloning
-------
``` bash
git clone --separate-git-dir=$HOME/.myconf https://github.com/viking66/myconf.git $HOME
```
