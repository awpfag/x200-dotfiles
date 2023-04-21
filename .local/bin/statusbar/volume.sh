#!/bin/sh
volume="$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1)%"
muted="$(pactl list sinks | grep 'Mute:' | tail -1 | tr -d '[:space:]')"
icon=" "

if [ "$muted" = "Mute:yes" ]; then
	volume="xx"
fi

echo "$muted"

echo "$icon$volume"
