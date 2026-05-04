#!/bin/bash 

###########################################################################################################################################
## curl Functions

function dynadminclient::curl::dynadminnucleus::get() {
  logger::info "dynadminclient::curl::dynadminnucleus::get"

  local component
  local curl_rc
  local curl_request_uri
  local data_query_string
  
  	data_query_string=$1
  	component=$2  	
	curl_request_uri=http://${http_hostport}/dyn/admin/nucleus/${component}?${data_query_string}

    #echo $curl_request_uri

	curl_response=$(curl \
	-i \
	-u ${userpass} \
	-s \
	-X GET \
	${curl_request_uri})
	curl_rc=$?
	
	logger::debug "curl request:\nURI: ${curl_request_uri}\nData:${curl_request_data}"
	logger::debug "curl response: ${curl_rc}\n${curl_response}"
}

function dynadminclient::curl::dynadminnucleus::post() {
  logger::info "dynadminclient::curl::dynadminnucleus::post"
	local component
	local curl_rc
	local curl_request_data
	local curl_request_uri

	curl_request_data=$1
  	component=$2

	if [[ $component == *"__sessionId__"* ]] 
  	then
	    if [[ -z "${session_id// }" ]]
	    then
	      logger::warning "Nucleus component with session scope but session is not setted -> skipping"
	      return 0
	    fi
	  	component=${component/__sessionId__/$session_id}
	fi 
	logger::debug "component=$component"
  	logger::debug "data=$curl_request_data"
  	logger::debug "userpass=${userpass}"

 
  	curl_request_uri=http://${http_hostport}/dyn/admin/nucleus${component}
	curl_response=$(curl \
	-i \
	-u ${userpass} \
	-s \
	-X POST \
	-H "Accept:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" \
	-H "Accept-Encoding:gzip, deflate" \
	-H "Accept-Language:en,es;q=0.8" \
	-H "Cache-Control:no-cache" \
	-H "Connection: keep-alive" \
	-H "Content-Length:${#curl_request_data} " \
	-H "Content-Type:application/x-www-form-urlencoded" \
	-H "Host:${http_hostport}" \
	-H "Origin:http://${http_hostport}" \
	-H "Pragma:no-cache" \
	-H "Referer:http://${http_hostport}/dyn/admin/nucleus${component}" \
	-H "Upgrade-Insecure-Requests:1" \
	-H "User-Agent:Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.86 Safari/537.36" \
	--data ${curl_request_data} \
	${curl_request_uri})
	curl_rc=$?
	
	logger::debug "curl request:\nURI: ${curl_request_uri}\nData:${curl_request_data}"
	logger::debug "curl response: ${curl_rc}\n${curl_response}" 
	

	if [[ $curl_response == *"Network Error"* ]] 
        then	  
		logger::error "Network Error for ${http_hostport}"

	elif [[ $curl_response == *"Error 401--Unauthorized"* ]] 
        then	  
		logger::error "Error 401--Unauthorized"

	elif [[ $curl_response == *"Either your authorization was rejected or you need to authenticate yourself before you proceed"* ]] 
        then	  
		logger::error "Either your authorization was rejected or you need to authenticate yourself before you proceed"
	elif [[ $curl_response == *"not found"* ]] 
        then	  
		logger::error "Nucleus Service not found"
	elif [[ $curl_response == *"java.lang.NoSuchMethodException"* ]] 
        then	  
		logger::error "java.lang.NoSuchMethodException"
		
	elif [[ $curl_response == *"Can't find property named"* ]] 
        then	  
		logger::error "Can't find property named"
	elif [[ $curl_response == *"Request Error"* ]] 
        then	  
		logger::error "curl request error"
	elif [[ $curl_rc -ne 0 ]] 
        then	  
		logger::error "curl response with error code $curl_rc"

    elif [[ $curl_response == "" ]] 
    	then
    	logger::error "empty dynadmin response"
	fi
	
	return $curl_rc
}

function dynadminclient::curl::rest::get() {
  logger::info "dynadminclient::curl::rest::get"
  logger::debug "arg1: $1"
  logger::debug "arg2: $2"

  local curl_rc
  local curl_request_uri
  local query_string  
  local url

  url=$1
  if [[ ! -z "$2" ]]; then
  	query_string="atg-rest-rql=$2"	
  fi

  curl_request_uri=http://${http_hostport}/rest/${url}
	curl_response=$(curl \
	-u ${userpass} \
	-G --data-urlencode "${query_string}" \
	-s \
	-X GET \
	${curl_request_uri})
	curl_rc=$?
	
	logger::debug "curl request:\nURI: ${curl_request_uri}/?${query_string}\nData:${curl_request_data}"
	logger::debug "curl response: ${curl_rc}\n${curl_response}"
}
