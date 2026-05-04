# dynadminclient

## Descripción

dynadminclient es una utilidad que permite invocar ciertas acciones sobre diversas instancias dynadmin de ATG.

Las acciones actualmente invocables sobre componentes nucleus son:
- opción -b o --backend-process, invoca al componente nucleus ProcessFlowStatusManager para ejecutar una acción (launch | cancel | continue | skip | status) sobre un flujo
- opción -c o --change-property, modificación de una propiedad
- opción -g o --get-sessions, devuelve las sesiones de /atg/dynamo/servlet/sessiontracking/GenericSessionManager/
- opción -i o --invalidate-cache, invalidación de una cache
- opción -l o --logging, modificación de las propiedades de logging (loggingTrace, loggingDebug, loggingInfo, loggingWarning, loggingError)
- opción -m o --method, invocación de un método
- opción -r o --rest-api, invoca una llamada REST sobre un componente nucleus.

Para referenciar un componente nucleus basta con indicar la ruta al fichero de configuración del componente (acabado en /). Por ejemplo: /atg/commerce/order/OrderRepository/


## Fichero de configuración (json)
Por defecto la utilidad busca un fichero de configuración ../config/dynadminclient.json, pero podemos indicar otro usando la opción -f o --config-file.

Importante: para el uso de ficheros de configuración se utiliza la librería jq (Command-line JSON processor, ver https://stedolan.github.io/jq/), que está empaquetada junto con la utilidad.

Actualmente se permite indicar la siguiente información en el fichero de configuración:

- log.filename, ruta al fichero de log. Si no se indica por defecto se creará un fichero de log en ../logs/dynadminclient-{yyyy-MM-dd}.log

- auth.user_pass, usuario y contraseña con la sintaxis {user}:{pass}

- targets, servidores dynadmin a los que se invocará. Se indicará mediante un alias que representará un array de strings host:port.


Ejemplo: configuración para local
```
{
    "log": {
        "filename": ""
    }
    , "auth": {
         "user_pass": "admin:admin123"
    }
    , "targets": {
         "localhost_services": [ "localhost:8080" ] 
       , "localhost_ca": [ "localhost:8180" ] 
       , "localhost_loader": [ "localhost:8280" ] 
       , "localhost_worker": [ "localhost:8380" ] 
    } 
}
```

### Limitaciones actuales en el fichero de configuración

Importante: las siguientes limitaciones se pueden solventar invocando varias veces a dynadminclient y/o con ciertos argumentos

-No se puede especificar un array de alias, por ejemplo, actualmente no se soporta:

...

"localhost": [ "localhost_services","localhost_ca","localhost_loader" , "localhost_worker" ]

...

Workaround:

dynadminclient.sh --target localhost_services,localhost_ca,localhost_loader,localhost_worker ...



- El user_pass es el mismo para todas las instancias de dynadmin, actualmente no se soporta en el fichero de configuración distintos user_pass para diferentes instancias dynadmin

Workaround:

dynadminclient.sh --user admin:admin --target server1

dynadminclient.sh --user admin:admin123 --target server2

...

## Uso

Ejecutar dynadminclient.sh --help para obtener información detallada sobre la sintaxis de las diversas opciones y acciones disponibles.


### Ejemplos

El directorio examples contiene diversos ficheros con ejemplos de uso.
