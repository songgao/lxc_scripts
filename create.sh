#!/bin/bash

trap 'echo interrupted; exit' INT

. inc

if [ $(lxc-ls | grep "^"$VANILLA"$") ]
then
    read -p "$VANILLA exists. Would you like to destroy it and create a new one (y/n)? "
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        exit 1
    fi
    sudo lxc-stop -n $VANILLA
    sudo lxc-destroy -n $VANILLA
fi

sudo lxc-create -t ubuntu -n $VANILLA
VANILLA_IP="10.0.3.100"

sudo sed -i 's/iface eth0 inet dhcp//g' /var/lib/lxc/$VANILLA/rootfs/etc/network/interfaces
echo "iface eth0 inet static
address $VANILLA_IP
netmask 255.255.255.0
network 10.0.3.0
broadcast 10.0.3.255
gateway 10.0.3.1
dns-nameserver 8.8.8.8 8.8.4.4" | sudo tee -a /var/lib/lxc/$VANILLA/rootfs/etc/network/interfaces > /dev/null

sudo mkdir -p /var/lib/lxc/$VANILLA/rootfs/root/.ssh
sudo cp $HOME/.ssh/id_rsa.pub /var/lib/lxc/$VANILLA/rootfs/root/.ssh/authorized_keys
sudo chmod a+r /var/lib/lxc/$VANILLA/rootfs/root/.ssh/authorized_keys
sudo mkdir -p /var/lib/lxc/$VANILLA/rootfs/home/ubuntu/.ssh
sudo cp $HOME/.ssh/id_rsa.pub /var/lib/lxc/$VANILLA/rootfs/home/ubuntu/.ssh/authorized_keys
sudo chmod a+r /var/lib/lxc/$VANILLA/rootfs/home/ubuntu/.ssh/authorized_keys

sudo lxc-start -dn $VANILLA
scp $VANILLA_INIT root@$VANILLA_IP:/tmp/init.sh
ssh root@$VANILLA_IP "chmod a+x /tmp/init.sh"
ssh root@$VANILLA_IP bash -c /tmp/init.sh
ssh root@$VANILLA_IP shutdown -hP 0
