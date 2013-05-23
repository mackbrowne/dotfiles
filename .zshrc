source ~/.zprofile

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/npm/bin:/usr/local/deployd/bin:/usr/local/Cellar/ruby/2.0.0-p0/bin
export ANDROID_BIN=/Users/andyjoslin/dev/tools/android/sdk/tools/android
export EDITOR=vi

zstyle ':completion:*:*:git:*' script ~/.git-completion.sh

alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
alias forge="/Users/andyjoslin/Library/Trigger\ Toolkit/forge"
alias resize="imgresizer"
alias dsock="/Users/ajoslin/dev/me/design-socket-server/bin/design-socket"

function gitd {
  touch .git/git-daemon-export-ok
  git daemon --base-path=$1
}

# For tmux-powerline
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
