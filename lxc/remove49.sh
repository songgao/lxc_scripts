#!/bin/bash

source sh.inc

for i in `seq -w 1 49`; do
    lxc-destroy -n $(get_name squirrel $i)
done
