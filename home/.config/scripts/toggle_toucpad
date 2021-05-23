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

mouse_stick=$( xinput list  | grep -i "stick.*id=" | wc -l )
id=$(xinput list  | grep -i stick | sed -e s:".*id="::g | cut -c -2)
echo $id > /tmp/stick_id

# touchpad is enabled
if [[ $touchpad_running != "1" ]]
then
	# get the master id and write  it to the /tmp/master_id
	id=$(cat /tmp/stick_id)
	master_id=$(xinput list | grep -i stick | sed -r s:".*\("::g | cut -c -1)
	echo $master_id > /tmp/stick_masterid
	xinput float $id
	notify-send "Mouse stick is disabled"
	
	# keyboard is not running
else

	id=$(cat /tmp/stick_id)
	master_id=$(cat /tmp/stick_masterid)
	xinput reattach $id $master_id
	notify-send "Stick is enabled"
fi
