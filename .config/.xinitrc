dwmblocks &
sxhkd &
unclutter &

if [ "$(pidof mpd)" != "" ]; then
	pkill mpd
fi

mpd &
xwallpaper --zoom ~/.config/pape.jpg
picom --vsync --backend=xrender --xrender-sync-fence &
setxkbmap gb

exec dwm
