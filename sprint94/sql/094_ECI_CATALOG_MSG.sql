SET DEFINE OFF;


-------------------------------------------------
--       PD00000460-10018853
-------------------------------------------------
-- Dar CnC a la referencia
update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'8504530001'
);
commit;

-------------------------------------------------
-------------------------------------------------
--       PD00000460-10018844
-------------------------------------------------
-- Dar de alta bañador GreenCoast
update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'40479939001'
);

update eci_category set LAST_UPD_MSG_ID=null where external_code in (
'41734612016',
'41734614016'
);


commit;

-------------------------------------------------
