export ZSH=$HOME/.oh-my-zsh

//TODO: validate
source ~/.zprofile

ZSH_THEME="steeef"

//TODO: validate
export ANDROID_HOME=/Users/$USER/android-sdk

//TODO: validate
export PATH=/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/npm/bin:/usr/local/Cellar/ruby/2.0.0-p0/bin:/Users/$USER/.rvm/gems/ruby-2.0.0-p195/bin:~ANDROID_HOME/platform-tools:~ANDROID_HOME/tools

export EDITOR=vim

alias cloc-git='cloc $(git ls-files)'

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH=$HOME/bin:/usr/local/bin:$PATH
