En el script de import los argumentos son los siguientes:
1-Entorno desde el que importar (uat/nft/pro)
2-Indice a exportar

En el script de export los argumentos son los siguientes:
1-Indice exportado
2-Entorno al que importar (uat/nft/pro)
3-Indice al que importar

Exportación de configuraciones (todas las configuraciones)
./1_export_elastic.sh uat uat002_ecistore_es

Importación de Configuraciones (de forma individual)
Redirecciones
./2_import_elastic_manager.sh uat002_ecistore_es-redirects uat uat002_ecistore_es
Facets
./2_import_elastic_manager.sh uat002_ecistore_es-hierarchies uat uat002_ecistore_es
Sinónimos
./2_import_elastic_manager.sh uat002_ecistore_es-synonyms uat uat002_ecistore_es
SearchFilters
./2_import_elastic_searchfilter.sh uat002_ecistore_es-searchfilters uat uat002_ecistore_es
Ordenaciones Merchandiser
./2_import_elastic_merchandiser.sh uat002_ecistore_es-custom-sorts uat uat002_ecistore_es
