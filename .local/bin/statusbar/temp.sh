#!/bin/sh
temp="$(sensors | grep 'CPU' | awk '{printf $2"\n"}' | sed 's/+//g')"
icon=""
echo " $icon $temp"

