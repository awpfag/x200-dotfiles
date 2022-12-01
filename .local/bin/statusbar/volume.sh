#!/bin/sh
volume="$(pamixer --get-volume-human)"

if [ "$volume" = "muted" ]; then
	icon=" "
	volume="xx"
else 
	icon=" "
fi

echo "$icon$volume"
