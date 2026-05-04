SET DEFINE OFF;

-- Se actualiza a null el campo last_UPD_MSG_ID de los productos antes de la carga

-------------------------------------------------
--       PD00000516-5192
-------------------------------------------------
-- Revisión de datos
update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'10405899001',
'10620121001',
'10942398001',
'11139283001',
'11139300001',
'11246636001',
'11246695001',
'11246705001',
'11246706001',
'18501610001',
'2430310001',
'2704036001',
'2837629001',
'2837784001',
'2837787001',
'8155092001'
);

-- PD00000516-6411
update eci_category set LAST_UPD_MSG_ID=null where external_code in (
'11875933013',
'11875949013'
);

commit;
-------------------------------------------------

-------------------------------------------------
--       PD00000460-10015626
-------------------------------------------------
-- Restringir venta Baleares
update eci_category set LAST_UPD_MSG_ID=null where external_code in (
'11869386013'
);

commit;
-------------------------------------------------