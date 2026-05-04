SET DEFINE OFF;

-------------------------------------------------
--       PD00000460-10018853
-------------------------------------------------
-- Dar CnC a la referencia
delete from click_and_collect_availability where catalog_ref_id in (
'001005106302358   '
);

insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id) values ('001005106302358   ','000000000107993544','001');

commit;

-------------------------------------------------