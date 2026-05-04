#!/bin/bash

#######################################################################################################################
# Functions
#

# Invoke a function over the elements in a comma separated list
# $1 -> function name
# $2 -> comma separated list
function functions::invoke_function_over_array() {
	#echo "functions::invoke_function_over_array, arg1: $1"
	#echo "functions::invoke_function_over_array, arg2: $2"		
  #echo "functions::invoke_function_over_array, other args: ${*:3}"		
		
  IFS=", " read -r -a array <<< "$2"
  for element in "${array[@]}"
  do  
  	$1 $element ${*:3}
  done
}
