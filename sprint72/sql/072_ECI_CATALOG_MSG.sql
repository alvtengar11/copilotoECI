SET DEFINE OFF;

-- Se actualiza a null el campo last_UPD_MSG_ID de los productos antes de la carga

-------------------------------------------------
--       PD00000516-4319
-------------------------------------------------
-- Producto para precio igual a 39,90 en cloud001
update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'1900143001'
);
    
commit;

-------------------------------------------------
--       PD00000516-4138
-------------------------------------------------
-- Productos para pruebas de MKP Portugal
update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'10328232001',
'10339424001',
'11098794001',
'2360582001'
);
    
commit;
-------------------------------------------------

-------------------------------------------------
--       PD00000460-10009297
-------------------------------------------------
-- Pack configurable con brand
update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'10489861001',
'2692752001',
'11098794001',
'2360582001',
'2730054001',
'2835506001',
'3498707001'
);
    
commit;
-------------------------------------------------

-------------------------------------------------
--       PD00000460-10009449
-------------------------------------------------
-- Producto con dos planes globales
update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'12700694001'
);
    
commit;
-------------------------------------------------
-------------------------------------------------
--       PD00000460-10009451
-------------------------------------------------
-- Producto con plan global
update eci_sku set LAST_UPD_MSG_ID=null where sku_id in (
'6678292001'
);
    
commit;
-------------------------------------------------
-------------------------------------------------
--       PD00000516-4264
-------------------------------------------------
-- Productos de regresion sprint72
update eci_category set LAST_UPD_MSG_ID=null where external_code in (
'2680857013',
'53895013',
'8504667013'
);
commit;
-------------------------------------------------