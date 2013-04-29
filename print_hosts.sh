#!/bin/bash

source $(cd $(dirname $0) && pwd)/inc

for i in $INDEX; do
    echo 10.0.3.1${NUMBERS[$i]}
done
