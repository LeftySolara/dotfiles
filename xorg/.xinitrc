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

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# set mouse pointer
xsetroot -cursor_name left_ptr &

# start redshift
#redshift &

# start Dunst
dunst &

# start Dropbox
#dropbox &

# Start MPD
#mpd &

# Enable MPD rich presence for Discord
#mpd_discord_rpc &

# Merge .Xresources
xrdb ~/.Xresources &

# Set Wallpaper
~/.fehbg &

# Start ibus
export GTK_IM_MODULE='ibus'
export QT_IM_MODULE='ibus'
export XMODIFIERS='@im=ibus'
ibus-daemon -dr

# Remap Caps Lock to Escape and toggle Caps Lock by pressing both Shift keys
setxkbmap -option caps:escape,shift:both_capslock &

# start window manager
exec bspwm
