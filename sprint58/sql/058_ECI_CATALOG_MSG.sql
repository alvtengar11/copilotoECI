SET DEFINE OFF;

-- Se actualiza a null el campo last_UPD_MSG_ID de los productos antes de la carga

-------------------------------------------------
--       PD00000516-5192
-------------------------------------------------
-- Revisión de datos
update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'11198908001',
'11198914001',
'11198916001',
'11198918001',
'3173571001'
);
    
commit;
-------------------------------------------------

