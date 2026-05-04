SET DEFINE OFF;


-------------------------------------------------
--       PD00000460-10002483
-------------------------------------------------

-- Dar CnC a producto financiado
DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID IN (
'001006410000142 42'
);

insert into ECI_SITE_TO_STORE.click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001006410000142 42','000001077982860042','001');
commit;
-------------------------------------------------

-------------------------------------------------
--       PD00000516-6331
--       PD00000460-10013904
-------------------------------------------------

-- Productos de Encargos Hipercor Regresion
delete from click_and_collect_availability where catalog_ref_id in (
'001007741913813   '
);

Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001007741913813   ','000000000101271531','001');


DELETE FROM ECI_SITE_TO_STORE.click_and_collect_hipercor
WHERE CATALOG_REF_ID IN (
'001007741913813   '
);


insert into click_and_collect_hipercor (catalog_ref_id,sell_company_id,unique_code)
values ('001007741913813   ','001','000000000101271531');

commit;

-------------------------------------------------
