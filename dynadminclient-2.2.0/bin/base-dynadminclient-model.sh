#!/bin/bash 

###########################################################################################################################################
## Constants and Variables

readonly DYNADMIN_DEFAULT_HOST='localhost'
readonly DYNADMIN_DEFAULT_PORT=7001
readonly DYNADMIN_DEFAULT_USERPASS='admin:admin'

http_host=${DYNADMIN_DEFAULT_HOST}
http_port=${DYNADMIN_DEFAULT_PORT}
http_hostport=${http_host}:${http_port}
session_id=''
userpass=${DYNADMIN_DEFAULT_USERPASS}


###########################################################################################################################################
## Model Functions

function dynadminclient::model::set_http_hostport() {
  http_hostport=${1}
}

function dynadminclient::model::set_http_host() {
  http_host=${1}  
  dynadminclient::model::update_http_hostport
}

function dynadminclient::model::set_http_port() {
  http_port=${1}
  dynadminclient::model::update_http_hostport
}

function dynadminclient::model::set_session_id() {
  session_id=${1}
}

function dynadminclient::model::set_userpass() {
  userpass=$(echo ${1} | tr -d '"')
}

function dynadminclient::model::update_http_hostport() {
  http_hostport=${http_host}:${http_port}
}
