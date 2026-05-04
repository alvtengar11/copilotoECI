#!/bin/bash

#######################################################################################################################
# 
#

jq_default_embbeded_version="1.4"

function jq::check_binary() {
	jq_tool=""
	#echo "checking embbeded jq"
	if [ -f $script_dir/../libs/jq-${jq_default_embbeded_version}-linux64 ]; then
		jq_embbeded_tool="$script_dir/../libs/jq-${jq_default_embbeded_version}-linux64"
		$jq_embbeded_tool --version &> /dev/null
		local response=$?
		if [ $response = 0 ]; then
			#echo "using embbeded jq $jq_tool"
			jq_tool=$jq_embbeded_tool
			return
		fi
	fi

	#echo "checking system jq"
	if [ "$jq_tool" = "" ]; then
		jq_system_tool="jq"
		$jq_system_tool --version &> /dev/null
		local response=$?
		if [ $response = 0 ]; then
			#echo "using system jq"
			jq_tool=$jq_system_tool
			return
		else
			echo "jq not installed!"
			exit 1
		fi
	fi
}

jq::check_binary

# Returns the property value from json file
# $1 -> json file
# $2 -> property name
# $3 -> default property value
function jq::read_property() {
	local json_file=$1
	local property_name=$2
	local property_value=$3
	
	local response=$($jq_tool ${property_name} $json_file)
	
	if [ -z "${response}" -o "${response}" = "null" -o "${response}" = "\"\"" ]; then
		echo ${property_value}
		return
	fi
	local resp=$(sed -e 's/^"//' -e 's/"$//' <<<${response})
	echo ${resp}	
	#echo ${response}
}

# Returns array of strings of the property from json file
# $1 -> json file
# $2 -> property name
function jq::read_arrayofstring() {
	local json_file=$1
	local property_name="${2}[]"
	local property_value=null

	local response=$($jq_tool ${property_name} $json_file)
	
    if [ -z "${response}" -o "${response}" = "null" -o "${response}" = "\"\"" ]; then
		echo ${property_value}
		return
	fi
	echo ${response}
}

function jq::echo() {
	echo "$1" | $jq_tool '.'
}
