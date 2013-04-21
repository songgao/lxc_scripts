#!/bin/bash

source inc

for name in ${NAMES[@]}; do
    sudo lxc-start -dn $name
done
