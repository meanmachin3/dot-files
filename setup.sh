#!/bin/bash

#Entering as Root
printf "Enter root password...\n"
sudo -v

#Keep alive Root
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#Installing XCode Command Line Tools
printf "Installing XCode CL tools...\n"
xcode-select --install

#Installing Brew
printf "Installing Brew...\n"
if test ! $(which brew); then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#Check Brews
brew doctor && brew update && brew upgrade

#Installing Repositories
printf "Installing Brew Cask and MAS..."
brew install mas
brew tap homebrew/cask-fonts

#Installing Developing tools
printf "Installing Docker.app...\n"
brew cask install --appdir="/Applications" docker
printf "Installing iTerm2.app...\n"
brew cask install --appdir="/Applications" iterm2

#Installing Editor apps
printf "Installing Visual Studio Code.app...\n"
brew cask install --appdir="/Applications" visual-studio-code

#Installing Git
printf "Installing Git...\n"
brew install git

#Installing Python
printf "Installing Python3...\n"
brew install python3
printf "Installing Python packages...\n"
pip3 install autopep8
pip3 install jupyter
pip3 install numpy
pip3 install organize-tool
pip3 install pandas
pip3 install pylint
pip3 install requests
pip3 install speedtest-cli
pip3 install virtualenv

#Install ZSH
printf "Installing ZSH...\n"
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)

#Install plugins
printf "Installing ZSH packages...\n"
brew install zsh-completions
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

#Install node
brew install node
npm install -g commitizen

