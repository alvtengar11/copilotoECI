SET DEFINE OFF;


-------------------------------------------------
--       PD00000516-3039
-------------------------------------------------

-- Se da de alta la categoria raíz de Primeriti
delete from DCS_ROOT_CATS where ROOT_CAT_ID='2013.21237604016' and CATALOG_ID='primeritiCatalog';

INSERT INTO DCS_ROOT_CATS (CATALOG_ID, ROOT_CAT_ID) VALUES ('primeritiCatalog', '2013.21237604016');

    
commit;
-------------------------------------------------
