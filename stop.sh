#!/bin/bash

source inc

for name in ${NAMES[@]}; do
    echo Stopping $name
    sudo lxc-stop -n $name
done
