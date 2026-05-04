SET DEFINE OFF;



-------------------------------------------------
--       PD00000460-10018853
-------------------------------------------------
-- Dar CnC a la referencia
delete from eci_sku_dist_way_provider_rel where eci_reference in (
'05106302358'
);

Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','56','05106302358','00','00000000','R');
Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','7','05106302358','00','00000000','R');

commit;
-------------------------------------------------

-------------------------------------------------
--       PD00000460-10018844
-------------------------------------------------
-- Dar de alta bañador GreenCoast
delete from eci_sku_dist_way_provider_rel where eci_reference in (
'97310400094'
);

Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','161','97310400094','00','00000000','F');

commit;
-------------------------------------------------
