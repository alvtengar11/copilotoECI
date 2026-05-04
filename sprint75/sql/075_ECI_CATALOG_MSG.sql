SET DEFINE OFF;
-------------------------------------------------
--       PD00000516-4792
-------------------------------------------------
-- Producto CSC sin stock

-- Se actualiza a null el campo last_UPD_MSG_ID de los productos antes de la carga
update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'9130228001'
);

commit;
-------------------------------------------------
--       PD00000460-10010472
-------------------------------------------------
-- Productos con sólo almacen central
update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'2585322001',
'8149250001'
);
    
commit;
-------------------------------------------------
-------------------------------------------------
--       PD00000460-10010418
-------------------------------------------------
-- Productos de departamentos 0021 para CnC
update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'103712001',
'9456790001',
'13697614001',
'13697647001'
);
    
update eci_category set LAST_UPD_MSG_ID=null where external_code in (
'3283176022',
'3283177022',
'3283443022',
'3283450022',
'3283451022',
'6331039022',
'6331054022'
);

commit;
-------------------------------------------------
-------------------------------------------------
--       PD00000460-10010588
-------------------------------------------------
-- Productos Portugal Nave R
update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'8911340001',
'11150657001',
'9150747001',
'9150952001',
'8170460001',
'7892978001',
'8911341001'
);
    
commit;
-------------------------------------------------

-------------------------------------------------
--       PD00000460-10010627
-------------------------------------------------
-- Productos EciExpress Canarias
update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'2416904001',
'2469055001'
);
    
commit;
-------------------------------------------------
