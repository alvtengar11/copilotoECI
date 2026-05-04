SET DEFINE OFF;


-------------------------------------------------
--       PD00000460-10006754
-------------------------------------------------
-- Productos con categoría que no se puede enviar a Baleares

DELETE FROM ECI_SITE_TO_STORE.eci_sts_skus
WHERE CATALOG_REF_ID in (
'001008410940665   '
);

insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001008410940665   ','9403');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('002','001008410940665   ','9404');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('004','001008410940665   ','9405');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('006','001008410940665   ','9406');


DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID in (
'001008410940665   '
);

Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001008410940665   ','000000000106673403','001');

COMMIT;

DELETE FROM ECI_SITE_TO_STORE.eci_sts_skus
WHERE CATALOG_REF_ID in (
'001008410940673   '
);

insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001008410940673   ','9407');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('002','001008410940673   ','9408');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('004','001008410940673   ','9409');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('006','001008410940673   ','9410');


DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID in (
'001008410940673   '
);

Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001008410940673   ','000000000106673457','001');


COMMIT;
-------------------------------------------------

