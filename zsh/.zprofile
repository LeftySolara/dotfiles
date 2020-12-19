[[ -f ~/.bashrc ]] && . ~/.bashrc
eval `keychain --eval --agents ssh id_rsa`
# [ ! -s ~/.config/mpd/pid ] && mpd
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx