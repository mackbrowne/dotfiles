
alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'

export PATH='/usr/local/bin':$PATH:'/usr/local/share/python:~/.local/bin':${ANT_HOME}/bin:~/tools/android-sdk-

alias appjs='~/tools/appjs/bin/node'
# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}
