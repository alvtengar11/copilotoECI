SET DEFINE OFF;


-------------------------------------------------
--       PD00000460-10003885
-------------------------------------------------

-- Productos EciExpress en varias provincias

DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID in (
'001020911800561   ',
'001055740203256   ',
'001055740902170   ',
'001013310301141   ',
'001018850400187   ',
'001013349400468   '
);

insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001013349400468   ','000000000140352665','001');

insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001020911800561   ','000000000105923997','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001055740203256   ','000000000107286060','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001055740902170   ','000000000107378917','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001013310301141   ','000000000105791556','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001018850400187   ','000000000105891462','001');


COMMIT;
-------------------------------------------------

-------------------------------------------------
--       PD00000460-10004161
-------------------------------------------------
--Productos con launch-date

DELETE FROM ECI_SITE_TO_STORE.eci_sts_skus
WHERE CATALOG_REF_ID in (
'001003053101642038',
'001003053101634037',
'001003053101659041'
);

insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001003053101642038','9156');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('002','001003053101642038','9157');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('004','001003053101642038','9158');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('006','001003053101642038','9159');

insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001003053101634037','9160');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('002','001003053101634037','9161');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('004','001003053101634037','9162');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('006','001003053101634037','9163');

insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001003053101659041','9164');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('002','001003053101659041','9165');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('004','001003053101659041','9166');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('006','001003053101659041','9167');

DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID IN (
'001003053101642038',
'001003053101634037',
'001003053101659041'
);

insert into ECI_SITE_TO_STORE.click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001003053101642038','000001411257250038','001');
insert into ECI_SITE_TO_STORE.click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001003053101634037','000001411254470037','001');
insert into ECI_SITE_TO_STORE.click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001003053101659041','000001411419180041','001');

commit;
-------------------------------------------------
