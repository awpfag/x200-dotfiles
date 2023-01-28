#!/bin/sh
volume="$(pulsemixer --get-volume | awk '{printf $1"%\n"}')"
muted="$(pulsemixer --get-mute)"

if [ "$muted" = "0" ]; then
	icon=" "
	volume="xx"
else 
	icon=" "
fi

echo "$icon$volume"
