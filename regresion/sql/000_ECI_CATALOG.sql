SET DEFINE OFF;


-------------------------------------------------
--       PD00000516-925
-------------------------------------------------

-- Se da de alta uniforme en un nuevo colegio
delete from ECI_SCHOOL_REFERENCES where SCHOOL_REFERENCE_ID='3000633';

Insert into ECI_SCHOOL_REFERENCES (SCHOOL_REFERENCE_ID,SCHOOL_ID,COMPANY,DEPARTMENT,FAMILY,BAR_AND_SIZE,ECI_REF,CICLO_ID,COURSE_ID,ALUMN_TYPE,DELETED,LAST_MODIFICATION_DATE) values ('3000633','019256','001','0035','101','01631  2','001003510101631  2','3','6','F','0',null);

    
commit;
-------------------------------------------------
