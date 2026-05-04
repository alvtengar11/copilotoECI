
Examples: rest api

dynadminclient.sh  --yes --user admin:admin123 --target localhost:8280 --rest-api '/repository/eci/jms/repository/CatalogDeploymentRepository/catalogDeployment/79900003'

dynadminclient.sh  --yes --user admin:admin123 --target localhost:8280 --rest-api '/repository/eci/jms/repository/CatalogDeploymentRepository/catalogDeployment/?atg-rest-rql=deploymentType%3D%22DISTRIBUTED_PROMOTION_FLATTENER2%22%20AND%20%28deploymentStatus%3D%22IN_PROGRESS%22%20OR%20deploymentStatus%3D%22ERROR%22%29'

dynadminclient.sh  --yes --user admin:admin123 --target localhost:8280 --rest-api '/repository/eci/jms/repository/CatalogDeploymentRepository/catalogDeployment/ deploymentType="INDEX_BASELINE_SEARCH_SUPER"'

dynadminclient.sh  --yes --user admin:admin123 --target localhost:8280 --rest-api '/repository/eci/jms/repository/CatalogDeploymentRepository/catalogDeployment/ deploymentStatus="IN_PROGRESS" OR deploymentStatus="ERROR"'

dynadminclient.sh --quiet --yes --user admin:admin123 --target localhost:8280 --rest-api '/repository/eci/jms/repository/CatalogDeploymentRepository/catalogDeployment/79900003' | jq .deploymentStatus
