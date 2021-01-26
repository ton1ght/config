#!/bin/bash
#   __           ___     __   __ 
#  / /____  ___ <  /__ _/ /  / /_
# / __/ _ \/ _ \/ / _ `/ _ \/ __/
# \__/\___/_//_/_/\_, /_//_/\__/ 
#                /___/           
# https://github.com/ton1ght


declare options=("alacritty
picom
redshift
xmodmap
bspwm
sxhkd
dunst
i3
mpd
ranger
vim
polybar
rofi
xresources
ncmpcpp
zsh
quit")

choice=$(echo -e "${options[@]}" | rofi -dmenu  -i -p 'Edit config file')

case "$choice" in
	quit)
		echo "Program terminated." && exit 1
	;;
	ncmpcpp)
		choice="$HOME/.config/ncmpcpp/config"
	;;
	mpd)
		choice="$HOME/.config/mpd/mpd.conf"
	;;
	alacritty)
		choice="$HOME/.config/alacritty/alacritty.yml"
	;;
	i3status)
		choice="$HOME/.config/i3status/config"
	;;
	redshift)
		choice="$HOME/.config/redshift/redshift.conf"
	;;
	xmodmap)
		choice="$HOME/.Xmodmap"
	;;
	bspwm)
		choice="$HOME/.config/bspwm/bspwmrc"
	;;
	sxhkd)
		choice="$HOME/.config/sxhkd/sxhkdrc"
	;;
	picom)
		choice="$HOME/.config/picom/picom.conf"
	;;
	rofi)
		choice="$HOME/.config/rofi/config.rasi"
	;;
	dunst)
		choice="$HOME/.config/dunst/dunstrc"
	;;
	i3)
		choice="$HOME/.config/i3/config"
	;;
	ranger)
		choice="$HOME/.config/ranger/rc.conf"
	;;
	vim)
                choice=$(echo -e .config/nvim/* | sed "s/ /\n/g" | rofi -dmenu -i -p "Edit vim config file")
	;;
	polybar)
		choice="$HOME/.config/polybar/config"
	;;
	xresources)
		choice="$HOME/.Xresources"
	;;
	zsh)
		choice="$ZDOTDIR/.zshrc"
	;;
	*)
		exit 1
	;;
esac

alacritty -e nvim "$choice"
