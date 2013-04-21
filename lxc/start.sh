#!/bin/bash

source sh.inc

for name in ${NAMES[@]}; do
    lxc-start -dn $name
done
