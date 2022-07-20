# dotfiles
## Install

Clone source code

```bash
cd $HOME
git clone git@github.com:locphan87/dotfiles.git
```

Set up $DOTFILES variable

```bash
echo 'export $DOTFILES="$HOME/dotfiles"' >> ~/.bash_profile
source ~/.bash_profile
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
ln -s $DOTFILES/.gitignore_global ~
ln -s $DOTFILES/.gitconfig ~
```

### other files

```bash
ln -s $DOTFILES/<file-name> ~
```
