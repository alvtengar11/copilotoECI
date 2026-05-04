SET DEFINE OFF;


-------------------------------------------------
--       PD00000460-10002466
-------------------------------------------------

-- Uniformes 2h
DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID in (
'001003510101524  8',
'001003510101631  2',
'001003510101656  2'
);

insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001003510101524  8','000001002861750008','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001003510101631  2','000001002861840002','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001003510101656  2','000001002861860002','001');
COMMIT;
-------------------------------------------------

-------------------------------------------------
--       PD00000460-10002310
-------------------------------------------------

-- Dar CnC y Sts a referencias mixtas
DELETE FROM ECI_SITE_TO_STORE.eci_sts_skus
WHERE CATALOG_REF_ID in (
'001019522391705   ',
'001057063409338009',
'001057063301790009',
'001057063407787  9',
'001003384700542 42'
);

insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001019522391705   ','9139');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('002','001019522391705   ','9140');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('004','001019522391705   ','9141');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('006','001019522391705   ','9142');

insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001057063409338009','9143');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('002','001057063409338009','9144');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('004','001057063409338009','9145');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('006','001057063409338009','9146');

insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001057063301790009','9151');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('002','001057063301790009','9152');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('004','001057063301790009','9153');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('006','001057063301790009','9154');

insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001057063407787  9','9155');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('002','001057063407787  9','9156');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('004','001057063407787  9','9157');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('006','001057063407787  9','9158');



insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001003384700542 42','9167');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('002','001003384700542 42','9168');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('004','001003384700542 42','9169');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('006','001003384700542 42','9170');

COMMIT;


DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID in (
'001019522391705   ',
'001057063409338009',
'001057063301790009',
'001057063407787  9',
'001003384700542 42'
);

insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001019522391705   ','000000000107580933','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001057063409338009','000000000141938154','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001057063301790009','000000000141217282','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001057063407787  9','000000000107927099','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001003384700542 42','000001077385330042','001');
COMMIT;

-----------------------------------------
-- Referencias no documentadas - se da STS y CnC

DELETE FROM ECI_SITE_TO_STORE.eci_sts_skus
WHERE CATALOG_REF_ID in (
'001010660401828   ',
'001010660401836   ',
'001010660401869   ',
'001010660401877   ',
'001010660401885   ',
'001010660401893   ',
'001010660401901   ',
'001010660401919   ',
'001010660401927   ',
'001010660401935   ',
'001010660401943   ',
'001010660401950   ',
'001010660401968   ',
'001010660401976   ',
'001010660401984   ',
'001010660401992   ',
'001010660402008   ',
'001010660402016   '
);



insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660401828   ','9134');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660401836   ','9135');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660401869   ','9136');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660401877   ','9137');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660401885   ','9138');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660401893   ','9139');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660401901   ','9140');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660401919   ','9141');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660401927   ','9142');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660401935   ','9143');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660401943   ','9144');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660401950   ','9145');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660401968   ','9146');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660401976   ','9147');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660401984   ','9148');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660401992   ','9149');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660402008   ','9150');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660402016   ','9151');

---------------------------------------------------
delete FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID in (
'001010660401828   ',
'001010660401836   ',
'001010660401869   ',
'001010660401877   ',
'001010660401885   ',
'001010660401893   ',
'001010660401901   ',
'001010660401919   ',
'001010660401927   ',
'001010660401935   ',
'001010660401943   ',
'001010660401950   ',
'001010660401968   ',
'001010660401976   ',
'001010660401984   ',
'001010660401992   ',
'001010660402008   ',
'001010660402016   '
);

insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660401828   ','000000000107657296','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660401836   ','000000000107657297','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660401869   ','000000000141061700','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660401877   ','000000000141061708','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660401885   ','000000000141061714','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660401893   ','000000000141061719','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660401901   ','000000000141061724','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660401919   ','000000000141061728','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660401927   ','000000000141061733','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660401935   ','000000000141442627','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660401943   ','000000000141442806','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660401950   ','000000000142167968','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660401968   ','000000000142167969','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660401976   ','000000000142167970','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660401984   ','000000000142167971','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660401992   ','000000000142465570','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660402008   ','000000000142465572','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660402016   ','000000000142465573','001');

COMMIT;

-------------------------------------------------

-------------------------------------------------
--       PD00000460-10002819
-------------------------------------------------
-- Dar StS y CnC a productos mixtos de explotación digital


DELETE FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID in (
'001005400903034   '
);

insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001005400903034   ','000000000100533114','001');

COMMIT;

-- Referencias no documentadas explotacion digital- se da STS y CnC
DELETE FROM ECI_SITE_TO_STORE.eci_sts_skus
WHERE CATALOG_REF_ID in (
'001010660402081   ',
'001010660402107   ',
'001010660402115   '
);



insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660402081   ','9177');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660402107   ','9179');
insert into eci_sts_skus (company_id,catalog_ref_id,idx)
values ('001','001010660402115   ','9180');

---------------------------------------------------
delete FROM ECI_SITE_TO_STORE.click_and_collect_availability
WHERE CATALOG_REF_ID in (
'001010660402081   ',
'001010660402107   ',
'001010660402115   '
);

insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660402081   ','000000000143846841','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660402107   ','000000000143846843','001');
insert into click_and_collect_availability (catalog_ref_id,unique_code, company_id)
values ('001010660402115   ','000000000143846845','001');

COMMIT;
----------------------------------------------------------------

