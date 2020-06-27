#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# set mouse pointer
xsetroot -cursor_name left_ptr &

# activate num lock
numlockx &

# disable screen blanking
xset -dpms &
xset s off &

# start redshift
redshift &

# start Dropbox
dropbox &

# Start ibus
ibus-daemon --xim &

# Start MPD
mpd &

# Enable MPD rich presence for Discord
mpd_discord_rpc &

# Monitor config
xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal --dpi 100 --output DP-4 --mode 2560x1440 --pos 1920x0 --rotate normal --dpi 117 --primary &

#load nvidia settings
nvidia-settings --load-config-only &

# Start emacs daemon
# emacs --daemon &

# Restore last colorscheme set by pywal
wal -R &
feh --bg-scale "$(< "${home}/.cache/wal/wal")" &

# Generate a pywal theme from a random wallpaper
# sh ~/bin/select_random_theme &

# Merge .Xresources
xrdb ~/.Xresources &

# start window manager
exec bspwm
