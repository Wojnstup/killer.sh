#! /bin/bash

mode=$(echo -e "Select\nFast" | dmenu -p "Select kill mode" -sb '#98005d' -fn "Terminus:bold:size:15" -h 27 )

if [[ $mode == "Select" ]]
then
	program=$(ps -u $USER -o %mem,comm| sed -n '1!p'  | sort -r | dmenu -i -sb '#98005d' -l 10 -fn "Terminus:bold:size:15" -h 27 )
	program=$( echo "$program" | awk '{print $2}' )
	pkill $program
else
	pkill electron
	pkill Discord
	pkill firefox
	pkill librewolf
	pkill steam
	pkill signal-desktop
fi
