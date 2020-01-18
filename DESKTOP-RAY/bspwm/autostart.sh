#!/bin/bash

function run {
  if ! pgrep -f "$1" ;
  then
    $@&
  fi
}

run "xrandr --output VGA-1 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output VIRTUAL1 --off"
run "nm-applet"
run "variety"
run "blueberry-tray"
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
run "numlockx off"
run "volumeicon"
run "conky -c $HOME/.config/awesome/system-overview"
run "/home/ray/scripts/start_network_monitors.sh"

run "compton"
run "spotify"
run "autokey-gtk"
run "copyq"
#run "xfce4-clipman"
run "dunst"
run "mpd"
run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc 
run "vivaldi-snapshot"
run "/home/ray/scripts/tmp_bspwm_adaptive_marked_border"
run "pcloud &"
run "station"
#run "/home/ray/scripts/whatsapp.sh"
#run "/home/ray/scripts/evernote.sh"
#run caprine
#run todoist
#run telegram-desktop
#run slack
#run discord


xsetroot -cursor_name left_ptr &                                                                                                
sleep 1
wmctrl -r Spotify -t 8
#if ! pgrep -f ICE-SSB-facebook ;
#	then	
#	firefox -new-instance --class ICE-SSB-facebook --profile /home/ray/.local/share/ice/firefox/facebook  http://www.facebook.com &
#fi
