#! /bin/bash

echo "Starting setup process"
os=`uname`
user=`echo $USER`
if [ $os = "Darwin" ]; then
	macOSVersion=`defaults read loginwindow SystemVersionStampAsString`
	echo "OS Recognized as macOS $macOSVersion"
	echo "Installing xcode command line tools"
	xcode-select --install
	echo "Installing HomeBrew Package Manager"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	echo "Installing brews"
	xargs brew install < brew-list.txt
	echo "Installing casks"
	export HOMEBREW_CASK_OPTS="--appdir=/Applications"
	xargs brew cask install < cask-list.txt
fi

if [ $os = "Linux" ]; then
	echo "Updating..."
	apt-get update && apt-get upgrade
	echo "Installing packages"
	apt-get install zsh python3
fi

# All *nix's
echo "Linking dotfiles"
mkdir ~/.dotFiles
mkdir ~/.oldDotFiles
cp ~/.* ~/.oldDotFiles
echo "Copied all old dotfiles to .oldDotFiles"
ln -s .dotfiles/.zshrc ~/.zshrc
ln -s .dotfiles/.vimrc ~/.vimrc
ln -s .dotfiles/.tmux_conf ~/.tmux_conf
echo "Changing shell to zsh"
chsh -s /usr/bin/zsh

echo "Setup complete!"

	
