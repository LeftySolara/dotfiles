# Set up commands for python virtual environments
source virtualenvwrapper.sh

# Prompt for ssh key password and cache it
eval `keychain --eval --agents ssh id_rsa`

# Start mpd
[ ! -s ~/.config/mpd/pid ] && mpd

# RVM stuff
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Start X
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx


export PATH="$HOME/.cargo/bin:$PATH"
