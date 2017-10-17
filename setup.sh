#! /bin/bash

echo "Starting setup process"
let os=`uname`
let user=`echo $USER`
if [ os == "darwin"]; then
	macOSVersion=`defaults read loginwindow SystemVersionStampAsString`
	echo "OS Recognized as macOS $macOSVersion"
	echo "Installing xcode command line tools"
	xcode-select --install
	echo "Installing HomeBrew Package Manager"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	echo "Installing brews"
	sudo -u $user xargs brew install < brews.txt
	echo "Installing casks"
	export HOMEBREW_CASK_OPTS="--appdir=/Applications"
	brew cask install google-chrome
	brew cask install iina
	brew cask install spotify
	brew cask install visual-studio-code
	brew cask install virtualbox





# All *nix's
echo "Linking dotfiles"
mkdir ~/.dotFiles
cp ~/.* ~/.oldDotFiles
echo "Copied all old dotfiles to .oldDotFiles
link -s dotfiles/.zshrc ~/.zshrc
link -s dotfiles/.vimrc ~/.vimrc
link -s dotfiles/.tmux_conf ~/.tmux_conf

	
