SET DEFINE OFF;

-------------------------------------------------
--       PD00000460-10017562
-------------------------------------------------
-- Productos de Lloyds y GC con CNC y STS
delete from eci_sts_skus where catalog_ref_id in (
'001027404102843046',
'001029567501514005',
'001029568708886004',
'001025064902494005'
);

Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('006','001027404102843046','9511');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('004','001027404102843046','9512');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('002','001027404102843046','9497');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001027404102843046','9498');

Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('006','001029567501514005','9499');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('004','001029567501514005','9500');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('002','001029567501514005','9501');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001029567501514005','9502');

Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('006','001029568708886004','9503');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('004','001029568708886004','9504');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('002','001029568708886004','9505');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001029568708886004','9506');

Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('006','001025064902494005','9507');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('004','001025064902494005','9508');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('002','001025064902494005','9509');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001025064902494005','9510');

delete from click_and_collect_availability where catalog_ref_id in (
'001027404102843046',
'001029567501514005',
'001029568708886004',
'001025064902494005'
);

insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id) values ('001027404102843046','000001511462970046','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id) values ('001029567501514005','000001509765200005','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id) values ('001029568708886004','000001510892030004','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id) values ('001025064902494005','000001511344810005','001');
commit;

-------------------------------------------------