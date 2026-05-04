#!/bin/bash

env=$1
siteid=$2
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

for path in /manager/v1/export/hierarchies /manager/v1/export/redirects /manager/v1/export/synonyms
do
	curl -v "http://qbu-manager${env}.eci.geci${path}/${siteid}" > ${siteid}-`echo ${path}|cut -d"/" -f5`.json
done

for path in /searchfilter/v1/export/searchfilters
do
	curl -v "http://qbu-searchfilter${env}.eci.geci${path}/${siteid}" > ${siteid}-`echo ${path}|cut -d"/" -f5`.json
done

for path in /merchandiser/v1/export/custom-sorts?site=
do
	curl -v "http://qbu-merchandiser${env}.eci.geci${path}${siteid}" > ${siteid}-`echo ${path}|cut -d"/" -f5|cut -d"?" -f1`.json
done
