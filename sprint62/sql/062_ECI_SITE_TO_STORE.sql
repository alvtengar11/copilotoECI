SET DEFINE OFF;


-------------------------------------------------
--       PD00000460-10003127
-------------------------------------------------

-- Productos 2H Portugal
delete from click_and_collect_pt where catalog_ref_id in (
'001038510203391   '
);

Insert into CLICK_AND_COLLECT_PT (CATALOG_REF_ID,COMPANY_ID,UNIQUE_CODE) values ('001038510203391   ','001','000000000103378473');

commit;

-------------------------------------------------