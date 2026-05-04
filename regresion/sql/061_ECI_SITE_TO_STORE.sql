SET DEFINE OFF;
-------------------------------------------------
--       PD00000461-10001066
-------------------------------------------------
-- Productos MKP
DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID in (
'001025505005253   '
);

insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001025505005253   ','000000000102621922','001');


DELETE FROM ECI_SITE_TO_STORE.eci_sts_skus
WHERE CATALOG_REF_ID in (
'001025505005253   '   
);

insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001025505005253   ','9159');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('002','001025505005253   ','9160');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('004','001025505005253   ','9161');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('006','001025505005253   ','9162');
commit;
-------------------------------------------------
--       PD00000460-10002310
-------------------------------------------------
-- Referencias no documentadas - se da STS y CnC

DELETE FROM ECI_SITE_TO_STORE.eci_sts_skus
WHERE CATALOG_REF_ID in (
'001010660401802   ',
'001010660401810   '
);



insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660401802   ','9132');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660401810   ','9133');

---------------------------------------------------
delete FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID in (
'001010660401802   ',
'001010660401810   '
);

insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660401802   ','000000000107657294','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660401810   ','000000000107657295','001');

COMMIT;

-------------------------------------------------

-------------------------------------------------
--       PD00000460-10002819
-------------------------------------------------
-- Dar StS y CnC a productos mixtos de explotación digital
DELETE FROM ECI_SITE_TO_STORE.eci_sts_skus
WHERE CATALOG_REF_ID in (
'001057063407696  9',
'001038545716649   ',
'001094610600226   ',
'001056613401373   ',
'001038545713539   '
);

insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001057063407696  9','9139');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001038545716649   ','9139');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001056613401373   ','9139');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001094610600226   ','9139');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001038545713539   ','9139');

DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID in (
'001057063407696  9',
'001038545716649   ',
'001094610600226   ',
'001056613401373   ',
'001038545713539   '
);

insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001057063407696  9','000000000107920059','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001038545716649   ','000000000107941253','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001056613401373   ','000000000104242303','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001094610600226   ','000000000141099964','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001038545713539   ','000000000103382669','001');
COMMIT;

-- Referencias no documentadas explotacion digital- se da STS y CnC
DELETE FROM ECI_SITE_TO_STORE.eci_sts_skus
WHERE CATALOG_REF_ID in (
'001010660402024   ',
'001010660402032   ',
'001010660402040   ',
'001010660402057   ',
'001010660402065   ',
'001010660402073   ',
'001010660402099   '
);



insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660402024   ','9171');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660402032   ','9172');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660402040   ','9173');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660402057   ','9174');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660402065   ','9175');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660402073   ','9176');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660402099   ','9178');

---------------------------------------------------
delete FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID in (
'001010660402024   ',
'001010660402032   ',
'001010660402040   ',
'001010660402057   ',
'001010660402065   ',
'001010660402073   ',
'001010660402099   '
);

insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660402024   ','000000000142465574','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660402032   ','000000000142465575','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660402040   ','000000000142465576','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660402057   ','000000000142465577','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660402065   ','000000000142465579','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660402073   ','000000000143846840','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660402099   ','000000000143846842','001');

COMMIT;
----------------------------------------------------------------