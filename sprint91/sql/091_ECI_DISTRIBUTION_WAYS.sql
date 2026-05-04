SET DEFINE OFF;



-------------------------------------------------
--       PD00000460-10017457
-------------------------------------------------
-- Productos Lloyds
delete from eci_sku_dist_way_provider_rel where eci_reference in (
'02818600765',
'02818600757',
'02818600773',
'02818803419',
'02818803443',
'02818803427',
'02818803435',
'02315405833',
'02315405825',
'02315405841',
'03269195974'
);


commit;
-------------------------------------------------
-------------------------------------------------
--       PD00000460-10017421
-------------------------------------------------
-- Producto VPR Sterling Urgente
delete from eci_sku_dist_way_provider_rel where eci_reference in (
'07810875497'
);

Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','27','07810875497','08','N0000005','R');

commit;
-------------------------------------------------

-------------------------------------------------
--       PD00000460-10017662
-------------------------------------------------
-- Producto SR con 3 decimales de PUM
delete from eci_sku_dist_way_provider_rel where eci_reference in (
'18002002469'
);

commit;
-------------------------------------------------

-------------------------------------------------
--       PD00000460-10017741
-------------------------------------------------
-- Productos Alimentación
delete from eci_sku_dist_way_provider_rel where eci_reference in (
'18703101453',
'18851000655'
);

commit;
-------------------------------------------------

-------------------------------------------------
--       PD00000461-10001383
-------------------------------------------------
-- Producto Catering con descuento
delete from eci_sku_dist_way_provider_rel where eci_reference in (
'49510050302'
);

Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','141','49510050302','00','00000000','R');
Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','152','49510050302','00','00000000','F');
Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','56','49510050302','00','00000000','R');
Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','66','49510050302','00','00000000','R');

commit;
-------------------------------------------------
