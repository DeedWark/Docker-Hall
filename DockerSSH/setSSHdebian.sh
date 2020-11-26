#!/usr/bin/bash

apt-get update -y && apt-get install -y ssh

echo 'root:dockerSSH' |chpasswd
echo 'password has changed / To change it -> passwd'

sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

/etc/init.d/ssh start
systemctl enable ssh

$(/etc/init.d/ssh status)
