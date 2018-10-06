#!/bin/bash

sed -i "s/rlimit-nproc=3/#rlimit-nproc=3/" /etc/avahi/avahi-daemon.conf

cd /root/.homebridge
file="/root/.homebridge/package.json"
if [ -f "$file" ]
then
	echo "$file found. Going to install additional plugins."
	# read how this works: http://www.jayway.com/2014/03/28/running-scripts-with-npm/
	npm run install
else
	echo "$file not found. You can create this file to install additional plugins not already included in the docker image."
fi

dbus-daemon --system
avahi-daemon -D

service dbus start
service avahi-daemon start

homebridge
