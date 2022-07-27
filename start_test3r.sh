# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    start_test3r.sh                                    :+:    :+:             #
#                                                      +:+                     #
#    By: xvoorvaa <xvoorvaa@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2022/07/19 16:18:53 by xvoorvaa      #+#    #+#                  #
#    Updated: 2022/07/27 16:34:08 by xvoorvaa      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env bash

source PRIVATE/script_functions.sh
source PRIVATE/test_messages.sh

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
printf "\n${BLUEBG}${WHITE}Beginning With Valid Map Test${RESET}\n"
run_valid_map MAPS/VALID/basic.cub "$BASIC_MAP" #1
run_valid_map MAPS/VALID/big_map.cub "$BIG_MAP" #2
run_valid_map MAPS/VALID/double_extension.cub.cub "$DOUBLE_EXT" #3
run_valid_map MAPS/VALID/valid_hole.cub "$VALID_HOLE" #4
run_valid_map MAPS/VALID/42.cub "$SCHOOL_MAP" #5
run_valid_map MAPS/VALID/corridor.cub "$CORRIDOR" #6
run_valid_map MAPS/VALID/subject.cub "$SUBJECT" #7
run_valid_map MAPS/VALID/spaces_start.cub "$SPACES_START" #8
run_valid_map MAPS/VALID/spaces_end.cub "$SPACES_END" #9
run_valid_map MAPS/VALID/spaces_end2.cub "$SPACES_END2" #10
run_valid_map MAPS/VALID/some_weird_stuff.cub "$WEIRD" #11
run_valid_map MAPS/VALID/double_newline.cub "$NEWLINE" #12
run_valid_map MAPS/VALID/different_order.cub "$ORDER" #13

# # NON_VALID MAPS
printf "\n${BLUEBG}${WHITE}Now We Check The Invalid Map Test${RESET}\n"
run_non_valid_map MAPS/NONVALID/empty.cub "$EMPTY" #14
run_non_valid_map MAPS/NONVALID/wrong_extension.ber "$WRONG_EXT" #15
run_non_valid_map MAPS/NONVALID/wrong_extension2.cub.ber "$WRONG_EXT2" #16
run_non_valid_map MAPS/NONVALID/noplayer.cub "$NO_PLAYER" #17
run_non_valid_map MAPS/NONVALID/two_player.cub "$TOO_MANY_PLAYERS" #18
run_non_valid_map MAPS/NONVALID/unknown_char.cub "$UNKNOWN" #19
run_non_valid_map MAPS/NONVALID/non_valid_hole.cub "$INVALID_HOLE" #20
run_non_valid_map MAPS/NONVALID/wrong_path.cub "$WRONG_PATH" #21
run_non_valid_map MAPS/NONVALID/wrong_path_colours.cub "$WRONG_VALUE_COLOUR" #22
run_non_valid_map MAPS/NONVALID/wrong_input_colours.cub "$WRONG_INPUT_COLOUR" #23
run_non_valid_map MAPS/NONVALID/non_png.cub "$NON_PNG" #24
run_non_valid_map MAPS/NONVALID/dir.cub "$DIR_CUB" #25
run_non_valid_map MAPS/NONVALID/negative_colour.cub "$NEGA_COLOUR" #26
run_non_valid_map MAPS/NONVALID/wrong_input_colours2.cub "$GIBBERISH" #27
run_non_valid_map MAPS/NONVALID/too_many_paths.cub "$TOO_MANY_PATHS" #28
run_non_valid_map MAPS/NONVALID/too_few_paths.cub "$TOO_FEW_PATHS" #29
run_non_valid_map MAPS/NONVALID/path_name.cub "$PATH_NAME" #30
run_non_valid_map MAPS/NONVALID/.cub "$ONLY_CUB" #31

echo #Newline

# Visual tests
printf "\n${BLUEBG}${WHITE}Check PNGs Now${RESET}\n"
printf "${BLUEBG}${WHITE}We Need Your Help With This One.${RESET}\n"
printf "${BLUEBG}${WHITE}Please check if the game runs, as it should${RESET}\n"
run_weird_png MAPS/VALID/subject.cub "$NORMAL_PNG" #32
run_weird_png MAPS/WEIRD_PNG/one_pixel.cub "$ONE_PIXEL" #33
run_weird_png MAPS/WEIRD_PNG/transparent.cub "$TRANSPARENT" #34
run_weird_png MAPS/WEIRD_PNG/rotated.cub "$ROTATED" #35
run_weird_png MAPS/WEIRD_PNG/black_floor_and_ceiling.cub "$BLACK_F_AND_C" #36
