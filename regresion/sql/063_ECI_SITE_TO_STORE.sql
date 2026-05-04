SET DEFINE OFF;


-------------------------------------------------
--       PD00000516-3492
-------------------------------------------------
--Productos regresión del Sprint 69
DELETE FROM ECI_SITE_TO_STORE.eci_sts_skus
WHERE CATALOG_REF_ID in (
'001013300100107   ',
'001013300100065   ',
'001013300100156   '
);

insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001013300100065   ','9383');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('002','001013300100065   ','9384');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('004','001013300100065   ','9385');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('006','001013300100065   ','9386');

insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001013300100107   ','9379');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('002','001013300100107   ','9380');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('004','001013300100107   ','9381');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('006','001013300100107   ','9382');

insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001013300100156   ','9375');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('002','001013300100156   ','9376');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('004','001013300100156   ','9377');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('006','001013300100156   ','9378');

DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID in (
'001013300100107   ',
'001013300100065   ',
'001013300100156   '
);

insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id) values ('001013300100065   ','000000000105829379A','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id) values ('001013300100107   ','000000000105829381','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id) values ('001013300100156   ','000000000107123211','001');

delete from click_and_collect_pt where catalog_ref_id in (
'001013300100107   ',
'001013300100065   ',
'001013300100156   '
);

Insert into CLICK_AND_COLLECT_PT (CATALOG_REF_ID,COMPANY_ID,UNIQUE_CODE) values ('001013300100065   ','001','000000000105829379A');
Insert into CLICK_AND_COLLECT_PT (CATALOG_REF_ID,COMPANY_ID,UNIQUE_CODE) values ('001013300100107   ','001','000000000105829381');
Insert into CLICK_AND_COLLECT_PT (CATALOG_REF_ID,COMPANY_ID,UNIQUE_CODE) values ('001013300100156   ','001','000000000107123211');

delete from click_and_collect_hipercor where catalog_ref_id in (
'001013300100107   ',
'001013300100065   ',
'001013300100156   '
);
Insert into click_and_collect_hipercor (CATALOG_REF_ID,SELL_COMPANY_ID,UNIQUE_CODE) values ('001013300100065   ','001','000000000105829379A');
Insert into click_and_collect_hipercor (CATALOG_REF_ID,SELL_COMPANY_ID,UNIQUE_CODE) values ('001013300100107   ','001','000000000105829381');
Insert into click_and_collect_hipercor (CATALOG_REF_ID,SELL_COMPANY_ID,UNIQUE_CODE) values ('001013300100156   ','001','000000000107123211');

COMMIT;
-------------------------------------------------
-------------------------------------------------
--       PD00000460-10009636
-------------------------------------------------
--Producto Portugal con entrega en 2h

DELETE FROM ECI_SITE_TO_STORE.click_and_collect_pt
WHERE CATALOG_REF_ID in (
'001006811141529   '
);

insert into click_and_collect_pt (catalog_ref_id,unique_code,company_id)
values('001006811141529   ','000000000101134389','001');

commit;
-------------------------------------------------