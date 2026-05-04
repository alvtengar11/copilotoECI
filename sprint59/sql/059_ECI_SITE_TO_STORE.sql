SET DEFINE OFF;


-------------------------------------------------
--       PD00000460-10001837
-------------------------------------------------

-- Productos de Encargos
DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID IN (
'001006550103532   '
);
DELETE FROM ECI_SITE_TO_STORE.click_and_collect_hipercor
WHERE CATALOG_REF_ID IN (
'001006550103532   '
);
DELETE FROM ECI_SITE_TO_STORE.click_and_collect_pt
WHERE CATALOG_REF_ID IN (
'001006550103532   '
);

insert into ECI_SITE_TO_STORE.click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001006550103532   ','000000000101072109','001');

commit;

-------------------------------------------------


