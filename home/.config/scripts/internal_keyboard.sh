#!/bin/bash
keyboard_running=$(xinput list\
				| grep "AT.*floating.*"\
				|wc -l
			)

id="$(xinput list |  grep AT | sed -e s,↳,,g -e s:"AT.*id="::g  -e s:"\[.*"::g | xargs)"
echo $id > /tmp/id

# keyboad is enabled
if [[ $keyboard_running != "1" ]]
then
	# get the master id and write  it to the /tmp/master_id
	id=$(cat /tmp/id)
	master_id=$(xinput list | grep AT | cut -c 74- | cut -c -1)
	echo $master_id > /tmp/master_id
	xinput float $id
	notify-send "Keyboard is disabled"
	
	# keyboard is not running
else

	id=$(cat /tmp/id | cut -c 5-)
	master_id=$(cat /tmp/master_id)
	xinput reattach $id $master_id
	notify-send "Keyboard is enabled"
fi
