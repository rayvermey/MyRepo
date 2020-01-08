#
# ~/.bashrc
#
smartctl -q errorsonly -H -l selftest -l error /dev/sda
smartctl -q errorsonly -H -l selftest -l error /dev/sdb
smartctl -q errorsonly -H -l selftest -l error /dev/sdc
smartctl -q errorsonly -H -l selftest -l error /dev/sdd


PATH=$PATH:/home/ray/scripts
HISTSIZE= HISTFILESIZE= # Infinite history

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias p="sudo pacman"
alias SS="sudo systemctl"
alias r="ranger"
alias ls='ls --color=auto'
alias pdelete="sudo pacman -Rsn"
#PS1='[\u@\h \W]\$ '

# Powerline
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
    source /usr/share/powerline/bindings/bash/powerline.sh
fi

screenfetch
