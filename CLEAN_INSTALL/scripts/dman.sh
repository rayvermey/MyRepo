man $(apropos --long . | dmenu -i -l 30 | awk '{print $2, $1}' | tr -d '()')
