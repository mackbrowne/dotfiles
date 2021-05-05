#!/bin/sh

cd $HOME

echo '=== INSTALL COMMAND LINE TOOLS ==='

echo '*** install homebrew if not exists ***'
brew --version || (
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
)

echo '*** install node if not exists ***'
node --version || (
  brew install node
)

echo '*** install yarn if not exists ***'
yarn --version || (
  brew install yarn
)

echo '*** install ag if not exists, ag is grep/ack replacement **'
ag --version || (
  brew install the_silver_searcher
)

echo '*** install cloc if not exist ***'
cloc --version || (
  brew install cloc
)

echo '*** install global yarn packages ***'

echo '*** install expo ***'
expo --version || (
  yarn global add expo-cli
)

echo '*** install firebase ***'
firebase --version || (
  yarn global add firebase-tools
)

echo '=== INSTALL APPLICATIONS ==='

echo '*** install google chrome ***'
google-chrome --version || ( 
  brew install --cask google-chrome
)

echo '*** install firefox ***'
firefox --version || ( 
  brew install --cask firefox
)

echo '*** install chromium ***'
chromium --version || ( 
  brew install --cask chromium
)

echo '*** install franz ***'
franz --version || ( 
  brew install --cask franz
)

echo '*** install sip ***'
sip --version || ( 
  brew install --cask sip
)

echo '*** install spotify ***'
spotify --version || ( 
  brew install --cask spotify
)

echo '*** install ntfs4mac ***'
paragon-ntfs --version || (
  brew install --cask paragon-ntfs
)

echo '*** install visual studio code ***'
visual-studio-code --version || ( 
  brew install --cask visual-studio-code
)

echo '*** install krisp ***'
krisp --version || ( 
  brew install --cask krisp
)

echo '*** install plex ***'
plex --version || ( 
  brew install --cask plex
)

echo '*** install watchman ***'
watchman --version || ( 
  brew install watchman
)

echo '*** install cocoapods ***'
pod --version || (
  brew install cocoapods
)

echo '*** install openjdk8 ***'
brew install --cask adoptopenjdk/openjdk/adoptopenjdk8

brew cleanup

echo '*** xCode ***'		
mas install 497799835		
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
pod setup
 
if(false)
then
echo '*** make home folder have dotfiles ***'
git init .
git remote add origin git://github.com/mackbrowne/dotfiles
git pull origin master

echo '*** Installation Complete ***'
echo '*** Restart your shell and it will use zsh ***'

echo '*** remove git repo after configs have been added ***'
rm -rf .git/
fi
