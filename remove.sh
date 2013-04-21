#!/bin/bash

source inc

for name in ${NAMES[@]}; do
    sudo lxc-destroy -n $name
done
