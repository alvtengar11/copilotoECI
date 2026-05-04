
Examples

dynadminclient.sh --config-file dynadminclient.json --invalidate-cache /atg/commerce/order/OrderRepository/,/atg/commerce/catalog/ProductCatalog/,/atg/commerce/pricing/Promotions/

dynadminclient.sh --host localhost --invalidate-cache /atg/commerce/order/OrderRepository/

dynadminclient.sh --port 7001 --invalidate-cache /atg/commerce/order/OrderRepository/

dynadminclient.sh --target localhost:7001,localhost:7011 --invalidate-cache /atg/commerce/order/OrderRepository/

dynadminclient.sh --target localhost_cartcheckout --invalidate-cache /atg/commerce/order/OrderRepository/

dynadminclient.sh --user admin:admin --invalidate-cache /atg/commerce/order/OrderRepository/

dynadminclient.sh --change-property 'loggingInfo false /atg/commerce/order/OrderRepository/' 

dynadminclient.sh --invalidate-cache 'file ../shared/nucleus-components/nc-cacheables.txt'

dynadminclient.sh --get-sessions 

dynadminclient.sh --logging 'restore /atg/commerce/order/OrderRepository/'

dynadminclient.sh --method 'invalidateCaches /atg/commerce/order/OrderRepository/'

dynadminclient.sh --change-property 'loggingInfo true /atg/commerce/order/OrderRepository/' --invalidate-cache /atg/commerce/order/OrderRepository/

dynadminclient.sh --user admin:admin123 --target localhost:8280 --rest-api '/repository/eci/jms/repository/CatalogDeploymentRepository/catalogDeployment/79900003'

dynadminclient.sh --user admin:admin123 --target localhost:8280 --backend-process 'status DISTRIBUTED_PROMOTION_FLATTENER'

dynadminclient.sh --quiet --yes --user admin:admin123 --target localhost:8280 --backend-process 'status DISTRIBUTED_PROMOTION_FLATTENER'
