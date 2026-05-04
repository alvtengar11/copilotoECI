SET DEFINE OFF;

-- Se actualiza a null el campo last_UPD_MSG_ID de los productos antes de la carga

-------------------------------------------------
--       PD00000516-5192
-------------------------------------------------
-- Revisión de datos
update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'10367203001',
'12298113001',
'12717853001',
'13928629001',
'907210001',
'920278001',
'634307101',
'891124101'
);
    
commit;
-------------------------------------------------

