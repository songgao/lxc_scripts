#!/bin/bash

trap 'echo interrupted; exit' INT

source sh.inc

for i in `seq 1 49`; do
    NUM=$(get_num_with_leading_zeros $i 2)
    NAME=$(get_name squirrel $NUM)

    echo
    echo '--->    '$NAME
    lxc-clone -o ubuntu-vanilla -n $NAME
    sed -i $(echo 's/10\.0\.3\.100/10\.0\.3\.1'$NUM'/g') /var/lib/lxc/$NAME/rootfs/etc/network/interfaces
    
    echo "echo "$NUM > /var/lib/lxc/$NAME/rootfs/usr/local/bin/num
    chmod a+rx /var/lib/lxc/$NAME/rootfs/usr/local/bin/num

    echo "echo "$i > /var/lib/lxc/$NAME/rootfs/usr/local/bin/number
    chmod a+rx /var/lib/lxc/$NAME/rootfs/usr/local/bin/number
done

echo
