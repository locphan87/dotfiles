# dotfiles

Various configuration files

- vim
- tmux
- tern
- git
- bash
- ack

## Install
```
$ cd ~
$ git clone git@github.com:phanhoangloc/dotfiles.git
```

## Usage

### Copy
Copy any parts or the whole configuration file to overwrite its local version on your machine
```
$ cd ~
$ cp ./dotfiles/.gitconfig .
$ cp ./dotfiles/.bash_profile .
```

### Link
Create a symbolic link to the target file, so it can get new updates from the repository
```
$ cd ~
$ ln -s ./dotfiles/.ackrc .
$ ln -s ./dotfiles/.vimrc .
$ ln -s ./dotfiles/.tern-config .
$ ln -s ./dotfiles/.tmux.conf .
```
