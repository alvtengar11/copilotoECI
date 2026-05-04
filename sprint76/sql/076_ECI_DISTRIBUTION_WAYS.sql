SET DEFINE OFF;


-------------------------------------------------
--       PD00000460-10010856
-------------------------------------------------
-- Productos NO_SALE
delete from eci_sku_dist_way_provider_rel where eci_reference in (
'02420112043'
);

Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','56','02420112043','00','00000000','F');
Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','60','02420112043','00','00000000','R');
Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','66','02420112043','00','00000000','R');

commit;
-------------------------------------------------
-------------------------------------------------
--       PD00000516-5265
-------------------------------------------------
-- Producto importado desde PRO (con stockForEans pero sin providers)
delete from eci_sku_dist_way_provider_rel where eci_reference in (
'03161124148'
);

Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','60','03161124148','00','00000000','R');

commit;
-------------------------------------------------
