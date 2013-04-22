#!/bin/bash

trap 'echo interrupted; exit' INT

source $(cd $(dirname $0) && pwd)/inc

if [ -z "$VANILLA" ]
then
    echo "Please export environmental variables first; check settings.inc.example for details"
    exit
fi

for i in $INDEX; do
    echo
    echo '--->    '${NAMES[$i]}
    sudo lxc-clone -o $VANILLA -n ${NAMES[$i]}
    sudo sed -i $(echo 's/'$VANILLA_IP'/10.0.3.1'${NUMBERS[$i]}'/g') /var/lib/lxc/${NAMES[$i]}/rootfs/etc/network/interfaces
    
    echo "echo ${NUMBERS[$i]}" | sudo tee /var/lib/lxc/${NAMES[$i]}/rootfs/usr/local/bin/numberw > /dev/null
    sudo chmod a+rx /var/lib/lxc/${NAMES[$i]}/rootfs/usr/local/bin/numberw

    echo "echo $(expr $i + 1)" | sudo tee /var/lib/lxc/${NAMES[$i]}/rootfs/usr/local/bin/number > /dev/null
    sudo chmod a+rx /var/lib/lxc/${NAMES[$i]}/rootfs/usr/local/bin/number
done

echo
