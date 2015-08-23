[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx