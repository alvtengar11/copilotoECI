SET DEFINE OFF;

-------------------------------------------------
--      PD00000460-10016028
-------------------------------------------------
-- Platos preparados
delete from click_and_collect_availability where catalog_ref_id in (
'001016582000671   ',
'001016582000754   ',
'001016582000762   ',
'001016582000770   ',
'001016582000788   ',
'001016582000796   '
);

insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id) values ('001016582000671   ','000000000151949413D','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id) values ('001016582000754   ','000000000151949438D','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id) values ('001016582000762   ','000000000151949440D','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id) values ('001016582000770   ','000000000151949443D','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id) values ('001016582000788   ','000000000151949449D','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id) values ('001016582000796   ','000000000151949458D','001');
commit;
-------------------------------------------------

-------------------------------------------------
--       PD00000460-10016028
-------------------------------------------------
--Productos eciExpress
delete from click_and_collect_availability where catalog_ref_id in (
'001013348500169   ',
'001013342000406   ',
'001013342000315   ',
'001013342001008   '
);

Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001013342000315   ','000000000105861153A','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001013342000406   ','000000000105860952A','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001013342001008   ','000000000105861011A','001');
Insert into CLICK_AND_COLLECT_AVAILABILITY (CATALOG_REF_ID,UNIQUE_CODE,COMPANY_ID) values ('001013348500169   ','000000000106121997A','001');
commit;

-------------------------------------------------