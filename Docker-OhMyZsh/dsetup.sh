#!/bin/bash

if [ $UID -ne 0 ] ; then
	echo "Sudo required!"
	exit 1
fi

echo -e "\e[0;0;1m CREATE OhMyZsh Docker Container\e[0m\n"

read -r -p " Container's Name: " name
echo -e "\n"

#check docker 
if [ ! "$(docker ps -a |grep $name)" ] ; then
    echo -e " Set $name container"
    if [[ -d $name ]] ; then
	echo " $name directory already exists!"
	exit 1
    else
	mkdir "$name" && cd "$name"
    fi
else
    echo " Container $name already exists!"
    exit 1
fi

wget https://raw.githubusercontent.com/DeedWark/Docker-Hall/Docker-OhMyZsh/master/Dockerfile &>/dev/null 

usermod -aG docker "$USER"
docker build -t "$name" . &>/dev/null
docker create -it --name="$name" "$name":latest /bin/zsh &>/dev/null

cd .. && rm -rf "$name"

echo -e "\n To enter in the container:\n\e[0;0;1m docker start -a -i $name \e[0m\n"
