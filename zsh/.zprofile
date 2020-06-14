# Prompt for ssh keyphrase and cache it
eval `keychain --eval --agents ssh id_rsa`

# Set up commands for python virtual environments
source virtualenvwrapper.sh

# RVM stuff
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Start iBus
ibus-daemon --xim &

# Start Dropbox
dropbox &

# Start mpd
[ ! -s ~/.config/mpd/pid ] && mpd

# Start X
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
