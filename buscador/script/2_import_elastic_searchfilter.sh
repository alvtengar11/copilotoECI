#!/bin/bash

from=$1
env=$2
siteid=$3
export HTTP_PROXY=
export http_proxy=
export all_proxy=
export no_proxy=
export ALL_PROXY=

if [ "$env" != "pro" ]; then
  env=.${env}
else
  env=''
fi

for filename in ./${from}*.json; do

	path=`echo ${filename}|cut -d"-" -f2|cut -d"." -f1`
	curl -v -XPUT --header "Content-Type: application/json" --header "Accept: application/json" "http://qbu-searchfilter${env}.eci.geci/searchfilter/v1/import/${path}/${siteid}" --data-binary @${filename}

done
