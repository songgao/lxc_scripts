#!/bin/bash

source sh.inc

for name in ${NAMES[@]}; do
    lxc-destroy -n $name
done
