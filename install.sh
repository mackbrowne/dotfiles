#!/bin/sh

cd $HOME

echo '*** Ubuntu setup: update & install stuff ***'
sudo apt-get update -y >> /dev/null
sudo apt-get install build-essential git vim zsh -y >> /dev/null

echo '*** add zsh to shell if not exist ***'
cat /etc/shells | grep zsh || sudo echo $(which zsh) >> /etc/shells
echo '*** make zsh default shell ***'
chsh -s /usr/bin/zsh

echo '*** install node if not exists ***'
node --version || (
  sudo git clone git://github.com/joyent/node /tmp/node
  cd /tmp/node
  sudo git checkout -b v0.10.18
  sudo ./configure >> /dev/null
  sudo make >> /dev/null
  sudo make install >> /dev/null
)

echo '*** install ag if not exists, ag is grep/ack replacement **'
ag --version || (
  sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
  git clone git://github.com/ggreer/the_silver_searcher /tmp/the_silver_searcher
  cd /tmp/the_silver_searcher
  ./build.sh >> /dev/null
  sudo make install >> /dev/null
)

echo '*** make home folder have dotfiles ***'
git init .
git remote add origin git://github.com/ajoslin/dotfiles
git pull origin master

echo '*** install jshint for syntastic ***'
jshint --version || sudo npm install -g jshint --silent

echo '*** Installation Complete ***'
echo '*** Restart your shell and it will use zsh ***'
echo '*** Start vim and it will auto-install all plugins ***'
