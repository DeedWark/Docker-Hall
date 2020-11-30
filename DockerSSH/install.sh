#!/bin/bash

if [ $UID -ne 0 ] ; then
	echo "You must launch with sudo!"
	exit 1
fi

read -r -p "Password for SSH: " -s sshpwd
echo -e "\n!!! Do not forget to change password for production !!!"

sed -ri "s/dockerSSH/${sshpwd}/g" ./Dockerfile

read -r -p "Container name: " lxname

docker build -t secureshell .

docker create -it --name="${lxname}" --hostname="ssh" --restart="always" secureshell

docker start ${lxname} 2>/dev/null

sshdocker=$(docker inspect -f "{{ .NetworkSettings.IPAddress }}" ${lxname} 2>/dev/null)

echo -e "${lxname} IP: ${sshdocker}"

echo -e "To enter in ${lxname} docker\nssh root@${sshdocker}"

sed -ri "s/${sshpwd}/dockerSSH/g" ./Dockerfile
