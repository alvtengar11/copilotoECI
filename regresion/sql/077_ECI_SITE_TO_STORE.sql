SET DEFINE OFF;
-------------------------------------------------
-------------------------------------------------
--       PD00000460-10019194
-------------------------------------------------
-- Productos CnC Portugal
delete from click_and_collect_pt where catalog_ref_id in (
'001084911100794  5'
);
Insert into ECI_SITE_TO_STORE.CLICK_AND_COLLECT_PT (CATALOG_REF_ID,COMPANY_ID,UNIQUE_CODE) values ('001084911100794  5','001','000001069807080005');
commit;

DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability WHERE CATALOG_REF_ID in (
'001084911100794  5'
);

Insert into ECI_SITE_TO_STORE.CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001084911100794  5','000001069807080005','001');
commit;
-------------------------------------------------
--       PD00000460-10015474
-------------------------------------------------
-- Productos CnC Portugal
delete from click_and_collect_pt where catalog_ref_id in (
'001057063401814  9'
);

Insert into CLICK_AND_COLLECT_PT (CATALOG_REF_ID,COMPANY_ID,UNIQUE_CODE) values ('001057063401814  9','001','000000000104246829');
commit;
-------------------------------------------------
-------------------------------------------------
--       PD00000460-10011601
-------------------------------------------------
-- Producto con agotador en DPTO 0021

DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability WHERE CATALOG_REF_ID in (
'001002137800021038'
);

Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001002137800021038','000001421088360038','001');


delete FROM ECI_SITE_TO_STORE.ECI_STS_SKUS
WHERE CATALOG_REF_ID in (
'001002137800021038'
);

Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001002137800021038','9461');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('002','001002137800021038','9462');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('004','001002137800021038','9463');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('006','001002137800021038','9464');

COMMIT;
-------------------------------------------------
-------------------------------------------------
--       PD00000460-10011632
-------------------------------------------------
-- Configuración de agotador con despublicar
DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability WHERE CATALOG_REF_ID in (
'001025224505849   ',
'001008310700243   ',
'001025224505872   ',
'001007016174836   '
);

Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001007016174836   ','000000000101155101','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001025224505849   ','000000000106263918','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001025224505872   ','000000000106263943','001');


delete FROM ECI_SITE_TO_STORE.ECI_STS_SKUS
WHERE CATALOG_REF_ID in (
'001025224505849   ',
'001008310700243   ',
'001025224505872   ',
'001007016174836   '
);

Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001025224505849   ','2606');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001025224505872   ','2607');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('002','001007016174836   ','4766');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('004','001025224505849   ','7469');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('004','001025224505872   ','7470');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('006','001007016174836   ','8650');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('002','001025224505849   ','5610');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('002','001025224505872   ','5611');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('004','001007016174836   ','7098');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001007016174836   ','1762');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('002','001008310700243   ','4990');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('006','001025224505849   ','9021');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('006','001025224505872   ','9022');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001008310700243   ','1986');

COMMIT;
-------------------------------------------------
-------------------------------------------------
--       PD00000460-10011243
-------------------------------------------------
-- Productos con servicios
DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability WHERE CATALOG_REF_ID in (
'001004721743922   '
);

Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001004721743922   ','000000000107814166','001');


delete FROM ECI_SITE_TO_STORE.ECI_STS_SKUS
WHERE CATALOG_REF_ID in (
'001004721743922   '
);

Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001004721743922   ','9457');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('002','001004721743922   ','9458');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('004','001004721743922   ','9459');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('006','001004721743922   ','9460');

COMMIT;
-------------------------------------------------

