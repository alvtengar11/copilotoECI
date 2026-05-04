#!/bin/bash

echo "Carga automática de productos en cloud007"


#Variables de entorno
BASE_DIR="/home/spindrift"
DYNADMINCLIENT_HOME_DIR="${BASE_DIR}/workspace/dynadminclient-2.2.0"


DYNADMINCLIENT_HOME="${DYNADMINCLIENT_HOME_DIR}/bin"
DYNADMINCLIENT_CONFIG="${DYNADMINCLIENT_HOME_DIR}/config/dynadminclient-omnistore-uat007.json"
JSON_DIR="${BASE_DIR}/git/aqt0-omnistore-data-manager"
FAKECATALOG_DIR="/sde/ATG/data/fakecatalog"
SCRIPT_PATH="${BASE_DIR}/git/aqt0-omnistore-data-manager"
REGRESION="regresion"
PRIMERITI="primeriti"

REMOTE_HOST="preprod1@node1.uat007.azure.cloud.elcorteingles.es"
REMOTE_BBDD="(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=db.uat007.azure.cloud.elcorteingles.es)(Port=1524))(CONNECT_DATA=(SERVICE_NAME=worker)))"
REMOTE_PWD="eciPassw0rd!"
REMOTE_FAKECATALOG_DIR="/ATG/data/fakecatalog"

cargaFicheros(){

	local SPRINTS
	SPRINTS=("$@")	
	sLen=${#SPRINTS[@]}
	#Eliminamos directorio de carga de JSON
	echo "Carga remota de ficheros"

	rm -r ${FAKECATALOG_DIR}
	mkdir ${FAKECATALOG_DIR}

	for (( i=0; i<${sLen}; i++ ));
	do
		#Carga JSON
		cp -R ${JSON_DIR}/${SPRINTS[i]}/json/* ${FAKECATALOG_DIR}
	done

	sshpass -p ${REMOTE_PWD} ssh -o StrictHostKeyChecking=no ${REMOTE_HOST} "rm -r ${REMOTE_FAKECATALOG_DIR}"
	sshpass -p ${REMOTE_PWD} ssh -o StrictHostKeyChecking=no ${REMOTE_HOST} "mkdir ${REMOTE_FAKECATALOG_DIR}"
	sshpass -p ${REMOTE_PWD} scp -r ${FAKECATALOG_DIR}/* ${REMOTE_HOST}:${REMOTE_FAKECATALOG_DIR}

	${DYNADMINCLIENT_HOME}/dynadminclient.sh -f ${DYNADMINCLIENT_CONFIG} -y -t uat002_h_index1 -c "baseDirectory ${REMOTE_FAKECATALOG_DIR}/ /eci/jms/destination/FakeCatalogMessageSource/"
	${DYNADMINCLIENT_HOME}/dynadminclient.sh -f ${DYNADMINCLIENT_CONFIG} -y -t uat002_h_index1 -m 'sendAllJsonMessages /eci/jms/destination/FakeCatalogMessageSource/' 

	sleep 10

}

cargaBBDD(){
	local SPRINTS
	SPRINTS=("$@")	
	sLen=${#SPRINTS[@]}
	echo "Carga de BBDD" 

	for (( i=0; i<${sLen}; i++ ));
	do
		cd ${SCRIPT_PATH}/${SPRINTS[i]}/sql/
	
		#Carga SQL
		for f in `ls |grep _ECI_SITE_TO_STORE.sql |sort -V`
		do
		  echo ${f}
		  echo exit | sqlplus "ECI_SITE_TO_STORE/ECI_SITE_TO_STORE@${REMOTE_BBDD}" @$f
		done
		
		for f in `ls |grep _ECI_INVENTORY.sql |sort -V`
		do
		  echo ${f}
		  echo exit | sqlplus "ECI_INVENTORY/ECI_INVENTORY@${REMOTE_BBDD}" @$f
		done
		
		for f in `ls |grep _ECI_PRICES.sql |sort -V`
		do
		  echo ${f}
		  echo exit | sqlplus "ECI_PRICES/ECI_PRICES@${REMOTE_BBDD}" @$f
		done
		
		for f in `ls |grep _ECI_DISTRIBUTION_WAYS.sql |sort -V`
		do
		  echo ${f}
		  echo exit | sqlplus "ECI_DISTRIBUTION_WAYS/ECI_DISTRIBUTION_WAYS@${REMOTE_BBDD}" @$f
		done
		
		for f in `ls |grep _COHERENCE_COMMON.sql |sort -V`
		do
		  echo ${f}
		  echo exit | sqlplus "COHERENCE_COMMON/COHERENCE_COMMON@${REMOTE_BBDD}" @$f
		done
		
		for f in `ls |grep _ECI_CATALOG.sql |sort -V`
		do
		  echo ${f}
		  echo exit | sqlplus "cataloga/cataloga@${REMOTE_BBDD}" @$f
		  echo exit | sqlplus "catalogb/catalogb@${REMOTE_BBDD}" @$f
		done
	
	    #Borrado del campo LAST_UPD_MSG_ID
		for f in `ls |grep _ECI_CATALOG_MSG.sql |sort -V`
		do
		  echo ${f}
		  echo exit | sqlplus "cataloga/cataloga@${REMOTE_BBDD}" @$f
		  echo exit | sqlplus "catalogb/catalogb@${REMOTE_BBDD}" @$f
		done
	
	done
	
	#Ejecutar procesos finales en BBDD
	echo ${SCRIPT_PATH}/${REGRESION}/sql/000_ECI_INVENTORY_PROCESS.sql
	echo exit | sqlplus "ECI_INVENTORY/ECI_INVENTORY@${REMOTE_BBDD}" @${SCRIPT_PATH}/${REGRESION}/sql/000_ECI_INVENTORY_PROCESS.sql
	echo ${SCRIPT_PATH}/${REGRESION}/sql/000_ECI_PRICES_PROCESS.sql
	echo exit | sqlplus "ECI_PRICES/ECI_PRICES@${REMOTE_BBDD}" @${SCRIPT_PATH}/${REGRESION}/sql/000_ECI_PRICES_PROCESS.sql
	
	cd ${SCRIPT_PATH}
}

ejecutaCatalogo(){

	CATALOGO=$1
	echo "Ejecuta catálogo" ${CATALOGO}
	#Ejecutar catálogo
	${DYNADMINCLIENT_HOME}/dynadminclient.sh -f ${DYNADMINCLIENT_CONFIG} -y -t uat007_h_loader -b "launch ${CATALOGO}"
	while ${DYNADMINCLIENT_HOME}/dynadminclient.sh -f ${DYNADMINCLIENT_CONFIG} -y --quiet -t uat007_h_loader -b "status ${CATALOGO}"| grep '"deploymentStatus": "IN_PROGRESS"'; 
	do
		sleep 20
	done
}

cargaBBDDPostCatalogo(){
	echo "Carga BBDD post Catalogo"

	echo ${SCRIPT_PATH}/${REGRESION}/sql/000_COHERENCE_COMMON_POST.sql
	echo exit | sqlplus "COHERENCE_COMMON/COHERENCE_COMMON@${REMOTE_BBDD}" @${SCRIPT_PATH}/${REGRESION}/sql/000_COHERENCE_COMMON_POST.sql
	echo ${SCRIPT_PATH}/${REGRESION}/sql/000_ECI_SITE_TO_STORE_POST.sql
	echo exit | sqlplus "ECI_SITE_TO_STORE/ECI_SITE_TO_STORE@${REMOTE_BBDD}" @${SCRIPT_PATH}/${REGRESION}/sql/000_ECI_SITE_TO_STORE_POST.sql
	#Ejecutar script de actualización de surtido horizontal
	echo ${SCRIPT_PATH}/${REGRESION}/sql/000_ECI_CATALOG_POST.sql
	echo exit | sqlplus "cataloga/cataloga@${REMOTE_BBDD}" @${SCRIPT_PATH}/${REGRESION}/sql/000_ECI_CATALOG_POST.sql
	echo exit | sqlplus "catalogb/catalogb@${REMOTE_BBDD}" @${SCRIPT_PATH}/${REGRESION}/sql/000_ECI_CATALOG_POST.sql
}

ejecutaFlatteners(){
	echo "Ejecuta flatteners" 
	#Ejecutar Flatterer CG
	${DYNADMINCLIENT_HOME}/dynadminclient.sh -f ${DYNADMINCLIENT_CONFIG} -y -t uat007_h_loader -b "launch DISTRIBUTED_CONTENT_GROUPS_FLATTENER"
	while ${DYNADMINCLIENT_HOME}/dynadminclient.sh -f ${DYNADMINCLIENT_CONFIG} -y --quiet -t uat007_h_loader -b "status DISTRIBUTED_CONTENT_GROUPS_FLATTENER"| grep '"deploymentStatus": "IN_PROGRESS"'; 
	do
		sleep 20
	done

	#Ejecutar Flatterer Promo
	${DYNADMINCLIENT_HOME}/dynadminclient.sh -f ${DYNADMINCLIENT_CONFIG} -y -t uat007_h_loader -b "launch DISTRIBUTED_PROMOTION_FLATTENER"
	while ${DYNADMINCLIENT_HOME}/dynadminclient.sh -f ${DYNADMINCLIENT_CONFIG} -y --quiet -t uat007_h_loader -b "status DISTRIBUTED_PROMOTION_FLATTENER"| grep '"deploymentStatus": "IN_PROGRESS"'; 
	do
		sleep 20
	done
}

ejecutaIndexacionPrincipal(){
	
	INDEX=$1
	echo "Ejecuta indexación" ${INDEX}
	#Ejecutar indexación
	${DYNADMINCLIENT_HOME}/dynadminclient.sh -y -f ${DYNADMINCLIENT_CONFIG} -t uat007_h_index1 -b "launch ${INDEX}"
	while ${DYNADMINCLIENT_HOME}/dynadminclient.sh -f ${DYNADMINCLIENT_CONFIG} -y --quiet -t uat007_h_index1 -b "status ${INDEX}"| grep '"deploymentStatus": "IN_PROGRESS"'; 
	do
		sleep 20
	done

}

ejecutaOtrasIndexaciones(){
	echo "Ejecuta resto de indexación"
	${DYNADMINCLIENT_HOME}/dynadminclient.sh -y -f ${DYNADMINCLIENT_CONFIG} -t uat007_h_index1 -b "launch INDEX_BASELINE_SEARCH_HIPERCOR"
	${DYNADMINCLIENT_HOME}/dynadminclient.sh -y -f ${DYNADMINCLIENT_CONFIG} -t uat007_h_index1 -b "launch INDEX_BASELINE_SEARCH_LTC"
	while ${DYNADMINCLIENT_HOME}/dynadminclient.sh -f ${DYNADMINCLIENT_CONFIG} -y --quiet -t uat007_h_index1 -b "status INDEX_BASELINE_SEARCH_LTC"| grep '"deploymentStatus": "IN_PROGRESS"'; 
	do
		sleep 20
	done
	${DYNADMINCLIENT_HOME}/dynadminclient.sh -y -f ${DYNADMINCLIENT_CONFIG} -t uat007_h_index1 -b "launch INDEX_BASELINE_SEARCH_SUPER"
	${DYNADMINCLIENT_HOME}/dynadminclient.sh -y -f ${DYNADMINCLIENT_CONFIG} -t uat007_h_index1 -b "launch INDEX_BASELINE_SEARCH_PORTUGAL"
	while ${DYNADMINCLIENT_HOME}/dynadminclient.sh -f ${DYNADMINCLIENT_CONFIG} -y --quiet -t uat007_h_index1 -b "status INDEX_BASELINE_SEARCH_PORTUGAL"| grep '"deploymentStatus": "IN_PROGRESS"'; 
	do
		sleep 20
	done
	${DYNADMINCLIENT_HOME}/dynadminclient.sh -y -f ${DYNADMINCLIENT_CONFIG} -t uat007_h_index1 -b "launch INDEX_BASELINE_SEARCH_CATERING"
	${DYNADMINCLIENT_HOME}/dynadminclient.sh -y -f ${DYNADMINCLIENT_CONFIG} -t uat007_h_index1 -b "launch INDEX_BASELINE_SEARCH_ECI_UNIFORMS"
	while ${DYNADMINCLIENT_HOME}/dynadminclient.sh -f ${DYNADMINCLIENT_CONFIG} -y --quiet -t uat007_h_index1 -b "status INDEX_BASELINE_SEARCH_ECI_UNIFORMS"| grep '"deploymentStatus": "IN_PROGRESS"'; 
	do
		sleep 20
	done
}




#Creamos el listado de sprints a cargar desde los argumentos
POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -a|--all)
	#Carga completa de datos    
	#Primero se hace la carga de datos Primeriti
	SPRINTS=(${PRIMERITI})
	cargaBBDD ${SPRINTS[*]}
	cargaFicheros ${SPRINTS[*]}
	ejecutaCatalogo "CATALOG_LOAD_PRIMERITI"
	ejecutaIndexacionPrincipal "INDEX_BASELINE_SEARCH_PRIMERITI"

	#Después se hace la carga de datos normal
	SPRINTS=(${REGRESION})
	for i in `ls |grep sprint |sort -V`; 
	do 
		SPRINTS+=($i) 
	done;
	cargaBBDD ${SPRINTS[*]}
	cargaFicheros ${SPRINTS[*]}
	ejecutaCatalogo "CATALOG_LOAD_FULL_DOUBLE"
	cargaBBDDPostCatalogo
	ejecutaFlatteners
	ejecutaIndexacionPrincipal "INDEX_BASELINE_SEARCH_ECI"
	ejecutaOtrasIndexaciones

 	shift 
    ;;

    -r|--regresion)
	#Carga solo regresión    
	SPRINTS=(${REGRESION})
	cargaBBDD ${SPRINTS[*]}
	cargaFicheros ${SPRINTS[*]}
	ejecutaCatalogo "CATALOG_LOAD_FULL_DOUBLE"
	cargaBBDDPostCatalogo
	ejecutaIndexacionPrincipal "INDEX_BASELINE_SEARCH_ECI"

	shift 
    ;;

    -p|--primeriti)
	#Carga solo regresión    
	SPRINTS=(${PRIMERITI})
	cargaBBDD ${SPRINTS[*]}
	cargaFicheros ${SPRINTS[*]}
	ejecutaCatalogo "CATALOG_LOAD_PRIMERITI"
	ejecutaIndexacionPrincipal "INDEX_BASELINE_SEARCH_PRIMERITI"

	shift 
    ;;

    -l|--last)
 	#Carga hasta un sprint    
    LIMIT="$2"
	SPRINTS=(${REGRESION})
	for i in `ls |grep sprint |sort -V`; 
	do 
		if [ "$i" == "${LIMIT}" ]; then
			break
		else 		
			SPRINTS+=($i)
		fi
	done;
	cargaBBDD ${SPRINTS[*]}
	cargaFicheros ${SPRINTS[*]}
	ejecutaCatalogo "CATALOG_LOAD_FULL_DOUBLE"
	cargaBBDDPostCatalogo
	ejecutaIndexacionPrincipal "INDEX_BASELINE_SEARCH_ECI"

    shift 
    shift 
    ;;

    -s|--sprint)
	SPRINTS="$2"
	#Carga solo regresión indicada   
	cargaBBDD ${SPRINTS[*]}
	cargaFicheros ${SPRINTS[*]}
	ejecutaCatalogo "CATALOG_LOAD_FULL_DOUBLE"
	cargaBBDDPostCatalogo
	ejecutaIndexacionPrincipal "INDEX_BASELINE_SEARCH_ECI"

	shift 
    shift 
    ;;

    -b|--bbdd)
	SPRINTS=(${REGRESION})
	SPRINTS+=(${PRIMERITI})

	for i in `ls |grep sprint |sort -V`; 
	do 
		SPRINTS+=($i)
	done;
	#Carga solo scripts de BBDD   
	cargaBBDD ${SPRINTS[*]}

	shift 
    ;;

    *)
	shift
	;;

esac
done
set -- "${POSITIONAL[@]}" 

sLen=${#SPRINTS[@]}

if [ "$sLen" == "0" ]; then
	echo "Las opciones disponibles son:"
	echo
	echo "    -a|--all         Carga completa de datos y procesos (incluido primeriti)."
	echo "    -b|--bbdd        Carga completa de scripts de BBDD (sin productos ni procesos)."
	echo "    -r|--regresion   Carga sólo datos de regresión."
	echo "    -p|--primeriti   Carga sólo datos de primeriti."
	echo "    -l|--last        Carga hasta un sprint indicado (no incluido)." 
	echo "                     El parámetro ha de ser el nombre completo del directorio, ej: sprint56. "
	echo "    -s|--sprint      Carga el sprint indicado."
	echo "                     El parámetro ha de ser el nombre completo del directorio, ej: sprint56. "
	exit;
fi



