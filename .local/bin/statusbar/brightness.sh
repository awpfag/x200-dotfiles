#!/bin/sh
brightness="$(light)"
brightness="$(echo ${brightness%.*})"
icon=""

echo "$icon $brightness%"
