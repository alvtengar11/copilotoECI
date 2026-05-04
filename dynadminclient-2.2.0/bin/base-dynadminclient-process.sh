#!/bin/bash

pfsm_component="/eci/process/ProcessFlowStatusManager/"	
    
# status = IN_PROGRESS | ERROR | CANCELLED | COMPLETED | CANCEL_PENDING | PAUSE_PENDING

function dynadminclient::process::cancel() {
    logger::info "dynadminclient::process::cancel"
    local data
	local flowType
	flowType=$1

	dynadminclient::process::flowId ${flowType}

	if [ "${flowStatus}" = "ERROR" ]; then
		#Example data: action_CANCEL=CANCEL&flowId=79900001&time=1553174204373	
		data="action_CANCEL=CANCEL&flowId=${flowId}"
		dynadminclient::curl::dynadminnucleus::get $data $pfsm_component 

	elif [ "${flowStatus}" = "IN_PROGRESS" ]; then
		#Example data: cancelFlow=CANCEL&flowId=79900004&time=1553249844767
		data="cancelFlow=CANCEL&flowId=${flowId}"
		dynadminclient::curl::dynadminnucleus::get $data $pfsm_component

	else 
		logger::warning "cancel action is not permitted when status is ${flowStatus}"
		exit 1
	fi
}	

function dynadminclient::process::continue() {
    logger::info "dynadminclient::process::continue"    	
    local data
	local flowType
	flowType=$1

	dynadminclient::process::flowId ${flowType}
	if [ "${flowStatus}" = "ERROR" ]; then
		#Example data: action_RETRY=CONTINUE+STEP&flowId=79900004&time=1553176846385
		data="action_RETRY=CONTINUE+STEP&flowId=${flowId}"
		dynadminclient::curl::dynadminnucleus::get $data $pfsm_component 

	else
		logger::warning "continue action is not permitted when status is ${flowStatus}"
		exit 1
	fi
}

function dynadminclient::process::launch() {
    logger::info "dynadminclient::process::launch"
    local data
	local flowType
	flowType=$1
	
	#Example data: startFlow=DISTRIBUTED_PROMOTION_FLATTENER&startFlowButton=Start+Flow&flowId=65100002&time=1553171467194
	data="startFlow=${flowType}&startFlowButton=Start+Flow"
	dynadminclient::curl::dynadminnucleus::get $data $pfsm_component 

	if [[ $curl_response == *"Attempt to retrieve flow lock"* ]]; then	  
		logger::error "Attempt to retrieve flow lock ${flowType} was unsuccessful. Failed condition: DPFSRunning"
	fi
}	

function dynadminclient::process::skip() {
    logger::info "dynadminclient::process::skip"	
    local data
	local flowType
	flowType=$1

	dynadminclient::process::flowId ${flowType}
	if [ "${flowStatus}" = "ERROR" ]; then
		#Example data: action_GO_TO_NEXT=SKIP+STEP&flowId=79900004&time=1553177089156
		data="action_GO_TO_NEXT=SKIP+STEP&flowId=${flowId}"
		dynadminclient::curl::dynadminnucleus::get $data $pfsm_component 

	else
		logger::warning "skip action is not permitted when status is ${flowStatus}"
		exit 1
	fi
}

function dynadminclient::process::status() {
    logger::info "dynadminclient::process::status"
	local flowType
	local url

	flowType=$1
	dynadminclient::process::flowId ${flowType}	

	url="repository/eci/jms/repository/CatalogDeploymentRepository/catalogDeployment/${flowId}"
	dynadminclient::curl::rest::get ${url}		
	jq::echo "$curl_response"
}	

function dynadminclient::process::flowId() {
    logger::info "dynadminclient::process::flowId"
    local atg_rest_rql
	local flowType
	local url

	flowType="$1"
	url="repository/eci/jms/repository/CatalogDeploymentRepository/catalogDeployment/"
	atg_rest_rql="deploymentType=\"${flowType}\" AND deploymentStatus!=\"COMPLETED\" AND deploymentStatus!=\"CANCELLED\""
	logger::debug "URL: ${url}"
	logger::debug "ATG REST RQL: ${atg_rest_rql}"

	dynadminclient::curl::rest::get $url "$atg_rest_rql"
	flowIds=$(echo ${curl_response}| $jq_tool .catalogDeployment[0])
	
	if [ "$flowIds" = "null" ]; then
		flowId=''
		logger::warning "Warning: can't get flowId of ${flowType} or no flow running"		
		exit 1

	else
		curl_response=$(echo $flowIds | xargs -n1 curl -s -u ${userpass} -X GET)	
		flowId=$(echo $curl_response | jq::read_property ".deploymentId")
		flowStatus=$(echo $curl_response | jq::read_property ".deploymentStatus")
	fi	

    logger::info "flowId=${flowId}"
    logger::info "flowStatus=${flowStatus}"
}	
