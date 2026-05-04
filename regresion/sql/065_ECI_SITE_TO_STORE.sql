SET DEFINE OFF;


-------------------------------------------------
--       PD00000460-10009651
-------------------------------------------------
-- Productos voluminoso con configuración ISPU	

DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID in (
'001007746961635   '
);

Insert into ECI_SITE_TO_STORE.CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001007746961635   ','000000000140875526','001');

COMMIT;
-------------------------------------------------
