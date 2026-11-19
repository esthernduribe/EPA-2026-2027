#!/bin/bash
# Usage: ./lab04_cpu_count_2.sh MIN_NUM_CORES
# Example: ./lab04_cpu_count_2.sh 4

# Prints the usage message and stops the script
usage() {
    echo "Usage: $(basename "$0") [MIN_NUM_CORES]"
    exit 1
}

# Show usage if no number was given
if [ -z "$1" ]; then
    usage
fi

# Common error: Validate input before performing numeric comparisons.
if [[ ! "$1" =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: Provide a positive integer for MIN_NUM_CORES."
    # Common error: Terminate script if unrecoverable error found (like missing required input parameter).
    exit 1
fi

# Count available CPUs and compare against the required minimum.
num_cpu=$(grep processor /proc/cpuinfo | wc -l)

if [ "$num_cpu" -lt "$1" ]; then
    echo "Error: Only $num_cpu CPUs available; $1 required."
    exit 1
fi

# This solution does not use/need the else because of the use of the "exit 1" command. An alternative solution might use else.
echo "OK: $num_cpu CPUs available; $1 required."
