#!/bin/bash

DOT_FILES=( .gitconfig .gitignore_global .gvimrc .tmuxconf .vim .vimrc .zshrc )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

# Install Homebrew
which -s brew

if [[ $? != 0 ]]
then
	echo 'Installing Homebrew...'
	ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

#stop on error
set -e

# Install formula
brew bundle

# install oh-my-zsh
[ ! -d ~/.oh-my-zsh ] && git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
