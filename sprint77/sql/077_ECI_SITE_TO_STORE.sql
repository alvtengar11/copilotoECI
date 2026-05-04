SET DEFINE OFF;


-------------------------------------------------
--       PD00000460-10011329
-------------------------------------------------
-- Productos con nodo COCTELV2
DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability WHERE CATALOG_REF_ID in (
'001002712241948   '
);

Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001002712241948   ','000000000100212432','001');

COMMIT;
-------------------------------------------------

