#!/usr/bin/env bash

# -- PRIVATE --

EXE=$1/cub3d
i=1

# Functions
check_if_non_valid()
{
	printf "\e[1mTEST $i: \e[0m"
	let "i=i+1"
	if [ $EXIT_CODE -eq 0 ]; then
		printf "\e[31mERROR\e[0m\n"
		echo "Did not return an error or exit code is wrong"
		echo "Should atleast be > 0"
		echo #Newline
	else
		printf "\e[1;32mSUCCES!\e[0m\n"
	fi
}

run_non_valid_map()
{
	$EXE $1 2> /dev/null
	EXIT_CODE=$?
	check_if_non_valid
}

check_if_valid()
{
	printf "\e[1mTEST $i: \e[0m"
	let "i=i+1"
	if [ ! $EXIT_CODE -eq 0 ]; then
		printf "\e[31mERROR\e[0m\n"
		echo "You returned an error or returned the wrong exit code"
		echo "Should be 0"
		echo #Newline
	else
		printf "\e[1;32mSUCCES!\e[0m\n"
		kill -INT ${_pid}
	fi
}

run_valid_map()
{
	$EXE $1 & _pid=$!
	if ps | grep " ${_pid} "
	do
		echo "${_pid} is still in the ps output. Must still be running."
		sleep 0.5
	wait $my_pid
	EXIT_CODE=$?
	check_if_valid
}

### END FUNCTIONS