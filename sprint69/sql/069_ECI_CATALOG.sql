SET DEFINE OFF;

-------------------------------------------------
--       PD00000460-10007461
-------------------------------------------------
-- Se dan de alta dos colegios con distintos tamaños de identificador
delete from ECI_SCHOOL where SCHOOL_ID in (
'12345678',
'12345678901234567890'
);


INSERT INTO ECI_SCHOOL (SCHOOL_ID, DESCRIPTION, ALIAS, STREET_NAME, POSTAL_CODE, CITY, PROVINCE, PHONE1, DELETED) VALUES ('12345678', 'PRUEBA 8 CARACTERES', 'PRUEBA 8', 'PRUEBA8', '28001', 'MADRID', 'MADRID', '911111111', '0');
INSERT INTO ECI_SCHOOL (SCHOOL_ID, DESCRIPTION, ALIAS, STREET_NAME, POSTAL_CODE, CITY, PROVINCE, PHONE1, DELETED) VALUES ('12345678901234567890', 'PRUEBA 20 CARACTERES', 'PRUEBA 20', 'PRUEBA20', '28001', 'MADRID', 'MADRID', '911111111', '0');

commit;
-------------------------------------------------
