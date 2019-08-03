# dotfiles

Various configuration files

- vim
- emacs
- tmux
- tern
- git
- bash
- ack
- ...

## Install

```bash
$ cd ~
$ git clone git@github.com:phanhoangloc/dotfiles.git
```

## Usage

### Copy

Copy any parts or the whole configuration file to overwrite its local version on your machine

```bash
$ cd ~
$ cp ./dotfiles/.gitconfig .
$ cp ./dotfiles/.bash_profile .
$ ...
```

### Manual Link dotfiles

Create a symbolic link to the target file, so it can get new updates from the repository

```
$ cd ~
$ ln -s ./dotfiles/.ackrc .
$ ln -s ./dotfiles/.vimrc .
$ ln -s ./dotfiles/.tern-config .
$ ln -s ./dotfiles/.tmux.conf .
$ ...
```

### Auto link dotfiles

```bash
$ ~/dotfiles/bin/link-dotfiles
```

Please note that it would fail on an existing file/directory.
If you really want to overwrite it, you could delete it and re-run the script.
