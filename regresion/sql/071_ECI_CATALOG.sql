SET DEFINE OFF;

-------------------------------------------------
--       PD00000460-10009070
-------------------------------------------------
-- Uniformes UK asociados a colegios UK
delete from eci_school_references where SCHOOL_REFERENCE_ID='3000634';

insert into eci_school_references (SCHOOL_REFERENCE_ID,SCHOOL_ID,COMPANY,DEPARTMENT,FAMILY,BAR_AND_SIZE,ECI_REF,CICLO_ID,COURSE_ID,ALUMN_TYPE)
values('3000634','019083','001','0035','101','00328  8','001003510100328  8','3','6','F');
commit;
-------------------------------------------------