SET DEFINE OFF;

-------------------------------------------------
--       PD00000460-10016448
-------------------------------------------------
-- Productos de libros con variantes ECI y MKP
delete from eci_sts_skus where catalog_ref_id in (
'001006523233118   ',
'001006523233119   '
);

Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('006','001006523233118   ','9489');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('004','001006523233118   ','9490');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('002','001006523233118   ','9491');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001006523233118   ','9492');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('006','001006523233119   ','9493');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('004','001006523233119   ','9494');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('002','001006523233119   ','9495');
Insert into ECI_STS_SKUS (COMPANY_ID,CATALOG_REF_ID,IDX) values ('001','001006523233119   ','9496');

delete from click_and_collect_availability where catalog_ref_id in (
'001006523233118   ',
'001006523233119   '
);

insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id) values ('001006523233118   ','000000000144138635','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id) values ('001006523233119   ','000000000144138636','001');
commit;

-------------------------------------------------