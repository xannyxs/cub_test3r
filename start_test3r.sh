#!/usr/bin/env bash

# Functions
check_non_valid()
{
	if [ $? -eq 0 ]; then
		echo "Did not return an error or exit code is wrong"
		echo "Should atleast be > 0"
	fi
}

check_valid()
{
	if [ ! $? -eq 0 ]; then
		echo "You returned an error or returned the wrong exit code"
		echo "Should be 0"
	fi
	kill -INT ${_pid}
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
$1/cub3d MAPS/basic.cub & _pid=$!
check_valid
$1/cub3d MAPS/double_extension.cub.cub & _pid=$!
check_valid

# NON_VALID MAPS
$1/cub3d MAPS/empty.cub 2> /dev/null
check_non_valid
$1/cub3d MAPS/wrong_extension.ber 2> /dev/null
check_non_valid
$1/cub3d MAPS/wrong_extension2.cub.ber 2> /dev/null
check_non_valid
$1/cub3d MAPS/noplayer.cub 2> /dev/null
check_non_valid
$1/cub3d MAPS/unknown_char.cub 2> /dev/null
check_non_valid

# Weird PNGs

# Weird XPMs