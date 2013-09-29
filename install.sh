#!/bin/sh

cd $HOME

echo *** Ubuntu setup: update & install stuff ***
sudo apt-get update -y
sudo apt-get install build-essential git vim zsh -y

echo *** add zsh to shell if not exist ***
cat /etc/shells | grep zsh || sudo echo $(which zsh) >> /etc/shells
echo *** make zsh default shell ***
chsh -s /usr/bin/zsh

echo *** install node if not exists ***
node --version || (
  git clone git://github.com/joyent/node node
  cd node
  ./configure
  make
  sudo make install
)

echo *** install ag if not exists, ag is grep/ack replacement **
ag --version || (
  sudo apt-get install software-properties-common
  sudo apt-add-repository ppa:mizuno-as/silversearcher-ag
  sudo apt-get update
  sudo apt-get install silversearcher-ag
)

echo *** make home folder have dotfiles ***
git init .
git remote add origin git://github.com/ajoslin/dotfiles
git pull origin master

echo *** install jshint for syntastic ***
jshint --version || sudo npm install -g jshint

echo *** Installation Complete ***
echo ""
echo *** Restart your shell and it will use zsh ***
echo *** Start vim and it will auto-install all plugins ***
