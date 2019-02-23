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

# set DPI
xrandr --dpi 166 &

# Set the wallpaper
sh ~/.fehbg &

# set cursor
xsetroot -cursor_name left_ptr &

# start dropbox
dropbox &

# start redshift
redshift &

# start Dunst
dunst &

# Start iBus
ibus-daemon --xim &

# Start MPD and enable rich presence for Discord
mpd &
mpd_discord_richpresence --no-idle --fork &

# Restore the last colorscheme set by pywal
wal -R &

# Start emacs daemon
emacs --daemon=instance1 &

exec i3
