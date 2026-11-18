#!/bin/bash

# this is a comment

# for loop to count to 10
for c in {1..5}; do
	echo "Count: $c"

	# if does not use == it uses -eq
	# note the spaces around if [ ]
	if [ $c -eq 3 ]; then
		echo "found the third item"
	fi
done

# how do we pass parameters from the command line
# into this bash script. 
# we use the notation $1, $2 etc to represent
# the first, second etc parameter into this script
if [ -z $1 ]; then
	echo "You didn't pass any paraemters to $0"
else
	echo "You passed in $1 to $0"
fi

# heres a brand new command: 
# it calls ps -ef, then pipes it into word counter
# then stores the result in ct
ct=$(ps -ef | wc -l)
echo "There are $ct processes running on this machine"

#Max number of precceses, passed by the user.
max=$1

# Where to send the output: screen or file
mode=$2

#stop if no number is given
if [ -z "$max" ]; then
    echo "Usage: $0 <number>"
    exit 1
fi

# Count running processes
count=$(ps -e --no-headers | wc -l)

#name of logfile results are written to
logfile="output.txt"

#current time and date
timestamp=$(date "+%Y -%m-%d %H:%M:%S")

#works out which message to show

if [ "$count" -gt "$max" ]; then
    echo "$timestamp - Maximum number of processes exceeded" >> "$logfile"
else
    echo "$timestamp - The maximum number of processes NOT exceeded" >> "$logfile"
fi

# Send the message to the screen or the file
if [ "$mode" = "screen" ]; then
    echo "$message"
elif [ "$mode" = "file" ]; then
    echo "$timestamp - $message" >> "$logfile"
else
    echo "Invalid option. Use 'screen' or 'file'."
    exit 1
fi
