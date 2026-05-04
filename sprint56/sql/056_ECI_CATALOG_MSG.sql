SET DEFINE OFF;

-- Se actualiza a null el campo last_UPD_MSG_ID de los productos antes de la carga

-------------------------------------------------
--       PD00000516-5192
-------------------------------------------------
-- Revisión de datos
update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'1711880001',
'1713887001',
'31653113001',
'31727420001'
);
    
commit;
-------------------------------------------------

