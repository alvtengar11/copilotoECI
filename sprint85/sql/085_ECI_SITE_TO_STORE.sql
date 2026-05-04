SET DEFINE OFF;

-------------------------------------------------
--       PD00000460-10015358
-------------------------------------------------
-- Productos CnC Portugal

delete from click_and_collect_pt where catalog_ref_id in (
'001003303101368 39',
'001003303101368 40'
);

insert into click_and_collect_pt (catalog_ref_id,company_id,unique_code) values ('001003303101368 39','001','000001061308170039');
insert into click_and_collect_pt (catalog_ref_id,company_id,unique_code) values ('001003303101368 40','001','000001061308170040');
commit;
-------------------------------------------------