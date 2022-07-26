# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    script_functions.sh                                :+:    :+:             #
#                                                      +:+                     #
#    By: xvoorvaa <xvoorvaa@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2022/07/19 16:17:39 by xvoorvaa      #+#    #+#                  #
#    Updated: 2022/07/26 17:22:15 by xvoorvaa      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env bash

# -- PRIVATE --

CYAN="\033[0;36m"
PURP="\033[0;35m"
BGREEN='\033[1;32m' 
RED="\033[0;31m"
BLUE="\033[0;34m"
BLUEBG="\033[44m"
WHITE="\033[1;97m"
RESET="\033[0m"

EXE=$1/cub3d
TNUM=1
MAXT=33

# Functions
check_if_non_valid()
{
	printf "\n${WHITE}TEST $TNUM/$MAXT: ${PURP}|| ${CYAN}$1\n"
	printf "${CYAN}$2\n"
	((TNUM+=1))
	kill -0 ${_pid} 2> /dev/null
	if [ $? -eq 0 ]; then
		printf ${RED}"ERROR\n${RESET}"
		echo "Did not return an error or exit code is wrong"
		echo "Should atleast be > 0"
		kill $_pid
		wait $_pid 2> /dev/null
		printf "${BLUEBG}${WHITE}Check $1 for more information${RESET}\n"
	else
		printf "${BGREEN}Succes!${RESET}\n"
	fi
}

run_non_valid_map()
{
	$EXE $1 2> /dev/null & _pid=$!
	sleep 0.3
	check_if_non_valid "$1" "$2"
}

check_if_valid()
{
	printf "\n${WHITE}TEST $TNUM/$MAXT: ${PURP}|| ${CYAN}$2\n"
	((TNUM+=1))
	kill -0 ${_pid}
	if [ $? -eq 0 ]; then
		printf "${BGREEN}Succes!${RESET}\n"
		kill $_pid
		wait $_pid 2> /dev/null
	else
		printf ${RED}"ERROR\n${RESET}"
		echo "Did not return an error or exit code is wrong"
		echo "Should atleast be > 0"
		printf "${BLUEBG}${WHITE}Check $1 for more information${RESET}\n"
	fi
}

run_valid_map()
{
	$EXE $1 2> /dev/null & _pid=$!
	sleep 0.1 # Needed for bash. Otherwise we are too quick
	check_if_valid "$1" "$2"
}

run_weird_png()
{
	printf "\n${WHITE}TEST $TNUM/$MAXT:\n"
	printf "${CYAN}$2${RESET}\n"
	((TNUM+=1))
	$EXE $1 & _pid=$!
	sleep 0.2
	wait $_pid
}

### END FUNCTIONS