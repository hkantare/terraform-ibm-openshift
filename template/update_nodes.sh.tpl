#!/bin/sh
echo "Executing the pre-install steps"
yum -y update
yum install -y wget vim-enhanced net-tools bind-utils tmux git iptables-services bridge-utils docker
systemctl start docker
wget http://${bastion_public_ip}/repos/images/ose3.6-images.tar
docker load -i ose3.6-images.tar
systemctl enable NetworkManager
systemctl start NetworkManager
echo "done"
