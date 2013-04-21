# Make sure variables in settings.inc.example are already exported

export NUMBERS=($(seq -w $NUM_START $NUM_END))
export NAMES=( "${NUMBERS[@]/#/$NAME_PREFIX}" )
export COUNT=${#NUMBERS[@]}

export INDEX=$(seq 0 $(expr $COUNT - 1))
