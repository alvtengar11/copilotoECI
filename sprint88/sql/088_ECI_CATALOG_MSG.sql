SET DEFINE OFF;


-------------------------------------------------
--       PD00000460-10016448
-------------------------------------------------
-- Productos de libros con variantes ECI y MKP

update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'16260672001',
'16260673001',
'10647829001'
);
commit;

-------------------------------------------------
