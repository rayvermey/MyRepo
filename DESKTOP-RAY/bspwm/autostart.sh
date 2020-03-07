#!/bin/bash

function run {
  if ! pgrep -f "$1" ;
  then
    $@&
  fi
}

#run "xrandr --output VGA-1 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output VIRTUAL1 --off"
run "nm-applet"
run "variety"
run "/usr/bin/wal -i "$(< "${HOME}/.cache/wal/wal")""
run "blueberry-tray"
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
run "numlockx off"
run "volumeicon"
#run "conky -c $HOME/.config/awesome/system-overview"

run "compton"
run "autokey-gtk"
run "copyq"
#run "xfce4-clipman"
run "dunst"
run "mpd"
run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc 
run "/home/ray/scripts/tmp_bspwm_adaptive_marked_border"
run "pcloud &"
#/home/ray/ao-6.9.0-x86_64.AppImage
#run "station"

run "Vivaldi-stable"
xsetroot -cursor_name left_ptr &                                                                                                
