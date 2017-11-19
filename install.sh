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

echo '*** install mongodb if not exist ***'
mongod --version || (
  brew install mongodb
  brew services start mongodb
)

echo '*** install meteor if not exists ***'
meteor --version || (
  curl https://install.meteor.com/ | sh
)

echo '=== INSTALL APPLICATIONS ==='

echo '*** brew cask ***'
brew cask --version || ( 
  brew tap caskroom/cask
)

echo '*** install google chrome ***'
google-chrome --version || ( 
  brew cask install google-chrome
)

echo '*** install firefox ***'
firefox --version || ( 
  brew cask install firefox
)

echo '*** install canary ***'
canary --version || ( 
  brew cask install canary
)

echo '*** install franz ***'
franz --version || ( 
  brew cask install franz
)

echo '*** install iterm2 ***'
iterm2 --version || ( 
  brew cask install iterm2
)

echo '*** install sip ***'
sip --version || ( 
  brew cask install sip
)

echo '*** install airdroid ***'
airdroid --version || ( 
  brew cask install airdroid
)

echo '*** install robo-3t ***'
robo-3t --version || ( 
  brew cask install robo-3t
)

echo '*** install ntfs4mac ***'
paragon-ntfs --version || (
  brew cask install paragon-ntfs
)

echo '*** install atom ***'
atom --version || ( 
  brew cask install atom
)

echo '*** install visual studio code ***'
visual-studio-code --version || ( 
  brew cask install visual-studio-code
)

echo '*** install acrobat ***'
adobe-acrobat-reader --version || (
  brew cask install adobe-acrobat-reader
)

echo '==== INSTALL APP STORE STUFF ==='
mas --version || (
  brew install mas
)

brew cleanup

echo '*** Install Wunderlist ***'
mas install 410628904

echo '*** magnet ***'
mas install 441258766

echo '*** lastpass ***'
mas install 926036361

echo '*** install ios android sdks ***'
sudo gem install cocoapods

echo '*** xCode ***'		
mas install 497799835		
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo gem install cocoapods
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
