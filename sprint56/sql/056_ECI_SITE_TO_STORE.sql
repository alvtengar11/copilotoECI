SET DEFINE OFF;


-------------------------------------------------
--       PD00000460-10009061
-------------------------------------------------
-- Producto Supervoluminoso con CnC

DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID='001004720111469   ';

insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001004720111469   ','000000000100360106','001');
	
COMMIT;

-------------------------------------------------
