#!/bin/bash

source sh.inc

for i in `seq 1 49`; do
    lxc-start -dn $(get_name squirrel $(get_num_with_leading_zeros $i 2))
done
