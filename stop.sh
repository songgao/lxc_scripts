#!/bin/bash

source sh.inc

for name in ${NAMES[@]}; do
    echo Stopping $name
    lxc-stop -n $name
done
