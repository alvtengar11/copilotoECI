SET DEFINE OFF;


-------------------------------------------------
--       PD00000460-10015147
-------------------------------------------------
-- Petición de referencias con variantes e imágenes

update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'1333476001',
'1333477001',
'1333478001',
'2842593001',
'8332483001',
'8332485001',
'8332487001',
'8332489001',
'9337740001',
'9337741001',
'9337742001',
'4511325001',
'4511322001',
'4511324001'
);
commit;

-- Se actualiza a null el campo last_UPD_MSG_ID de los productos antes de la carga


-------------------------------------------------
--       PD00000460-10015358
-------------------------------------------------
-- Productos CnC Portugal

update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'8402802001',
'8402803001'
);

commit;
-------------------------------------------------

-------------------------------------------------
--       PD00000460-10015386
-------------------------------------------------
-- Añadir uniformes en colegios 018225 y 378218

update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'3463896001'
);

commit;

-------------------------------------------------