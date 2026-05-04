SET DEFINE OFF;



-------------------------------------------------
--       PD00000460-10001374
-------------------------------------------------

-- Dar CnC a productos Portugal

DELETE FROM ECI_SITE_TO_STORE.click_and_collect_pt
WHERE CATALOG_REF_ID IN (
'001006830543937   '
);

insert into click_and_collect_pt (catalog_ref_id,company_id,unique_code)
values ('001006830543937   ','001','000000000106108538');
commit;

-------------------------------------------------
