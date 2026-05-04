SET DEFINE OFF;

-------------------------------------------------
--       PD00000460-10016448
-------------------------------------------------
-- Productos de libros con variantes ECI y MKP

delete from eci_sku_dist_way_provider_rel where eci_reference in (
'06523233118',
'06523233119',
'06540186126'
);

Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','1','06523233118','00','00000000','R');
Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','1','06523233119','00','00000000','R');
Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','1','06540186126','00','00000000','R');
Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','56','06540186126','00','00000000','R');

commit;
-------------------------------------------------

