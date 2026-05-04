SET DEFINE OFF;

-------------------------------------------------
--       PD00000460-10013904
-------------------------------------------------
-- Productos de promociones GOP de Mercancía General

delete from click_and_collect_availability where catalog_ref_id in (
'001007410406123   ',
'001097574523730   ',
'001007410221274   ',
'001007410323740   ',
'001007310980771   ',
'001007410221290   ',
'001007410323781   ',
'001007410007194   ',
'001007410221621   '
);

Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001007410406123   ','000000000101207882','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001097574523730   ','000000000106544852','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001007410221274   ','000000000106179435','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001007410323740   ','000000000106179446','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001007310980771   ','000000000106627985','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001007410221290   ','000000000106189301','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001007410323781   ','000000000106189310','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001007410007194   ','000000000106486365','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001007410221621   ','000000000106672280','001');

delete from click_and_collect_hipercor where catalog_ref_id in (
'001007410406123   ',
'001097574523730   ',
'001007410221274   ',
'001007410323740   ',
'001007310980771   ',
'001007410221290   ',
'001007410323781   ',
'001007410007194   ',
'001007410221621   '
);

insert into click_and_collect_hipercor (catalog_ref_id,sell_company_id,unique_code) values ('001007410406123   ','001','000000000101207882');
insert into click_and_collect_hipercor (catalog_ref_id,sell_company_id,unique_code) values ('001097574523730   ','001','000000000106544852');
insert into click_and_collect_hipercor (catalog_ref_id,sell_company_id,unique_code) values ('001007410221274   ','001','000000000106179435');
insert into click_and_collect_hipercor (catalog_ref_id,sell_company_id,unique_code) values ('001007410323740   ','001','000000000106179446');
insert into click_and_collect_hipercor (catalog_ref_id,sell_company_id,unique_code) values ('001007310980771   ','001','000000000106627985');
insert into click_and_collect_hipercor (catalog_ref_id,sell_company_id,unique_code) values ('001007410221290   ','001','000000000106189301');
insert into click_and_collect_hipercor (catalog_ref_id,sell_company_id,unique_code) values ('001007410323781   ','001','000000000106189310');
insert into click_and_collect_hipercor (catalog_ref_id,sell_company_id,unique_code) values ('001007410007194   ','001','000000000106486365');
insert into click_and_collect_hipercor (catalog_ref_id,sell_company_id,unique_code) values ('001007410221621   ','001','000000000106672280');

commit;
-------------------------------------------------
