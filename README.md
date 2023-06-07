# dotfiles

## Install

Clone source code

```shell
cd $HOME
git clone git@github.com:locphan87/dotfiles.git
```

Install vim-plug

```shell
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Export DOTFILES

```shell
DOTFILES=$HOME/dotfiles
```

## Link dot files

```shell
ln -s -f <source> <destination>
```

-f will overwrite the existing link

### vimrc

```shell
ln -s -f $DOTFILES/.vimrc ~
mkdir .vim
ln -s -f $DOTFILES/vim/after ~/.vim
ln -s -f $DOTFILES/vim/coc-settings.json ~/.vim
```

### tmux

```shell
ln -s -f $DOTFILES/.tmux.conf ~
```

### shell

```shell
ln -s -f $DOTFILES/.shell_profile ~
ln -s -f $DOTFILES/.zshrc ~
ln -s -f $DOTFILES/.antigenrc ~
```

### git

```shell
ln -s -f $DOTFILES/.gitconfig ~
ln -s -f $DOTFILES/.gitignore_global ~
```

### tmuxinator

```shell
ln -s -f $DOTFILES/tmuxinator ~/.config
```

### neovim

```shell
cd ~/.config/nvim
ln -s -f $DOTFILES/init.vim .
ln -s -f $DOTFILES/vim/coc-settings.json .
```
