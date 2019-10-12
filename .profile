#!/bin/sh

#echo "reading .profile"
# Profile file. Runs on login. Environmental variables are set here.

# Adds '~/.local/bin' to $PATH
export PATH="$PATH:$HOME/.local/bin/"

# Default programs
export EDITOR="subl3"
export TERMINAL="urxvt"
export BROWSER="chromium"
export READER="zathura"
export FILE_MANAGER="pcmanfm"

export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export QT_QPA_PLATFORMTHEME=qt5ct

# graphical program to use when sudo -A
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export LESS=-R

[ ! -f ~/.config/shortcutrc ] && shortcuts > /dev/null 2>&1

[ -f $HOME/.bashrc ] && . $HOME/.bashrc

# Start graphical server if i3 not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 > /dev/null && exec startx
