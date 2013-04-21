source settings.inc

export NUMBERS=($(seq -w $NUM_START $NUM_END))
export NAMES=( "${NUMBERS[@]/#/$NAME_PREFIX}" )
export COUNT=${#NUMBERS[@]}

export INDEX=$(seq 0 $(expr $COUNT - 1))
