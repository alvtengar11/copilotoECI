SET DEFINE OFF;

-- Se actualiza a null el campo last_UPD_MSG_ID de los productos antes de la carga


-------------------------------------------------
--       PD00000460-10010856
-------------------------------------------------
-- Productos NO_SALE

update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'2602609001',
'2602612001',
'2602613001',
'2602614001'
);
    
commit;
-------------------------------------------------
-------------------------------------------------
--       PD00000516-5265
-------------------------------------------------
-- Producto importado desde PRO (con stockForEans pero sin providers)

update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'25052081001'
);
    
commit;
-------------------------------------------------