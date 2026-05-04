
Examples: backend processes

dynadminclient.sh  --yes --user admin:admin123 --target localhost:8280 --backend-process 'status DISTRIBUTED_PROMOTION_FLATTENER'

dynadminclient.sh  --yes --user admin:admin123 --target localhost:8280 --backend-process 'launch DISTRIBUTED_PROMOTION_FLATTENER'

dynadminclient.sh  --yes --user admin:admin123 --target localhost:8280 --backend-process 'cancel DISTRIBUTED_PROMOTION_FLATTENER'

dynadminclient.sh  --yes --user admin:admin123 --target localhost:8280 --backend-process 'continue DISTRIBUTED_PROMOTION_FLATTENER'

dynadminclient.sh  --yes --user admin:admin123 --target localhost:8280 --backend-process 'skip DISTRIBUTED_PROMOTION_FLATTENER'

dynadminclient.sh --quiet --yes --user admin:admin123 --target localhost:8280 --backend-process 'status DISTRIBUTED_PROMOTION_FLATTENER' | jq .deploymentStatus
