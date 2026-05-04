SET DEFINE OFF;
-------------------------------------------------
--       PD00000460-10013158
-------------------------------------------------
-- Productos asegurables

delete from click_and_collect_availability where catalog_ref_id in (
'001094478000550   '
);
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001094478000550   ','000000000140464999','001');

delete from eci_sts_skus where catalog_ref_id in (
'001094478000550   ',
'001014842205776   '
);
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001014842205776   ','9477');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001094478000550   ','9478');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('002','001094478000550   ','9479');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('004','001094478000550   ','9480');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('006','001094478000550   ','9481');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('011','001094478000550   ','9482');

commit;

-------------------------------------------------
--       PD00000460-10013121
-------------------------------------------------
-- Producto eciExpress Portugal

delete from click_and_collect_pt where catalog_ref_id in (
'001028647003129   ',
'001028638801226   ',
'001028648100338   ',
'001013512102446   '
);

Insert into CLICK_AND_COLLECT_PT (CATALOG_REF_ID,COMPANY_ID,UNIQUE_CODE) values ('001013512102446   ','001','000000000102081140');

commit;

-------------------------------------------------

-------------------------------------------------
--       PD00000460-10013139
-------------------------------------------------
-- Planes globales de colectivos
delete from click_and_collect_availability where catalog_ref_id in (
'001008418193507   ',
'001008418194679   ',
'001009811400044105',
'001008446697776   ',
'001008418695030   '
);

Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001008418194679   ','000000000101471419','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001008418695030   ','000000000106623014','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001008446697776   ','000000000101492571','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001009811400044105','000001016935030105','001');

commit;

-------------------------------------------------