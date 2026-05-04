SET DEFINE OFF;

-------------------------------------------------
--       PD00000516-9423
-------------------------------------------------
-- Tarjetas regalo virtuales
delete from store_id_by_category where category_id='999.23072006013';

insert into store_id_by_category (site_id,category_id,store_id) values('eciStore','999.23072006013','160');

commit;
---------------------------------------------------