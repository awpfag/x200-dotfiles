#!/bin/sh
option="$(echo -e "reboot\npoweroff" | dmenu -i)"
doas $option
