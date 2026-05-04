SET DEFINE OFF;

-------------------------------------------------
--       PD00000460-10010418
-------------------------------------------------
-- Productos de departamentos 0021 para CnC
DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability WHERE CATALOG_REF_ID in (
'001002112100066038',
'001002112100074038',
'001007310191122   ',
'001007754200553   '
);

Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001007310191122   ','000000000101195086','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001007754200553   ','000000000140897938','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001002112100066038','000001429368310038','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001002112100074038','000001429368440038','001');

-- Dar CnC Hipercor 

DELETE FROM ECI_SITE_TO_STORE.click_and_collect_hipercor WHERE CATALOG_REF_ID in (
'001002112100066038',
'001002112100074038',
'001007310191122   ',
'001007754200553   '
);

insert into click_and_collect_hipercor (catalog_ref_id,unique_code, sell_company_id) values ('001007310191122   ','000000000101195086','001');
insert into click_and_collect_hipercor (catalog_ref_id,unique_code, sell_company_id) values ('001007754200553   ','000000000140897938','001');
insert into click_and_collect_hipercor (catalog_ref_id,unique_code, sell_company_id) values ('001002112100066038','000001429368310038','001');
insert into click_and_collect_hipercor (catalog_ref_id,unique_code, sell_company_id) values ('001002112100074038','000001429368440038','001');

COMMIT;
-------------------------------------------------