SET DEFINE OFF;

-------------------------------------------------
--       PD00000460-10011184
-------------------------------------------------
-- Productos Sfera

delete from eci_sku_dist_way_provider_rel where eci_reference in (
'03302100353',
'68310138448'
);

Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','56','03302100353','00','00000000','R');
Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','60','03302100353','00','00000000','R');
Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','66','03302100353','00','00000000','R');
Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','56','68310138448','00','00000000','R');
Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','60','68310138448','00','00000000','R');
Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','66','68310138448','00','00000000','R');


commit;
-------------------------------------------------


-------------------------------------------------
--       PD00000460-10011329
-------------------------------------------------
-- Productos con nodo COCTELV2
delete from eci_sku_dist_way_provider_rel where eci_reference in (
'02712241948'
);

Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','38','02712241948','00','00000000','R');
Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','56','02712241948','00','00000000','R');


commit;
-------------------------------------------------

