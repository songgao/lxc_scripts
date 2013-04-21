#!/bin/bash

source $(cd $(dirname $0) && pwd)/inc

for name in ${NAMES[@]}; do
    echo Stopping $name
    sudo lxc-stop -n $name
done
