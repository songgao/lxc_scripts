# Make sure variables in settings.inc.example are already exported

if [ -z "$NUM_START" ] || [ -z "$NUM_END" ] || [ -z "$NAME_PREFIX" ]
then
    echo "Please export environmental variables first; check settings.inc.example for details"
    exit
fi

export NUMBERS=($(seq -w $NUM_START $NUM_END))
export NAMES=( "${NUMBERS[@]/#/$NAME_PREFIX}" )
export COUNT=${#NUMBERS[@]}
export VANILLA_IP="10.0.3.100"

export INDEX=$(seq 0 $(expr $COUNT - 1))
