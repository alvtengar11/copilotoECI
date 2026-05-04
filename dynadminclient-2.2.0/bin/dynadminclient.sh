#!/bin/bash

script_dir=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

version=2.2.0

###########################################################################################################################################
## Includes

source $script_dir/base-script-functions.sh
source $script_dir/base-script-jq.sh
source $script_dir/base-script-logger.sh
source $script_dir/base-dynadminclient-action.sh
source $script_dir/base-dynadminclient-curl.sh
source $script_dir/base-dynadminclient-model.sh
source $script_dir/base-dynadminclient-process.sh

###########################################################################################################################################
## Variables

readonly default_cfg_file="${script_dir}/../config/dynadminclient.json"
cfg_file=${default_cfg_file}
loaded_config_file=false

readonly default_log_file=${script_dir}/../logs/dynadminclient-$(date +%Y-%m-%d).log
log_file=${default_log_file}

assume_yes=false
has_action=false
invoke_backend_process_flag=false
invoke_backend_process_type=''
invoke_backend_process_action=''
invoke_invalidate_caches_flag=false
invoke_invalidate_caches_nucleus_component_list=''
invoke_change_property_flag=false
invoke_change_property_property_name=''
invoke_change_property_property_value=''
invoke_change_property_nucleus_component_list=''
invoke_change_logging_flag=false
invoke_change_logging_function_name=''
invoke_change_logging_nucleus_component_list=''
invoke_get_sessions_flag=false
invoke_method_flag=false
invoke_method_component_name=''
invoke_method_method_name=''
invoke_rest_api_flag=false
invoke_rest_api_url=''
invoke_rest_api_querystring=''
target_list=()
quiet_flag=false
verbose_flag=false

###########################################################################################################################################
## Controller Functions

function dynadminclient::main::controller::execute_action_on_target() {
  logger::info "execute action on target -> $http_hostport"     
      
  if [ "$invoke_invalidate_caches_flag" = true ] ; then  
        functions::invoke_function_over_array 'dynadminclient::action::invalidate_cache' $invoke_invalidate_caches_nucleus_component_list 
  fi
  
  if [ "$invoke_change_property_flag" = true ] ; then
        functions::invoke_function_over_array 'dynadminclient::action::change_property' $invoke_change_property_nucleus_component_list $invoke_change_property_property_name $invoke_change_property_property_value
  fi
  
  if [ "$invoke_method_flag" = true ] ; then
     dynadminclient::action::invoke_method $invoke_method_component_name $invoke_method_method_name 
  fi
       
  if [ "$invoke_change_logging_flag" = true ] ; then
    functions::invoke_function_over_array $invoke_change_logging_function_name $invoke_change_logging_nucleus_component_list
  fi
  
  if [ "$invoke_get_sessions_flag" = true ] ; then
    dynadminclient::action::get_sessions
  fi
  if [ "$invoke_rest_api_flag" = true ] ; then
    dynadminclient::curl::rest::get $invoke_rest_api_url $invoke_rest_api_querystring
    jq::echo "$curl_response"
  fi
   if [ "$invoke_backend_process_flag" = true ] ; then
    dynadminclient::process::${invoke_backend_process_action} $invoke_backend_process_type
  fi
}

function dynadminclient::main::controller::execute_action_on_targets() {
  local target_number=$(echo ${#target_list[@]})  
  
  logger::info "number of targets -> ${target_number}"  
  if [ "$target_number" -eq 0 ] ; then
    target_list=($http_hostport)  
  fi
  
  logger::info "target list -> ${target_list[@]}"
  
  local flag=true
  for element in "${target_list[@]}"
    do        
      if [ "$flag" = true -a "$element" = "," ] ; then        
          flag=false
          continue
        fi
      dynadminclient::model::set_http_hostport $element
      dynadminclient::main::controller::execute_action_on_target      
    done
}


###########################################################################################################################################
## Validation Functions

function dynadminclient::main::validation::validate_hostport() {
  local value=$1
  logger::debug "dynadminclient::main::validation::validate_hostport: $value"
	
	if [[ $value == *":"* ]]
	then
		local host=$(cut -d ":" -f 1 <<< "$value")	
		local port=$(cut -d ":" -f 2 <<< "$value")
		dynadminclient::main::validation::validate_option_host $host
		dynadminclient::main::validation::validate_option_port $port
	else 
		logger::error "Invalid hostport value: $value"
		exit 1
	fi	
}

function dynadminclient::main::validation::validate_option_host() {
  local value=$1
  logger::debug "dynadminclient::main::validation::validate_option_host: $value"
  case $value in
    localhost)
      ;;
    *)
      if [[ $value =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        # ip value
      	dynadminclient::model::set_http_host $value

      else
        # string value
        dynadminclient::model::set_http_host $value
      	#logger::error "Invalid host value: $value"
      	#exit 1
      fi
      ;;
  esac   
}

function dynadminclient::main::validation::validate_option_port() {
  local value=$1
  logger::debug "dynadminclient::main::validation::validate_option_port: $value"
  if [[ $value -lt 5000 || $1 -gt 65535 ]]; then
    logger::error "Invalid port value: $value"
      exit 1
  else 
  	dynadminclient::model::set_http_port $value
  fi
}

# $1 -> arguments
# $2 -> number of arguments 
# $3 -> option name
function dynadminclient::main::validation::validate_option_number_arguments() {  
 logger::debug "dynadminclient::main::validation::validate_option_number_arguments $1"
 local number=$(echo $1 | wc -w)
 logger::debug "argnumber=$number"  
  if [[ "$number" != "$2" ]]; then
    logger::error "Invalid argument for $3 option: $1; the number of arguments must be $2"
      exit 1      
  fi
}

# $1 -> action arguments
# --change-property '{propname} {propvalue} {comma separated list}'
# --change-property '{propname} {propvalue} file {filepath}'
function dynadminclient::main::validation::validate_action_change_property() {
    local value=$1
	logger::debug "dynadminclient::main::validation::validate_action_change_property $value"
    
    local number=$(echo $value | wc -w)
	logger::debug "argnumber=$number"
    if [[ "$number" -ne 3 && "$number" -ne 4 ]]; then
         logger::error "Invalid argument for '-c,--change-property' option: $value; bad number of arguments"
         exit 1
    fi

    invoke_change_property_property_name=$(echo $1 | cut -d " " -f 1)
    logger::debug "arg1(propertyname)=$invoke_change_property_property_name"
    invoke_change_property_property_value=$(echo $1 | cut -d " " -f 2)
    logger::debug "arg2(propertyvalue)=$invoke_change_property_property_value"
    local arg3=$(echo $value | cut -d " " -f 3)
    logger::debug "arg3=$arg3"
    local arg4=$(echo $value | cut -d " " -f 4)
	  logger::debug "arg4=$arg4"
    
    if [[ "$number" -eq 4 && "$arg3" != "file" ]]; then
         logger::error "Invalid argument for '-c' option: $value; third argument must be file"
         exit 1

    else 
        if [ ! -f $arg4 ]; then
            logger::error "Invalid argument for '-c' option: $value; file '${arg4}' not found"
            exit 1
        fi  
    fi

    if [[ "$invoke_change_property_property_value" = "null" ]]; then
      invoke_change_property_property_value=''        
    fi

    if [[ "$number" -eq 3 ]]; then
        invoke_change_property_nucleus_component_list=$arg3

    else 
        logger::debug "Using file $arg4 as file with nucleus component names"
        IFS=$'\r\n' GLOBIGNORE='*' command eval 'array=($(sed -e "/^\s*$/d" -e "/^#/d" $arg4))'      
          invoke_change_property_nucleus_component_list=${array[*]}
      invoke_change_property_nucleus_component_list=$(echo "$invoke_change_property_nucleus_component_list" | tr ' ' ,)
    fi

    logger::debug "nucleus component list=$invoke_change_property_nucleus_component_list"    
}    

# $1 -> action arguments
# --invalidate-cache '{comma separated list}'
# --invalidate-cache 'file {filepath}'
function dynadminclient::main::validation::validate_action_invalidate_cache() {
	local value=$1
	logger::debug "dynadminclient::main::validation::validate_action_invalidate_cache $value"
	
	local number=$(echo $value | wc -w)
	logger::debug "argnumber=$number"
    
	if [[ "$number" -ne 1 && "$number" -ne 2 ]]; then
		 logger::error "Invalid argument for '-i,--invalidate-cache' option: $value; bad number of arguments"
     exit 1
  fi

	local arg1=$(echo $value | cut -d " " -f 1)
    logger::debug "arg1=$arg1"  

  if [[ "$number" -eq 1 ]]; then
    invoke_invalidate_caches_nucleus_component_list=$arg1
  
  else  
  	if [[ "$arg1" != "file" ]]; then
  		 logger::error "Invalid argument for '-i,--invalidate-cache' option: $value; second argument must be file"
           exit 1

    else
        local arg2=$(echo $value | cut -d " " -f 2)
    	logger::debug "arg2=$arg2"  
     
  		if [ ! -f $arg2 ]; then
  		    logger::error "Invalid argument for '-i,--invalidate-cache' option: $value; file '${arg2}' not found"
           	exit 1

      else
        logger::debug "Using file $arg2 as file with nucleus component names"
        IFS=$'\r\n' GLOBIGNORE='*' command eval 'array=($(sed -e "/^\s*$/d" -e "/^#/d" $arg2))'   
        invoke_invalidate_caches_nucleus_component_list=${array[*]}
        invoke_invalidate_caches_nucleus_component_list=$(echo "$invoke_invalidate_caches_nucleus_component_list" | tr ' ' ,)
  		fi	
    fi
  fi
	logger::debug "nucleus component list=$invoke_invalidate_caches_nucleus_component_list"
}

# $1 -> action arguments
# --logging 'enable|disable|restore {comma separated list}'
# --logging 'enable|disable|restore file {filepath}'
function dynadminclient::main::validation::validate_action_logging() {
	local value=$1
	logger::debug "dynadminclient::main::validation::validate_action_logging $value"
	
	local number=$(echo $value | wc -w)
	logger::debug "argnumber=$number"
    
	if [[ "$number" -ne 2 && "$number" -ne 3 ]]; then
		 logger::error "Invalid argument for '-l,--logging' option: $value; bad number of arguments"
         exit 1
    fi

    local action=$(echo $value | cut -d " " -f 1)
	logger::debug "arg1(action)=$action"  

    if [[ "$action" != "enable" &&
    	  "$action" != "disable" &&
    	  "$action" != "restore" ]]; then
		 logger::error "Invalid argument for '-l,--logging' option: $value; action must be enable or disable or restore"
         exit 1
    fi

    local arg2=$(echo $value | cut -d " " -f 2)
    logger::debug "arg2=$arg2"  
    local arg3=$(echo $value | cut -d " " -f 3)
    logger::debug "arg3=$arg3"  

    if [[ "$number" -eq 3 && "$arg2" != "file" ]]; then
		 logger::error "Invalid argument for '-l,--logging' option: $value; second argument must be file"
         exit 1

    else 
		if [ ! -f $arg3 ]; then
            logger::error "Invalid argument for '-l,--logging' option: $value; file '${arg3}' not found"
         	exit 1
		fi	
    fi

    if [[ "$number" -eq 2 ]]; then
		  invoke_change_logging_nucleus_component_list=$arg2

    else 
    	logger::debug "Using file $arg3 as file with nucleus component names"
    	IFS=$'\r\n' GLOBIGNORE='*' command eval 'array=($(sed -e "/^\s*$/d" -e "/^#/d" $arg3))'		
		  invoke_change_logging_nucleus_component_list=${array[*]}
      invoke_change_logging_nucleus_component_list=$(echo "$invoke_change_logging_nucleus_component_list" | tr ' ' ,)
    fi

	logger::debug "nucleus component list=$invoke_change_logging_nucleus_component_list"
}	

# --target {target comma separated list}
function dynadminclient::main::validation::validate_option_target() {
	local value=$1
	logger::debug "dynadminclient::main::validation::validate_option_target $value"		
	local list_aux=()	
	IFS=', ' read -r -a target_list_AUX <<< ",$value"	
  	local flag=true
	for element in "${target_list_AUX[@]}"
  	do
  	    if [ "$flag" = true ] ; then  	    
  	    	flag=false
  	    	continue
  	    fi  
  	    if [[ $element != *":"* ]]; then  	   
          local alias

          #alias=$(jq::read_property ${cfg_file} ".targets.$element" "null")  	    	
          #alias=$(jq ".targets.$element[]" ${cfg_file})
          alias=$(jq::read_arrayofstring ${cfg_file} ".targets.${element}" "null")          
          logger::info "jq response -> ${alias}"               
          
          alias=${alias#[}
          alias=${alias%]}
          alias=$(echo $alias | tr -d '\n' | tr -d '"' | tr ' ' ',')
          
  	    	logger::info "alias mapping ${element} -> ${alias}"  	      	    
  	    	
  	    	if [ $alias = "null" ]; then 
  	    		logger::error "Unknown alias $element in configuration file"
  	    		exit 1
  	    	
  	    	else   	    	
	  	    IFS=',' read -r -a aliasArray <<< "$alias"
	  	    	for mappedElement in "${aliasArray[@]}"
	  	    	do
	  	    	  dynadminclient::main::validation::validate_hostport $mappedElement  				  	    	
	  	    		list_aux=(${list_aux[@]} $mappedElement)
	  	    	done
	  	    fi 	    	
  	    	
  	    else 
  	    	dynadminclient::main::validation::validate_hostport $element
  	    	list_aux+=($element)
  	    fi  	      	    
  	done
  	
  	#echo "List aux -> ${list_aux[@]}"
  	logger::info "List aux -> ${list_aux[@]}"
      	  	
  	list_aux=($(tr ' ' '\n' <<< "${list_aux[@]}" | sort -u | tr '\n' ' '))  	
  	logger::debug "List aux without duplicates->${list_aux[@]}"  	
  	target_list=(${list_aux[@]})
  	logger::debug "Target list->${target_list[@]}"  	  	
}

function dynadminclient::main::validation::validate_option_user() {
	local value=$1
	logger::debug "dynadminclient::main::validation::validate_option_user $value"
	if [[ ! $value == *":"* ]]
	then 
		logger::error "Invalid argument for '-u,--user' option: $value"	
		exit 1
	fi	
}

function dynadminclient::main::validation::validate_option_config_file() {
	if [ "$loaded_config_file" = true ] ; then
		logger::error "Invalid position of option -f,--config-file: you have to set it as the first option, before anyone option"
		exit 1
	fi

	local value=$1
	if [ -f "$value" ]; then
		local jqresp=$($jq_tool . $value)
		local rc=$?; 
		if [[ $rc == 0 ]]; then 
			cfg_file=$value 
			dynadminclient::main::config::read_configuration
			
	    else 	    
			logger::error "Config file $value has errors"
			exit $rc
		fi	
		
	else 	
		logger::error "Config file $value doesn't exist"
		exit 1
	fi	
}

function dynadminclient::main::validation::validate_option_rest_api() {
  local value=$1
  logger::debug "dynadminclient::main::validation::validate_option_rest_api $value"
  
  local number=$(echo $value | wc -w)
  logger::debug "argnumber=$number"
    
  if [[ "$number" -eq 0 ]]; then
   logger::error "Invalid argument for '-r,--rest-api' option: $value; bad number of arguments"
   exit 1
  fi

  local arg1=$(echo $value | cut -d " " -f 1)
  invoke_rest_api_url="$arg1"

  if [[ "$number" -gt 1 ]]; then
    local arg2=$(echo $value | cut --complement -d " " -f 1)
    invoke_rest_api_querystring="$arg2"
  fi  
  #if [[ "$number" -eq 2  ]]; then
  #  local arg2=""$(echo $value | cut -d " " -f 2)
  #  invoke_rest_api_querystring="$arg2"
  #fi
}

function dynadminclient::main::validation::validate_action_backend_process() {
  local value=$1
  logger::debug "dynadminclient::main::validation::validate_action_backend_process $value"
  
  local number=$(echo $value | wc -w)
  logger::debug "argnumber=$number"
    
  if [[ "$number" -ne 2 ]]; then
   logger::error "Invalid argument for '-b,--backend-process' option: $value; bad number of arguments"
   exit 1
  fi

  local action=$(echo $value | cut -d " " -f 1)
  logger::debug "arg1(action)=$action"  

  if [[ "$action" != "launch" &&
      "$action" != "cancel" &&
      "$action" != "continue" &&
      "$action" != "skip" &&
      "$action" != "status" ]]; then
   logger::error "Invalid argument for '-b,--backend-process' option: $value; action must be launch, cancel, continue, skip or status"
       exit 1
  fi

  local arg2=$(echo $value | cut -d " " -f 2)
  logger::debug "arg2=$arg2"

  invoke_backend_process_action=$action
  invoke_backend_process_type=$arg2
}
###########################################################################################################################################
## Config Functions


function dynadminclient::main::config::read_configuration() {
	if [ "$loaded_config_file" = false ] ; then
		loaded_config_file=true
		if [ -f "$cfg_file" ]; then
      #validate config file
      #$jq_tool . $cfg_file > /dev/null
      #$jq_tool empty $cfg_file
      if [[ ${verbose_flag} = true ]]; then
        $jq_tool . $cfg_file
			  rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi				

      else 
        $jq_tool empty $cfg_file
        rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi       
      fi
		
			log_file=$(jq::read_property ${cfg_file} ".log.filename" ${default_log_file})
			dynadminclient::model::set_userpass $(jq::read_property ${cfg_file} ".auth.user_pass" ${DYNADMIN_DEFAULT_USERPASS})
			
	    else     
	      logger::warning "Config file ${cfg_file} doesn't exist, using default values"
	    fi	
	    
	    touch ${log_file}
      dynadminclient::main::cli::version
      logger::info "jq -> $jq_tool"   
      logger::info "Configuration file -> $cfg_file" 
		  logger::info "Log file -> ${log_file}"
	fi
}


###########################################################################################################################################
## CLI Functions

function dynadminclient::main::cli::ask_if_continue() {
	# Ask if continue before execute any action
	if [ "$assume_yes" = false ] ; then
	    read -p "Do you want to continue (y/n): " flag_continue
	    if [ ! "$flag_continue" = "y" -a ! "$flag_continue" = "Y" -a ! "$flag_continue" = "yes" -a ! "$flag_continue" = "YES" ] ; then
	        exit 0
	    fi
	fi  				
}

function dynadminclient::main::cli::parse_cli() {
	# read the options
	temp=`getopt -o b:c:d:f:ghi:l:m:p:qr:s:t:u:yv --longoptions backend-process:,change-property:,host:,config-file:,get-sessions,help,invalidate-cache:,logging:,method:,port:,quiet,rest-api:,session:,target:,user:,yes,verbose --name "$cmdname" -- "$@"`
	eval set -- "$temp"
	unset temp
	
	# extract options and their arguments into variables.
	while true ; do
	    case "$1" in
        -b|--backend-process)
        logger::debug "-b,--backend-process argument"
          dynadminclient::main::config::read_configuration
          dynadminclient::main::validation::validate_action_backend_process "$2"           
        invoke_backend_process_flag=true
        has_action=true
        shift 2
          ;;
			-c|--change-property)
	        logger::debug "-c,--change-property argument"
		      dynadminclient::main::config::read_configuration
		      dynadminclient::main::validation::validate_action_change_property "$2" 
		      invoke_change_property_flag=true
			  has_action=true
			  shift 2
		      ;;
		  	-d|--host)
	        logger::debug "-d,--host argument"
		      dynadminclient::main::config::read_configuration
		      dynadminclient::main::validation::validate_option_host "$2"
		      shift 2
			  ;;
			-f|--config-file)
			  logger::debug "-f,--config-file argument"
			  dynadminclient::main::validation::validate_option_config_file "$2"
			  shift 2
			  ;;
			 -g|--get-sessions)
			  logger::debug "-g,--get-sessions argument"
        invoke_get_sessions_flag=true
        has_action=true
        shift
			  ;;
		    -h|--help)
			logger::debug "-h,--help argument"
		      dynadminclient::main::cli::usage
		      ;;
		    -i|--invalidate-cache)
		    logger::debug "-i,--invalidate-cache argument"
		      dynadminclient::main::config::read_configuration
		      dynadminclient::main::validation::validate_action_invalidate_cache "$2" 
			  invoke_invalidate_caches_flag=true
			  has_action=true
			  shift 2
		      ;;
		    -l|--logging)
		    logger::debug "-l,--logging argument"
		      dynadminclient::main::config::read_configuration
		      dynadminclient::main::validation::validate_action_logging "$2" 	  
			  action=$(echo "$2" | cut -d " " -f 1)
			  invoke_change_logging_flag=true	  
			  if [ "$action" = "restore" ] ; then
			  	invoke_change_logging_function_name='dynadminclient::action::restore_logging_properties_to_default_values'
		
			  elif [ "$action" = "enable" ] ; then
			  	invoke_change_logging_function_name='dynadminclient::action::enable_logging_properties'
		
			  elif [ "$action" = "disable" ] ; then
			  	invoke_change_logging_function_name='dynadminclient::action::disable_logging_properties'
			  	
			  else 
			  	logger::error "Invalid syntax for '-l' option"
			  	exit 1
			  fi	
			  has_action=true
			  shift 2
		      ;;
		    -m|--method)
		    logger::debug "-m,--method argument"
		      dynadminclient::main::config::read_configuration
		      dynadminclient::main::validation::validate_option_number_arguments "$2" '2' '-m,--method' 
			  invoke_method_flag=true
		      invoke_method_method_name=$(echo "$2"  | cut -d " " -f 1)
		      invoke_method_component_name=$(echo "$2"  | cut -d " " -f 2) 
			  has_action=true
			  shift 2
		      ;;
		    -p|--port)
		    logger::debug "-p,--port argument"
		      dynadminclient::main::config::read_configuration
		      dynadminclient::main::validation::validate_option_port "$2"
		      shift 2
		      ;;
        -q|--quiet)
          logger::debug "-q,--quiet argument"
          quiet_flag=true
          shift
          ;;
        -r|--rest-api)
          dynadminclient::main::config::read_configuration
          dynadminclient::main::validation::validate_option_rest_api "$2"
          invoke_rest_api_flag=true
          has_action=true
          shift 2
          ;;
		    -s|--session)	
		    logger::debug "-s,--session argument"
		      dynadminclient::main::config::read_configuration
		      session_id="$2"
		      shift 2
		      ;;
		    -t|--target)
		    logger::debug "-t,--target argument"
		      dynadminclient::main::config::read_configuration
		      dynadminclient::main::validation::validate_option_target "$2"
		      shift 2
		      ;;
		    -u|--user)
		    logger::debug "-u,--user argument"
		      dynadminclient::main::config::read_configuration
		      dynadminclient::main::validation::validate_option_user "$2" 
		      dynadminclient::model::set_userpass "$2"
		      shift 2
		      ;;
	        -y|--yes)
		    logger::debug "-y,--yes argument"
	          assume_yes=true
	          shift
	          ;;
          -v|--verbose)
            verbose_flag=true
            shift
            ;;  
	        --)
	          shift
	          break
	          ;;
	        *) 
	          logger::error "Internal error! " $1 
	          exit 1
	    esac
	done
	
	if [ ! $has_action = true ]; then logger::error "No invoking dynadmin action (-c, -g, -i, -l, -m) specified"; exit 1; fi
  if [[ $quiet_flag = true ]] && [[ $verbose_flag = true ]]; then logger::error "Incompatible options: quiet and verbose"; exit 1; fi
}

function dynadminclient::main::cli::print_option_values() {
  logger::info "Option values:"
  logger::info "-f (config file): $cfg_file"
  logger::info "-d,--host: $http_host"
  logger::info "-p,--port: $http_port"
  logger::info "-q (quite): $quiet_flag"
  logger::info "-s,--session: $session_id"
  logger::info "-t (target): $target_list"
  logger::info "-u,--user: $userpass"
  logger::info "-v (verbose): $verbose_flag"
  logger::info "-y (assume yes): $assume_yes"
} 

function dynadminclient::main::cli::print_action_values() {
  logger::info "Action values:"  
  logger::info "-b,--backend-process: $invoke_backend_process_flag"
  logger::info "-c,--change-property: $invoke_change_property_flag"
  logger::info "-g,--get-sessions: $invoke_get_sessions_flag"
  logger::info "-l,--logging: $invoke_change_logging_flag"
  logger::info "-i,--invalidate-cache: $invoke_invalidate_caches_flag"
  logger::info "-m,--method: $invoke_method_flag"
  logger::info "-r,--rest-api $invoke_rest_api_flag"
}

function dynadminclient::main::cli::usage() {
  cat $script_dir/base-dynadminclient-help.txt
  if [[ -f $script_dir/../examples/summary-examples.md ]]; then
    cat $script_dir/../examples/summary-examples.md
  fi
  exit 0
}

function dynadminclient::main::cli::version() {
  logger::info "dynadminclient $version"
}

###########################################################################################################################################
## Main

function dynadminclient::main() {
  dynadminclient::main::cli::parse_cli "$@"    
  dynadminclient::main::cli::print_option_values
  dynadminclient::main::cli::print_action_values
 	dynadminclient::main::cli::ask_if_continue	
	dynadminclient::main::controller::execute_action_on_targets
}

dynadminclient::main "$@"
