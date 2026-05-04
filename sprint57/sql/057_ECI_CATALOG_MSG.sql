SET DEFINE OFF;

-- Se actualiza a null el campo last_UPD_MSG_ID de los productos antes de la carga

-------------------------------------------------
--       PD00000516-5192
-------------------------------------------------
-- Revisión de datos
update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'165534001',
'1706179001',
'2326774001',
'8955888001',
'110434101'
);

update eci_category set LAST_UPD_MSG_ID=null where external_code in (
'52691013',
'52696013',
'13478690024',
'13478808024',
'13478819024',
'13478920024',
'13478933024',
'13479113024',
'13714949024'
);

commit;
-------------------------------------------------

