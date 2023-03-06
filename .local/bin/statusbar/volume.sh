#!/bin/sh
volume="$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1)%"
muted="$(pactl list sinks | grep -o 'Mute: yes')"
icon=" "

if [ "$muted" = "Mute: yes" ]; then
	volume="xx"
fi

echo "$icon$volume"
