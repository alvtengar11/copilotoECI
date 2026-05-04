SET DEFINE OFF;


-------------------------------------------------
--       PD00000460-10002390
-------------------------------------------------
-- Carga de surtido horizontal de eciExpress
DELETE ECI_SKU_ASS_HORIZ where centre_id in (
'0733' , '0864' , '0006' , '0783' ,'0005' , '0989' , '0007' , '0710' , '0003' );

INSERT INTO ECI_SKU_ASS_HORIZ (SKU_ID, CENTRE_ID,START_DATE, AVAILABLE)
SELECT sku_id, VALUE AS centre, TO_TIMESTAMP ('01/01/2019 0:00:00.000000',  'DD/MM/YYYY fmHH24fm:MI:SS.FF')  start_date, 1 AVAILABLE
FROM (SELECT s.sku_id 
		FROM dcs_sku s, eci_super_sku ss   
		WHERE SS.SKU_ID = S.SKU_ID AND S.VALIDATED = 1) super_skus,     
     (SELECT VALUE FROM ( 
		(SELECT '0733' c1, '0864' c2, '0006' c3, '0783' c4,'0005' c5, '0989' c6, '0007' c7, '0710' c8, '0003' c9
			FROM DUAL) UNPIVOT
		(VALUE FOR value_type IN (c1, c2, c3, c4, c5, c6, c7, c8, c9))) centres);

COMMIT;
-------------------------------------------------

-------------------------------------------------
--       PD00000460-10002390
-------------------------------------------------
-- Carga de badgets de PRO para producto de Alimentación

delete from eci_local_production where product_id='B001018005600202';
delete from eci_design_manufacturing where product_id='B001018005600202';
delete from eci_closing_circle where product_id='B001018005600202';
delete from eci_sustainable_origin where product_id='B001018005600202';

  --DOP
insert into eci_local_production (product_id,feature_id,idx) values ('B001018005600202','1290817190',0);
--Certif. Origen certificado
insert into eci_local_production (product_id,feature_id,idx) values ('B001018005600202','31820084090',1); 
--IGP
insert into eci_local_production (product_id,feature_id,idx) values ('B001018005600202','31820086090',2); 
--Reduce uso de químicos
insert into eci_design_manufacturing (product_id,feature_id,idx) values ('B001018005600202','31820075090',0); 
 --Ahorro agua
insert into eci_design_manufacturing (product_id,feature_id,idx) values ('B001018005600202','31820076090',1);
 --Calificación Eficiencia Energética
insert into eci_design_manufacturing (product_id,feature_id,idx) values ('B001018005600202','31820077090',2);
 --Ecolabel
insert into eci_design_manufacturing (product_id,feature_id,idx) values ('B001018005600202','31820078090',3);
--Producto protección ambiental
insert into eci_design_manufacturing (product_id,feature_id,idx) values ('B001018005600202','31820079090',4); 
--Economía Solidaria
insert into eci_design_manufacturing (product_id,feature_id,idx) values ('B001018005600202','31820081090',5); 
--Celulosa Reciclada
insert into eci_closing_circle (product_id,feature_id,idx) values ('B001018005600202','31820051090',0); 
--Reciclado certificado GRS
insert into eci_closing_circle (product_id,feature_id,idx) values ('B001018005600202','31820053090',1); 
--Orange Fiber
insert into eci_closing_circle (product_id,feature_id,idx) values ('B001018005600202','31820058090',2); 
--Piñatex
insert into eci_closing_circle (product_id,feature_id,idx) values ('B001018005600202','31820059090',3); 
--PET Reciclado
insert into eci_closing_circle (product_id,feature_id,idx) values ('B001018005600202','31820062090',4); 
--Vidrio Reciclado
insert into eci_closing_circle (product_id,feature_id,idx) values ('B001018005600202','31820063090',5); 
--Otros materiales reciclados
insert into eci_closing_circle (product_id,feature_id,idx) values ('B001018005600202','31820068090',6); 
--Certificación Ecocert
insert into eci_sustainable_origin (product_id,feature_id,idx) values ('B001018005600202','31820029090',0); 
--Certificación MSC
insert into eci_sustainable_origin (product_id,feature_id,idx) values ('B001018005600202','31820012090',1); 
--Certificación Welfare Quality
insert into eci_sustainable_origin (product_id,feature_id,idx) values ('B001018005600202','31820030090',2); 
 --Certificación ANDA
insert into eci_sustainable_origin (product_id,feature_id,idx) values ('B001018005600202','31820031090',3);
--Certificación Cruelty Free
insert into eci_sustainable_origin (product_id,feature_id,idx) values ('B001018005600202','31820032090',4); 
--Ángel Azul
insert into eci_sustainable_origin (product_id,feature_id,idx) values ('B001018005600202','31820040090',5); 
--Cera 100% natural
insert into eci_sustainable_origin (product_id,feature_id,idx) values ('B001018005600202','31820047090',6); 
--ICEA
insert into eci_sustainable_origin (product_id,feature_id,idx) values ('B001018005600202','31820050090',7); 
--Certificación ASC
insert into eci_sustainable_origin (product_id,feature_id,idx) values ('B001018005600202','31820013090',8); 
--Global GAP
insert into eci_sustainable_origin (product_id,feature_id,idx) values ('B001018005600202','31820015090',9); 
--Palma certificada RSPO
insert into eci_sustainable_origin (product_id,feature_id,idx) values ('B001018005600202','31820016090',10); 
--Fibra forestal certificada
insert into eci_sustainable_origin (product_id,feature_id,idx) values ('B001018005600202','1290749190',11); 
 --Producción ecológica
insert into eci_sustainable_origin (product_id,feature_id,idx) values ('B001018005600202','1290751190',12); 
--Rainforest Alliance
insert into eci_sustainable_origin (product_id,feature_id,idx) values ('B001018005600202','31820020090',13); 
--Leaf
insert into eci_sustainable_origin (product_id,feature_id,idx) values ('B001018005600202','31820021090',14); 
--Comercio Justo Fairtrade
insert into eci_sustainable_origin (product_id,feature_id,idx) values ('B001018005600202','31820022090',15); 
--Asociacíon Comercio Justo
insert into eci_sustainable_origin (product_id,feature_id,idx) values ('B001018005600202','31820023090',16); 
--Programa PLS
insert into eci_sustainable_origin (product_id,feature_id,idx) values ('B001018005600202','31820024090',17); 
--Certificación FSC
insert into eci_sustainable_origin (product_id,feature_id,idx) values ('B001018005600202','31820026090',18);
 --Certificación PEFC
insert into eci_sustainable_origin (product_id,feature_id,idx) values ('B001018005600202','31820027090',19);
--Madera justa
insert into eci_sustainable_origin (product_id,feature_id,idx) values ('B001018005600202','31820028090',20); 

commit;
-------------------------------------------------