export ZSH=$HOME/.oh-my-zsh

source ~/.zprofile

ZSH_THEME="steeef"

export ANDROID_HOME=/Users/mackbrowne/android-sdk

export PATH=/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/npm/bin:/usr/local/Cellar/ruby/2.0.0-p0/bin:/Users/mackbrowne/.rvm/gems/ruby-2.0.0-p195/bin:~ANDROID_HOME/platform-tools:~ANDROID_HOME/tools

export EDITOR=vim

zstyle ':completion:*:*:git:*' script ~/.git-completion.sh

alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'

function sedr() {
  sed -i '' 's/$1/$2/g' $(ag -l $1)
}

function gitd {
  touch .git/git-daemon-export-ok
  git daemon --base-path=$1
}

# For tmux-powerline
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH=$HOME/bin:/usr/local/bin:$PATH
