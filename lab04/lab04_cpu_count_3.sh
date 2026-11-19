#!/bin/bash
# Usage: ./lab04_cpu_count_3.sh MIN_NUM_CORES
# Example: ./lab04_cpu_count_3.sh 4

usage() {
    echo "Usage: $(basename "$0") MIN_NUM_CORES"
}

# Store the user's number in our own variable so it can be changed by read
min_cores=$1

# New command 1: read
# If no number was passed in, show the usage message and ask for one
# instead of exiting straight away
if [ -z "$min_cores" ]; then
    usage
    read -p "How many CPU cores are required? " min_cores
fi

# Validate input before performing numeric comparisons
if [[ ! "$min_cores" =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: MIN_NUM_CORES must be a positive integer."
    exit 1
fi

num_cpu=$(nproc)

# New command 2: case
# Rate the VM based on how many CPUs it has
case "$num_cpu" in
    1)
        rating="basic"
        ;;
    2|3|4)
        rating="standard"
        ;;
    *)
        rating="high-performance"
        ;;
esac

echo "This VM has $num_cpu CPUs ($rating)."

# Explain the new commands (printed before the check so they show either way)
echo ""
echo "About the commands used:"
echo "read: if you forget to pass a number, the script asks you for one instead of just exiting."
echo "case: rates the VM as basic, standard or high-performance, so you get more info than just OK or error."
echo ""

if [ "$num_cpu" -lt "$min_cores" ]; then
    echo "Error: Only $num_cpu CPUs available; $min_cores required."
    exit 1
fi

echo "OK: $num_cpu CPUs available; $min_cores required."
