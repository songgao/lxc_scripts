#!/bin/bash

trap 'echo interrupted; exit' INT

source inc

for i in $INDEX; do
    echo
    echo '--->    '${NAMES[$i]}
    lxc-clone -o $VANILLA -n ${NAMES[$i]}
    sed -i $(echo 's/10\.0\.3\.100/10\.0\.3\.1'${NUMERS[$i]}'/g') /var/lib/lxc/${NAMES[$i]}/rootfs/etc/network/interfaces
    
    echo "echo "${NUMERS[$i]} > /var/lib/lxc/${NAMES[$i]}/rootfs/usr/local/bin/numberw
    chmod a+rx /var/lib/lxc/${NAMES[$i]}/rootfs/usr/local/bin/numberw

    echo "echo "$i > /var/lib/lxc/${NAMES[$i]}/rootfs/usr/local/bin/number
    chmod a+rx /var/lib/lxc/${NAMES[$i]}/rootfs/usr/local/bin/number
done

echo
