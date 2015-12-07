#!/bin/sh

cd $HOME

echo '*** Ubuntu setup: update & install stuff ***'
sudo apt-get update -y >> /dev/null
sudo apt-get install build-essential git vim zsh -y >> /dev/null

echo '*** add zsh to shell if not exist ***'
cat /etc/shells | grep zsh || sudo echo $(which zsh) >> /etc/shells
echo '*** make zsh default shell ***'
chsh -s /usr/bin/zsh

echo '*** install homebrew if not exists ***'
brew --version || (
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
)

echo '*** install ag if not exists, ag is grep/ack replacement **'
ag --version || (
  brew install the_silver_searcher
)

echo '*** install meteor if not exists ***'
meteor --version || (
  curl https://install.meteor.com/ | sh
)

echo '*** make home folder have dotfiles ***'
git init .
git remote add origin git://github.com/mackbrowne/dotfiles
git pull origin master

echo '*** install jshint for syntastic ***'
jshint --version || sudo npm install -g jshint --silent

echo '*** Installation Complete ***'
echo '*** Restart your shell and it will use zsh ***'
echo '*** Start vim and it will auto-install all plugins ***'
