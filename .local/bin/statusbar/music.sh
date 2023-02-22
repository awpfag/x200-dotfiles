#!/bin/sh
status="$(mpc | sed '2q;d' | awk '{printf $1}')"
output="$(mpc -f "%title%" | head -1)"

case "$status" in
	"[playing]")
		output=" ${output}"
	;;
	"[paused]")
		output=" ${output}" 
	;;
	*)
		exit 0
esac

char="$(echo $output | wc -m)"
limit="56"

if [ "$char" -gt "$limit" ]; then
	output="$(echo $output | cut -c -50)"
	output="${output}..."
fi
        
echo "$output"
