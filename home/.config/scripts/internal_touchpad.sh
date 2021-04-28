#!/bin/bash
touchpad_running=$(xinput list |\
	grep -i "Touchpad.*floating.*" \
	| wc -l)

id=$(xinput list  | grep Touch | sed -e s:".*id="::g | cut -c -2)
echo $id > /tmp/touchpad_id

# touchpad is enabled
if [[ $touchpad_running != "1" ]]
then
	# get the master id and write  it to the /tmp/master_id
	id=$(cat /tmp/touchpad_id)
	master_id=$(xinput list | grep -i touchpad | sed -r s:".*\("::g | cut -c -1)
	echo $master_id > /tmp/touchpad_masterid
	xinput float $id
	notify-send "Touchpad is disabled"
	
	# keyboard is not running
else

	id=$(cat /tmp/touchpad_id)
	master_id=$(cat /tmp/touchpad_masterid)
	xinput reattach $id $master_id
	notify-send "Touchpad is enabled"
fi
