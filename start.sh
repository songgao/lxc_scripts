#!/bin/bash

source $(cd $(dirname $0) && pwd)/inc

for name in ${NAMES[@]}; do
    sudo lxc-start -dn $name
done
