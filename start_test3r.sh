#!/usr/bin/env bash

source PRIVATE/script_functions.sh

# -- PUBLIC --

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

echo #newline

# Valid MAPS
echo "VALID MAPS"
run_valid_map MAPS/VALID/basic.cub
run_valid_map MAPS/VALID/big_map.cub
run_valid_map MAPS/VALID/double_extension.cub.cub
run_valid_map MAPS/VALID/valid_hole.cub
run_valid_map MAPS/VALID/42.cub
run_valid_map MAPS/VALID/corridor.cub
run_valid_map MAPS/VALID/subject.cub

# NON_VALID MAPS
echo #Newline
echo "NON VALID MAPS"
run_non_valid_map MAPS/NONVALID/empty.cub
run_non_valid_map MAPS/NONVALID/wrong_extension.ber
run_non_valid_map MAPS/NONVALID/wrong_extension2.cub.ber
run_non_valid_map MAPS/NONVALID/noplayer.cub
run_non_valid_map MAPS/NONVALID/two_player.cub
run_non_valid_map MAPS/NONVALID/unknown_char.cub
run_non_valid_map MAPS/NONVALID/non_valid_hole.cub

# Weird PNGs

# Weird XPMs ?
