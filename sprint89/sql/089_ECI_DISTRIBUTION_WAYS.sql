SET DEFINE OFF;

-------------------------------------------------
--       PD00000516-11784
-------------------------------------------------
-- Productos de stores GreenCoast y Lloyds

delete from eci_sku_dist_way_provider_rel where eci_reference in (
'25064902429',
'25064902437',
'25064902411',
'27404102819',
'27404102827',
'27404102835',
'27404102843',
'27404102850',
'29566307905',
'29566307913',
'29566307921',
'25064902486',
'25064902494',
'29567501498',
'29567501506',
'29567501514',
'19353400351',
'19353400369',
'19353400377',
'29568708852',
'29568708860',
'29568708878',
'29568708886'
);

Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','56','19353400377','00','00000000','R');
Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','56','25064902411','00','00000000','R');
Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','56','25064902494','00','00000000','R');
Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','56','27404102835','00','00000000','R');
Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','56','27404102850','00','00000000','R');
Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','56','29566307921','00','00000000','R');
Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','56','29567501514','00','00000000','R');
Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','56','29568708886','00','00000000','R');

commit;
-------------------------------------------------

-------------------------------------------------
--       PD00000460-10016573
-------------------------------------------------
-- Productos de store Sanchez Romero

delete from eci_sku_dist_way_provider_rel where eci_reference in (
'18022600490',
'20903200564',
'20903200192',
'18000100745',
'18000100844',
'18001500273',
'18001500075',
'18001500265',
'18001500042',
'18001500760',
'18000100133',
'18000100059'
);


commit;
-------------------------------------------------

-------------------------------------------------
--       PD00000516-10701
-------------------------------------------------
-- Productos de seguros
delete from eci_sku_dist_way_provider_rel where eci_reference in (
'77009900018',
'77003200019',
'77003200027'
);

Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','56','77003200019','00','00000000','R');
Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','56','77003200027','00','00000000','R');
Insert into ECI_SKU_DIST_WAY_PROVIDER_REL (ORIGIN,STORE_ID,ECI_REFERENCE,DIST_WAY_ID,PROVIDER_ID,ERROR_FLAG) values ('2','101','77009900018','00','00000000','R');

commit;
-------------------------------------------------