#!/bin/bash

#######################################################################################################################
# Logging functions
#

function logger::trace() {
    logger::logger "TRACE" "$1"
}

function logger::debug() {
    logger::logger "DEBUG" "$1"
}

function logger::info() {
    logger::logger "INFO" "$1"
}

function logger::warning() {
    logger::logger "WARNING" "$1"
}

function logger::error() {
    logger::logger "ERROR" "$1"
}

function logger::logger() {
 local level=$1
 local msg=$2
 local timestamp=$(date '+%Y%m%d%H%M%S')
 
  # timestamp | level | msg
 local log_line="$timestamp | <${level}> | $msg"

  if [ "$level" == "ERROR" ]; then
	    echo -e "${log_line}"
  
  elif [ "$level" == "WARNING" ] || [ "$level" == "INFO" ]; then
  	if [ $quiet_flag = false ]; then			   
	    echo -e "${log_line}"
    fi
  fi
  echo -e "${log_line}" >> ${log_file}  
}
