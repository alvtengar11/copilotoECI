SET DEFINE OFF;

-------------------------------------------------
--       PD00000460-10008811
-------------------------------------------------
-- Productos de automatizacion Canarias

DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID in (
'001006523190152   ',
'001006523190160   ',
'001006523190459   '
);

Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001006523190152   ','000000000142479373','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001006523190160   ','000000000142479375','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001006523190459   ','000000000142479444','001');

commit;
---------------------------------------------------

-------------------------------------------------
--       PD00000460-10008821
-------------------------------------------------
-- Uniformes UK
delete from click_and_collect_availability where catalog_ref_id in (
'001003510100328  2'
);

insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001003510100328  2','000001002860880002','001');

COMMIT;
-------------------------------------------------