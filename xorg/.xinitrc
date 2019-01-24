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

# start dropbox
dropbox &

# set cursor
xsetroot -cursor_name left_ptr &

# start redshift
redshift &

# start Dunst
dunst &

# Start iBus
ibus-daemon --xim &

# Start MPD
mpd &

# set DPI
xrandr --dpi 168 &

# Restore the last colorscheme set by pywal
wal -R &
feh --bg-scale "${HOME}/media/pics/walls/1920x1080/r403fr61ut901.jpg" &

# Start emacs daemon
emacs --daemon=instance1 &

exec i3
