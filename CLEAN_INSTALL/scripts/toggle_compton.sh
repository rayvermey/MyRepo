#!/bin/bash

# Toggles picom, the standalone display compositor.  Meant to be
# assigned to a key binding.  Part of my dotfiles:
# https://gitlab.com/protesilaos/dotfiles.
#
# Copyright (c) 2019 Protesilaos Stavrou <info@protesilaos.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

command -v picom > /dev/null || { echo "Compton is not installed."; exit 1; }

if pgrep -x picom; then
	pkill -x picom
else
	picom --config "$HOME/.config/picom.conf" &
	until pidof picom > /dev/null; do 
		sleep 0.1s
	done
fi
