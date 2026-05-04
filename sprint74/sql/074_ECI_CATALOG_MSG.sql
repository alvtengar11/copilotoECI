SET DEFINE OFF;

-- Se actualiza a null el campo last_UPD_MSG_ID de los productos antes de la carga

-------------------------------------------------
--       PD00000460-10010076
-------------------------------------------------
-- Packs de Catering
update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'21373601001',
'21373802001',
'21373803001'
);
    
commit;
-------------------------------------------------

-------------------------------------------------
--       PD00000460-10010145
-------------------------------------------------
-- Productos Portugal del departamento 0168
update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'2289924001',
'2289925001'
);
    
commit;
-------------------------------------------------
-------------------------------------------------
--       PD00000460-10010133
-------------------------------------------------
-- Productos con nuevos badgets para Alimentación
update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'316571101',
'98565101'
);
        
commit;
-------------------------------------------------

-------------------------------------------------
--       PD00000460-10009943
-------------------------------------------------
-- Productos con descripciones temporales
update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'72228101',
'85068101',
'85069101'
);
        
commit;
-------------------------------------------------

-------------------------------------------------
--       PD00000516-9995
-------------------------------------------------
-- Producto VPR en cloud008
update eci_category set LAST_UPD_MSG_ID=null where external_code in (
'3465219013'
);

commit;
-------------------------------------------------