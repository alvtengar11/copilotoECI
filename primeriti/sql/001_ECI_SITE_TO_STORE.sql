SET DEFINE OFF;

-----------------------------------------
-- PD00000516-2936
-----------------------------------------
--Carga de productos de Primeriti (incluidos los provenientes de NFT)

delete from eci_sts_skus where catalog_ref_id in (
'001019523617256   ',
'001019510114978   '
);

Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('002','001019510114978   ','5501');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001019510114978   ','2497');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('004','001019510114978   ','5501');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('006','001019510114978   ','2497');

Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('002','001019523617256   ','9465');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001019523617256   ','9466');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('004','001019523617256   ','9467');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('006','001019523617256   ','9468');

delete from click_and_collect_availability where catalog_ref_id in (
'001019523617256   ',
'001019510114978   '
);

Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001019523617256   ','000000000107448268','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001019510114978   ','000000000102415622','001');

delete from click_and_collect_hipercor where catalog_ref_id in (
'001019523617256   ',
'001019510114978   '
);

delete from click_and_collect_pt where catalog_ref_id in (
'001019523617256   ',
'001019510114978   '
);

commit;
-----------------------------------------

