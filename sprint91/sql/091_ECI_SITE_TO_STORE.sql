SET DEFINE OFF;

-------------------------------------------------
--       PD00000460-10017562
-------------------------------------------------
-- Productos de Lloyds y GC con CNC y STS
delete from eci_sts_skus where catalog_ref_id in (
'001003269195974   ',
'001002818803443   '
);

Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('006','001003269195974   ','9513');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('004','001003269195974   ','9514');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('002','001003269195974   ','9515');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001003269195974   ','9516');

Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('006','001002818803443   ','9517');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('004','001002818803443   ','9518');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('002','001002818803443   ','9519');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001002818803443   ','9520');

delete from click_and_collect_availability where catalog_ref_id in (
'001003269195974   ',
'001002818803443   '
);

insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id) values ('001003269195974   ','000000000142695286','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id) values ('001002818803443   ','000000000143479417','001');
commit;

-------------------------------------------------