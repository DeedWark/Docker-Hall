#!/bin/bash

if [ $UID -ne 0 ] ; then
	echo "You must launch with sudo!"
	exit 1
fi

read -r -p "Password for SSH: " sshpwd
echo -e "Do not forget to change for production"

sed -ri 's/dockerSSH/${sshpwd}/g' ./Dockerfile

docker build -t secureshell .

docker create -it --name="secureshell" --hostname="ssh" --restart="always" secureshell

docker start secureshell 2>/dev/null

sshdocker=$(docker inspect -f "{{ .NetworkSettings.IPAddress }}" secureshell 2>/dev/null)

echo -e "secureshell IP: ${sshdocker}"

echo -e "To enter in secureshell docker\nssh root@${sshdocker}"
