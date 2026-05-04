SET DEFINE OFF;


-------------------------------------------------
--       PD00000460-10000157
-------------------------------------------------

-- Dar STS a un producto EDP
--

DELETE FROM ECI_SITE_TO_STORE.eci_sts_skus
WHERE CATALOG_REF_ID='001004710372667   ';

insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001004710372667   ','9126');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('002','001004710372667   ','9127');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('004','001004710372667   ','9128');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('006','001004710372667   ','9129');

COMMIT;

-- Dar CnC a un producto EDP
--

DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID='001004710372667   ';

insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001004710372667   ','000000000107957083','001');
COMMIT;

-- Dar CnC Hipercor a un producto EDP
--

DELETE FROM ECI_SITE_TO_STORE.click_and_collect_hipercor
WHERE CATALOG_REF_ID='001004710372667   ';

insert into click_and_collect_hipercor (catalog_ref_id,unique_code, sell_company_id)
values ('001004710372667   ','000000000107957083','001');

COMMIT;
-------------------------------------------------
