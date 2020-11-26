#!/bin/bash

if [ $UID -ne 0 ] ; then
	echo "You must launch with sudo!"
	exit 1
fi

docker build -t secureshell .

docker create -it --name="secureshell" --hostname="ssh" --restart="always" secureshell

docker start secureshell 2>/dev/null

sshdocker=$(docker inspect -f "{{ .NetworkSettings.IPAddress }}" secureshell 2>/dev/null)

echo -e "secureshell IP: ${sshdocker}"

echo -e "To enter in secureshell docker\nssh root@${sshdocker}"
