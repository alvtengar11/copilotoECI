SET DEFINE OFF;


-------------------------------------------------
--       PD00000460-10007951
-------------------------------------------------
-- Productos eciExpress

DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID in (
'001003110456310   ',
'001003510101490106'
);

Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001003110456310   ','000000000100257109','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001003510101490106','000001002861720106','001');

COMMIT;
-------------------------------------------------
-------------------------------------------------
--       PD00000460-10008002
-------------------------------------------------
-- Productos para globales y planes globales
delete FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID in (
'001023414100364   '
);

Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001023414100364   ','000000000102490553','001');

commit;
-------------------------------------------------
-------------------------------------------------
--       PD00000460-10008265
-------------------------------------------------
--Dar CnC a libros
delete FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID in (
'001025505014636   ',
'001025505005139   '
);

Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001025505014636   ','000000000102621965','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001025505005139   ','000000000102621912','001');

commit;
-------------------------------------------------
-------------------------------------------------
--       PD00000460-10008379
-------------------------------------------------
-- Productos eciExpress Canarias
delete FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID in (
'001008431993917 19'
);

Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001008431993917 19','000001014786700019','001');

commit;
-------------------------------------------------
-------------------------------------------------
--       PD00000460-10008379
-------------------------------------------------
-- Dar STS al producto para añadir la restricción Canarias
delete FROM ECI_SITE_TO_STORE.ECI_STS_SKUS
WHERE CATALOG_REF_ID in (
'001008431993917 19'
);

Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001008431993917 19','9430');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('002','001008431993917 19','9431');


commit;
-------------------------------------------------
-------------------------------------------------
--       PD00000460-10008442
-------------------------------------------------
-- Productos sin HD
delete FROM ECI_SITE_TO_STORE.ECI_STS_SKUS
WHERE CATALOG_REF_ID in (
'001002311001172   '
);

Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001002311001172   ','196');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('002','001002311001172   ','3200');

commit;
-------------------------------------------------

-------------------------------------------------
--       PD00000460-10008857
-------------------------------------------------
-- Stock de productos EEDD
delete FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID in (
'001006871600059   ',
'001082512101948   '
);

Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001006871600059   ','000000000106882894','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001082512101948   ','000000000104819306','001');

commit;
-------------------------------------------------


-------------------------------------------------
--       PD00000460-10008882
-------------------------------------------------
-- STS para productos EEDD
delete FROM ECI_SITE_TO_STORE.ECI_STS_SKUS
WHERE CATALOG_REF_ID in (
'001006871600216   ',
'001082512102086   '
);
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001006871600216   ','9432');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('002','001006871600216   ','9433');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('004','001006871600216   ','9434');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('006','001006871600216   ','9435');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001082512102086   ','9436');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('002','001082512102086   ','9437');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('004','001082512102086   ','9438');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('006','001082512102086   ','9439');


commit;
-------------------------------------------------

-------------------------------------------------
--       PD00000460-10009311
-------------------------------------------------
-- Productos con fecha disponibilidad futura
delete FROM ECI_SITE_TO_STORE.ECI_STS_SKUS
WHERE CATALOG_REF_ID in (
'001005334500013   '
);

Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001005334500013   ','9444');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('002','001005334500013   ','9445');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('004','001005334500013   ','9446');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('006','001005334500013   ','9447');

delete FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID in (
'001005334500013   '
);

Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001005334500013   ','000000000143594560','001');

delete from click_and_collect_pt where catalog_ref_id in (
'001005334500013   '
);

Insert into CLICK_AND_COLLECT_PT (CATALOG_REF_ID,COMPANY_ID,UNIQUE_CODE) values ('001005334500013   ','001','000000000143594560');

commit;
-------------------------------------------------

-------------------------------------------------
--       PD00000460-10010418
-------------------------------------------------
-- Productos EEDD con CNC

delete FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID in (
'001067970208160005',
'001017729508709021',
'001067970206966210'
);

Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001067970208160005','000001473838280005','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001017729508709021','000001488047810021','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001067970206966210','000001473825880210','001');

commit;
-------------------------------------------------

-------------------------------------------------
--       PD00000460-10013198
-------------------------------------------------
-- Dar STS al producto del departamento 0566
delete FROM ECI_SITE_TO_STORE.ECI_STS_SKUS
WHERE CATALOG_REF_ID in (
'001056613111352   '
);

Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001056613111352   ','9473');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('002','001056613111352   ','9474');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('004','001056613111352   ','9475');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('006','001056613111352   ','9476');

commit;
-------------------------------------------------