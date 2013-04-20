#!/bin/bash

source sh.inc

for i in `seq -w 1 49`; do
    lxc-start -dn $(get_name squirrel $i)
done
