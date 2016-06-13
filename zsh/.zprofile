[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[ ! -s ~/.config/mpd/pid ] && mpd
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
