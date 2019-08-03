#!/bin/bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

#run "xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal"
#run "xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off"
run "nm-applet"
#run "caffeine"
run "pamac-tray"
run "variety"
#run "xfce4-power-manager"
run "blueberry-tray"
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
run "numlockx on"
run "volumeicon"
#run "nitrogen --restore"
run "conky -c $HOME/.config/awesome/system-overview"

run "dropbox"
run "spotify"
run "caprine"
run "stack-client"
run "autokey-gtk"
run "xfce4-clipman"
run "slack"
run "discord"
run "telegram-desktop"
run "dunst"
run "sxhkd"
xsetroot -cursor_name left_ptr &                                                                                                
if ! pgrep -f ICE-SSB-facebook ;
	then	
	firefox -new-instance --class ICE-SSB-facebook --profile /home/ray/.local/share/ice/firefox/facebook  http://www.facebook.com &
fi

if ! pgrep -f ICE-SSB-whatsap ;
then
       	firefox -new-instance --class ICE-SSB-whatsapp --profile /home/ray/.local/share/ice/firefox/whatsapp  https://web.whatsapp.com &
fi

if ! pgrep -f ICE-SSB-evernote ;
then firefox -new-instance --class ICE-SSB-evernote --profile /home/ray/.local/share/ice/firefox/evernote  https://www.evernote.com/Login.action &
fi

if ! pgrep -f ICE-SSB-quora ;
then  firefox -new-instance --class ICE-SSB-quora --profile /home/ray/.local/share/ice/firefox/quora --no-remote http://nl.quora.com &
fi

if ! pgrep -f ICE-SSB-trello ;
then firefox --class ICE-SSB-trello --profile /home/ray/.local/share/ice/firefox/trello --no-remote https://trello.com/b/geEKJdMo/backlog-paravisie &
fi

if ! pgrep -f ICE-SSB-todoist ;
then firefox --class ICE-SSB-todoist --profile /home/ray/.local/share/ice/firefox/todoist --no-remote https://todoist.com/app &
fi

run "vivaldi-snapshot"
