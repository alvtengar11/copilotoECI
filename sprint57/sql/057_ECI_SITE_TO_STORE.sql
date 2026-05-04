SET DEFINE OFF;


-------------------------------------------------
--       PD00000460-10012390
-------------------------------------------------
-- Productos de pruebas Sterling
delete FROM ECI_SITE_TO_STORE.ECI_STS_SKUS
WHERE CATALOG_REF_ID in (
'001010110108023   '
);

Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001010110108023   ','9469');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('002','001010110108023   ','9470');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('004','001010110108023   ','9471');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('006','001010110108023   ','9472');

COMMIT;
-------------------------------------------------

