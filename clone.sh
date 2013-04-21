#!/bin/bash

trap 'echo interrupted; exit' INT

source $(cd $(dirname $0) && pwd)/inc

for i in $INDEX; do
    echo
    echo '--->    '${NAMES[$i]}
    sudo lxc-clone -o $VANILLA -n ${NAMES[$i]}
    sudo sed -i $(echo 's/10\.0\.3\.100/10\.0\.3\.1'${NUMERS[$i]}'/g') /var/lib/lxc/${NAMES[$i]}/rootfs/etc/network/interfaces
    
    echo "echo "${NUMERS[$i]} | sudo tee /var/lib/lxc/${NAMES[$i]}/rootfs/usr/local/bin/numberw > /dev/null
    sudo chmod a+rx /var/lib/lxc/${NAMES[$i]}/rootfs/usr/local/bin/numberw

    echo "echo "$i | sudo tee /var/lib/lxc/${NAMES[$i]}/rootfs/usr/local/bin/number > /dev/null
    sudo chmod a+rx /var/lib/lxc/${NAMES[$i]}/rootfs/usr/local/bin/number
done

echo
