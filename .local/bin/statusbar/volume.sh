#!/bin/sh
volume="$(pactl list sinks | grep 'Volume: front-left' | awk '{printf $5"\n"}')"
muted="$(pactl list sinks | grep 'Mute')"
icon=" "

if [ "$muted" = "	Mute: yes" ]; then
	volume="xx"
fi

echo "$icon$volume"
