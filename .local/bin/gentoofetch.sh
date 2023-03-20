#!/bin/sh
reset="\e[0m"
colour="\e[94m"

get_user(){
	username="$USER"
	echo "$username"
}

get_hostname(){
	hostname="$(cat /proc/sys/kernel/hostname)"
	echo "$hostname"
}

get_title(){
	echo "$colour$(get_user)$reset@$colour$(get_hostname)" 
}

get_os(){
	os="$(cat /etc/os-release | grep 'PRETTY_NAME' | tr -d '"' | tr -d 'PRETTY_NAME=' )"
	echo "$os"
}

get_kernel(){
	kernel="$(cat /proc/version | cut -d " " -f 3)"
	echo "$kernel"
}

get_uptime(){
# i stole this code from neofetch source
	s=$(< /proc/uptime)
	s=${s/.*}

	d="$((s / 60 / 60 / 24)) days"
	h="$((s / 60 / 60 % 24)) hours"
	m="$((s / 60 % 60)) mins"

	((${d/ *} == 1)) && d=${d/s}
	((${h/ *} == 1)) && h=${h/s}
	((${m/ *} == 1)) && m=${m/s}

	((${d/ *} == 0)) && unset d
	((${h/ *} == 0)) && unset h
	((${m/ *} == 0)) && unset m

	uptime=${d:+$d, }${h:+$h, }$m
	uptime=${uptime%', '}
	uptime=${uptime:-$s secs}
	echo "$uptime"
}

get_shell(){
	shell="$SHELL"
	echo "$shell"
}

get_packages(){
	packages="$(ls -d /var/db/pkg/*/* | cut -f5- -d/ | wc -l)"
	echo "$packages"
}

get_memory(){
	used_memory="$(free -h | grep 'Mem:' | awk '{printf $3}' |\
		       sed 's/Mi/mb/g' |\
		       sed 's/Gi/gb/g')"
	echo "$used_memory"

}

display(){
	if [ "$1" == "" ]; then
		echo -e "$colour$1$reset$($2)"
	else
		echo -e "$colour$1$reset: $($2)"
	fi
}

final_output(){
	display "" get_title
	display "os" get_os
	display "kernel" get_kernel
	display "uptime" get_uptime
	display "shell" get_shell
	display "packages" get_packages
}

final_output
