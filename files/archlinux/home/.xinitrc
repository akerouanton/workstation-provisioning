#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap

# merge in defaults and keymaps
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
      [ -x "$f" ] && . "$f"
    done
    unset f
fi

if [ -f /usr/bin/redshift ]; then
	  redshift &
fi

if [ -f /usr/bin/udiskie ]; then
	  udiskie --automount --notify --tray &
fi

# Set the appropriate settings for a single screen
. ~/.config/screen-layouts/single-screen.sh

# Ensure french keyboard layout is used
setxkbmap -layout fr-latin9

# Start Gnome keyring and use it as SSH Agent
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Set wallpaper (does not work in i3 config file)
feh --bg-scale ~/Pictures/bg-screen.jpg

nm-applet &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

exec i3 2>&1 >>~/.local/share/i3/i3.log
