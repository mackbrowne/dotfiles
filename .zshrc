source ~/.zprofile

export PATH=/usr/local/bin:/usr/texbin/:/usr/bin:/bin:/usr/sbin:/sbin:/Users/ajoslin/tools/redis-2.4.14/src:/Users/ajoslin/dev/tools/adt-bundle-mac/sdk/tools:/usr/local/share/npm/bin/
export EDITOR=vi

zstyle ':completion:*:*:git:*' script ~/.git-completion.sh

alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
alias node32="~/tools/node-v0.8.14-darwin-x86/bin/node"
alias npm32="~/tools/node-v0.8.14-darwin-x86/bin/npm"
alias forge="/Users/ajoslin/Library/Trigger\ Toolkit/forge"
alias resize="imgresizer"
alias dsock="node /Users/ajoslin/dev/me/design-socket-server/app.js"

function gitd {
  touch .git/git-daemon-export-ok
  git daemon --base-path=$1
}

# For tmux-powerline
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
