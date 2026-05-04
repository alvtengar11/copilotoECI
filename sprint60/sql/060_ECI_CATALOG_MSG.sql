SET DEFINE OFF;

-- Se actualiza a null el campo last_UPD_MSG_ID de los productos antes de la carga

-------------------------------------------------
--       PD00000516-5192
-------------------------------------------------
-- Revisión de datos
update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'10252904001',
'10449003001',
'12618695001',
'176731001',
'18913044001',
'3094062001',
'3115660001',
'4025964001',
'8060530001',
'372327101',
'615977101',
'678951101',
'99658101'
);
    
update eci_category set LAST_UPD_MSG_ID=null where external_code in (
'2311967013',
'2981243013',
'347291013'
);

commit;
-------------------------------------------------

