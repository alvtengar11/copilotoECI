#!/bin/bash 

###########################################################################################################################################
## Dependencies with other scripts
#
# curl
# xmllint
# base-script::logger

readonly DYNADMIN_PROPERTY_LOGGING_TRACE='loggingTrace'
readonly DYNADMIN_PROPERTY_LOGGING_DEBUG='loggingDebug'
readonly DYNADMIN_PROPERTY_LOGGING_INFO='loggingInfo'
readonly DYNADMIN_PROPERTY_LOGGING_WARNING='loggingWarning'
readonly DYNADMIN_PROPERTY_LOGGING_ERROR='loggingError'


###########################################################################################################################################
## Action Functions

function dynadminclient::action::disable_logging_property() {	
  dynadminclient::action::set_logging_property ${1} ${2} false
}

function dynadminclient::action::disable_logging_properties() {	
	dynadminclient::action::disable_logging_property ${1} ${DYNADMIN_PROPERTY_LOGGING_TRACE} 
	dynadminclient::action::disable_logging_property ${1} ${DYNADMIN_PROPERTY_LOGGING_DEBUG} 
	dynadminclient::action::disable_logging_property ${1} ${DYNADMIN_PROPERTY_LOGGING_INFO} 
	dynadminclient::action::disable_logging_property ${1} ${DYNADMIN_PROPERTY_LOGGING_WARNING} 
	dynadminclient::action::disable_logging_property ${1} ${DYNADMIN_PROPERTY_LOGGING_ERROR} 
}

function dynadminclient::action::enable_logging_property() {
  dynadminclient::action::set_logging_property ${1} ${2} true
}

function dynadminclient::action::enable_logging_properties() {
	dynadminclient::action::enable_logging_property ${1} ${DYNADMIN_PROPERTY_LOGGING_TRACE} 
	dynadminclient::action::enable_logging_property ${1} ${DYNADMIN_PROPERTY_LOGGING_DEBUG} 
	dynadminclient::action::enable_logging_property ${1} ${DYNADMIN_PROPERTY_LOGGING_INFO} 
	dynadminclient::action::enable_logging_property ${1} ${DYNADMIN_PROPERTY_LOGGING_WARNING} 
	dynadminclient::action::enable_logging_property ${1} ${DYNADMIN_PROPERTY_LOGGING_ERROR} 
}

function dynadminclient::action::restore_logging_properties_to_default_values() {
	dynadminclient::action::disable_logging_property ${1} ${DYNADMIN_PROPERTY_LOGGING_TRACE} 
	dynadminclient::action::disable_logging_property ${1} ${DYNADMIN_PROPERTY_LOGGING_DEBUG} 
	dynadminclient::action::enable_logging_property ${1} ${DYNADMIN_PROPERTY_LOGGING_INFO} 
	dynadminclient::action::enable_logging_property ${1} ${DYNADMIN_PROPERTY_LOGGING_WARNING} 
	dynadminclient::action::enable_logging_property ${1} ${DYNADMIN_PROPERTY_LOGGING_ERROR} 
}

function dynadminclient::action::set_logging_property() {
	logger::info "dynadminclient::action::set_logging_property $1 $2 $3"	
	local component
	local property_name
  local property_value
  local data
  
	component=$1
	property_name=$2
	property_value=$3
	data="propertyName=${property_name}&newValue=${property_value}&change=Change+Value"

	dynadminclient::curl::dynadminnucleus::post $data $component 
}

function dynadminclient::action::change_property() {
  logger::info "dynadminclient::action::change_property $1 $2 $3"  
  local component
  local property_name
  local property_value
  local data
  
  component=$1
  property_name=$2
  property_value=$3
  data="propertyName=${property_name}&newValue=${property_value}&change=Change+Value"

  dynadminclient::curl::dynadminnucleus::post $data $component 
}

function dynadminclient::action::invalidate_cache() {
	logger::info "dynadminclient::action::invalidate_cache $1"
	local component
	local data
	
	component=$1
	data="invokeMethod=invalidateCaches&submit=Invoke+Method"

	dynadminclient::curl::dynadminnucleus::post $data $component 
}

function dynadminclient::action::invoke_method() {
	logger::info "dynadminclient::action::invoke_method $1 $2"
	local component
	local method_name
	local data
	
	component=$1
	method_name=$2
	data="invokeMethod=${method_name}&submit=Invoke+Method"

	dynadminclient::curl::dynadminnucleus::post $data $component 
}

function dynadminclient::action::get_sessions() {
  logger::info "dynadminclient::action::get_sessions"
  local component
  local data
  
  component="/atg/dynamo/servlet/sessiontracking/GenericSessionManager/"
  data="action=examine&keylist=&submit=View"

  dynadminclient::curl::dynadminnucleus::post "$data" "$component" 
  
  echo "${curl_response}" | xmllint --html --xpath "//*[local-name()='html']/*[local-name()='body']/*[local-name()='table'][1]" --format -
}
