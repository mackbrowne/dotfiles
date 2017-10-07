#!/bin/sh

cd $HOME

echo '*** add zsh to shell if not exist ***'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo '*** make zsh default shell ***'
chsh -s /usr/bin/zsh

echo '*** install homebrew if not exists ***'
brew --version || (
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
)

echo '*** install node if not exists ***'
node --version || (
  brew install node
)

echo '*** install ag if not exists, ag is grep/ack replacement **'
ag --version || (
  brew install the_silver_searcher
)

echo '*** install cloc if not exist ***'
cloc --version || (
  brew install cloc
)

echo '*** install meteor if not exists ***'
meteor --version || (
  curl https://install.meteor.com/ | sh
)

echo '*** install ios android sdks ***'
meteor install-sdk ios
meteor install-sdk android

echo '*** make home folder have dotfiles ***'
git init .
git remote add origin git://github.com/mackbrowne/dotfiles
git pull origin master

echo '*** Installation Complete ***'
echo '*** Restart your shell and it will use zsh ***'

echo '*** remove git repo after configs have been added ***'
rm -rf .git/
