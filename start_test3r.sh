#!/usr/bin/env bash

EXE=$1/cub3d

# Functions
check_if_non_valid()
{
	if [ $? -eq 0 ]; then
		echo "Did not return an error or exit code is wrong"
		echo "Should atleast be > 0"
	fi
}

run_non_valid_map()
{
	$EXE $1 2> /dev/null
	check_if_non_valid
}

check_if_valid()
{
	if [ ! $? -eq 0 ]; then
		echo "You returned an error or returned the wrong exit code"
		echo "Should be 0"
	fi
	kill -INT ${_pid}
}

run_valid_map()
{
	$EXE $1 & _pid=$!
	check_if_valid
}

### END FUNCTIONS



#Checking if file exists
if [ $# -eq 0 ]; then
	echo "I need the path of your cub3d directory"
	exit 1
fi

if [ ! -d "$1" ]; then
	echo "Directory does not exist"
	exit 1
fi

make -C $1

# Valid MAPS
run_valid_map MAPS/basic.cub
run_valid_map MAPS/double_extension.cub.cub

# NON_VALID MAPS
$run_non_valid_map MAPS/empty.cub
$run_non_valid_map MAPS/wrong_extension.ber
$run_non_valid_map MAPS/wrong_extension2.cub.ber
$run_non_valid_map MAPS/noplayer.cub
$run_non_valid_map MAPS/unknown_char.cub

# Weird PNGs

# Weird XPMs
