# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    test_messages.sh                                   :+:    :+:             #
#                                                      +:+                     #
#    By: xvoorvaa <xvoorvaa@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2022/07/19 16:18:12 by xvoorvaa      #+#    #+#                  #
#    Updated: 2022/07/28 17:35:31 by xvoorvaa      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env bash

# -- PUBLIC --

#VALID
BASIC_MAP="VALID: A super basic map"
BIG_MAP="VALID: A basic map, but bigger!"
DOUBLE_EXT="VALID: A double extension: *.cub.cub"
VALID_HOLE="VALID: A Hole in the map, surrounded by walls"
SCHOOL_MAP="VALID: A map with 42 in it!"
CORRIDOR="VALID: A corridor. Nothing special"
SUBJECT="VALID: Subject map..."
SPACES_START="VALID: Putting spaces at the start of the map"
SPACES_END="VALID: Putting spaces at the end of the map"
SPACES_END2="VALID: Putting spaces and walls at the end of the map"
WEIRD="VALID: Making the most random map"
NEWLINE="VALID: Putting a lot of newlines"
ORDER="VALID: Weird ass order in file"

#NONVALID
EMPTY="INVALID: Empty map"
WRONG_EXT="INVALID: Wrong extension"
WRONG_EXT2="INVALID: Wrong extension 2.0"
NO_PLAYER="INVALID: No player"
TOO_MANY_PLAYERS="INVALID: Too many players"
UNKNOWN="INVALID: Unknown char"
INVALID_HOLE="INVALID: Invalid hole"
WRONG_PATH="INVALID: Wrong path of IMG"
WRONG_VALUE_COLOUR="INVALID: Colour value too high"
WRONG_INPUT_COLOUR="INVALID: Missing a digit for the colours"
NON_PNG="INVALID: Non-PNG"
DIR_CUB="INVALID: Opening a directory.cub"
NEGA_COLOUR="INVALID: Negative input in the colour section"
GIBBERISH="INVALID: Put gibberish in colour input"
TOO_MANY_PATHS="INVALID: Have more than four paths"
TOO_FEW_PATHS="INVALID: Have less than four paths"
PATH_NAME="INVALID: NO & WE are N & W"
ONLY_CUB="INVALID: File name with just .cub"
ONLY_MAP="INVALID: No data given by user"

#VISUAL CHECk
NORMAL_PNG="This should just run as a normal cub3d"
ONE_PIXEL="One pixel PNG. One wall should be completly blue"
TRANSPARENT="Transparent PNG. Transparent parts should be black (IMO)"
ROTATED="Rotated PNG. The pillar should be rotated"
BLACK_F_AND_C="Colour value of the floor and ceiling are both zero. Both should be black"