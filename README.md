# dotfiles
[[toc]]

## Install

Clone source code

```bash
cd $HOME
git clone git@github.com:locphan87/dotfiles.git
```

## Link dot files
### vimrc

```bash
ln -s $DOTFILES/.vimrc ~
mkdir .vim
cp -r $DOTFILES/.vim ~/.vim
```

### tmux

```bash
ln -s $DOTFILES/.tmux.conf ~
```

### shell

```bash
ln -s $DOTFILES/.bash_profile ~
ln -s $DOTFILES/.zshrc ~
ln -s $DOTFILES/.antigenrc ~
```

### git

```bash
ln -s $DOTFILES/.gitconfig ~
ln -s $DOTFILES/.gitignore_global ~
```

### other files

```bash
ln -s $DOTFILES/<file-name> ~
```
