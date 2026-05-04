SET DEFINE OFF;


-------------------------------------------------
--       PD00000460-10003830
-------------------------------------------------
-- Productos con sección SAP

DELETE FROM ECI_SITE_TO_STORE.eci_sts_skus
WHERE CATALOG_REF_ID in (
'001013300100115   ',
'001013300100099   ',
'001013300100057   '
);

insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001013300100115   ','9215');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('002','001013300100115   ','9216');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('004','001013300100115   ','9217');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('006','001013300100115   ','9218');

insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001013300100099   ','9219');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('002','001013300100099   ','9220');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('004','001013300100099   ','9221');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('006','001013300100099   ','9222');

insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001013300100057   ','9223');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('002','001013300100057   ','9224');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('004','001013300100057   ','9225');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('006','001013300100057   ','9226');

DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID in (
'001013300100115   ',
'001013300100099   ',
'001013300100057   '
);

insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001013300100115   ','000000000105829380','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001013300100099   ','000000000105829382','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001013300100057   ','000000000105829900A','001');


delete from click_and_collect_pt where catalog_ref_id in (
'001013300100115   ',
'001013300100099   ',
'001013300100057   '
);

Insert into CLICK_AND_COLLECT_PT (CATALOG_REF_ID,COMPANY_ID,UNIQUE_CODE) values ('001013300100115   ','001','000000000105829380');
Insert into CLICK_AND_COLLECT_PT (CATALOG_REF_ID,COMPANY_ID,UNIQUE_CODE) values ('001013300100099   ','001','000000000105829382');
Insert into CLICK_AND_COLLECT_PT (CATALOG_REF_ID,COMPANY_ID,UNIQUE_CODE) values ('001013300100057   ','001','000000000105829900A');

delete from click_and_collect_hipercor where catalog_ref_id in (
'001013300100115   ',
'001013300100057   ',
'001013300100099   '
);

Insert into click_and_collect_hipercor (CATALOG_REF_ID,SELL_COMPANY_ID,UNIQUE_CODE) values ('001013300100115   ','001','000000000105829380');
Insert into click_and_collect_hipercor (CATALOG_REF_ID,SELL_COMPANY_ID,UNIQUE_CODE) values ('001013300100099   ','001','000000000105829382');
Insert into click_and_collect_hipercor (CATALOG_REF_ID,SELL_COMPANY_ID,UNIQUE_CODE) values ('001013300100057   ','001','000000000105829900A');

COMMIT;
-------------------------------------------------

-------------------------------------------------
--       PD00000460-10005271
-------------------------------------------------
-- Referencias de MKP con STS
delete from eci_sts_skus where catalog_ref_id in (
'001096410900201004'
);

Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001096410900201004','9230');

commit;

-------------------------------------------------
--       PD00000460-10004271
-------------------------------------------------
-- Productos eci y alimentación con referencias duplicadas

DELETE FROM ECI_SITE_TO_STORE.eci_sts_skus
WHERE CATALOG_REF_ID in (
'001018720800509   '
);

insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001018720800509   ','9191');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('002','001018720800509   ','9192');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('004','001018720800509   ','9193');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('006','001018720800509   ','9194');


DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID in (
'001018720800509   '
);

insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001018720800509   ','000000000105869148A','001');



COMMIT;
-------------------------------------------------