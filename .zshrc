export ZSH=$HOME/.oh-my-zsh

source ~/.zprofile

ZSH_THEME="steeef"

export PATH=/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/npm/bin:/usr/local/Cellar/ruby/2.0.0-p0/bin:/Users/mackbrowne/.rvm/gems/ruby-2.0.0-p195/bin

export EDITOR=vim

zstyle ':completion:*:*:git:*' script ~/.git-completion.sh

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH=$HOME/bin:/usr/local/bin:$PATH
