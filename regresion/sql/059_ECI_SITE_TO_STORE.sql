SET DEFINE OFF;

-------------------------------------------------
--       PD00000460-10001374
-------------------------------------------------

-- Dar CnC a productos Portugal

DELETE FROM ECI_SITE_TO_STORE.click_and_collect_pt
WHERE CATALOG_REF_ID IN (
'001010762782349   '
);

insert into click_and_collect_pt (catalog_ref_id,company_id,unique_code)
values ('001010762782349   ','001','000000000101806270');
commit;

-------------------------------------------------

-------------------------------------------------
--       PD00000460-10001835
-------------------------------------------------

-- Dar CnC a producto financiado
DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID IN (
'001004710374085   '
);

insert into ECI_SITE_TO_STORE.click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001004710374085   ','000000000141828107','001');
commit;
-------------------------------------------------

-------------------------------------------------
--       PD00000460-10001837
-------------------------------------------------

-- Productos de Encargos
DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID IN (
'001019510117534   '
);
DELETE FROM ECI_SITE_TO_STORE.click_and_collect_hipercor
WHERE CATALOG_REF_ID IN (
'001019510117534   '
);
DELETE FROM ECI_SITE_TO_STORE.click_and_collect_pt
WHERE CATALOG_REF_ID IN (
'001019510117534   '
);

insert into click_and_collect_pt (catalog_ref_id,company_id,unique_code)
values ('001019510117534   ','001','000000000141246318');
insert into click_and_collect_hipercor (catalog_ref_id,sell_company_id,unique_code)
values ('001019510117534   ','001','000000000141246318');
insert into ECI_SITE_TO_STORE.click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001019510117534   ','000000000141246318','001');

commit;

-------------------------------------------------