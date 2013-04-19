# $1: actual number; $2: number of digits
function get_num_with_leading_zeros() {
    printf "%0"$2"d" $1
}

# returns $1-$2
function get_name() {
    echo $1-$2
}
