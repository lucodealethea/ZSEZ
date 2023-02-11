@EndUserText.label: 'Sezame InfoType PA0006(Addresses)'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.type: #CLIENT_DEPENDENT
//SELECT *
//FROM "ZSEZ_TF_HR006"(P_KEYDATE => '20221226',P_EMPLSTATUS => '*', P_COMP_CODE => '*', P_ANSSA => '*' );
//P_EMPLSTATUS => '3', P_COMP_CODE => 'AE42,B066,B067,B068,B071,B078,BE74,BE76,BE95,BE97,BR02,CL65,CZ77,DE82,DE83,DE90,DE91,FRWA,GB41,IN93,IT96,RO94,SG43' );

//SELECT EMPLOYEE, COUNT(ADDRESS_TYPE) AS CK
//FROM "ZSEZ_TF_HR006"(P_KEYDATE => '20221231',P_EMPLSTATUS => '*', P_COMP_CODE => '*', P_ANSSA => '*' )
//GROUP BY EMPLOYEE HAVING COUNT(ADDRESS_TYPE) > 1;

define table function ZSEZ_TF_HR006
with parameters
p_keydate : dats,
p_emplstatus : rsdm4nodename,
p_emplgrp : rsdm4nodename,
p_comp_code : rsdm4nodename,
p_anssa : rsdm4nodename
returns {
mandt      :mandt;
COUNTRY_SAP : land1;
EMPLOYEE    :   persno ;

COMP_CODE : bukrs;
EMPLOYEE_STATUS : stat2   ;
EMPLOYEE_GROUP : persg;
LEGAL_FIRST_NAME:   pad_vorna;
LEGAL_LAST_NAME :   pad_nachn    ;

ADDRESS_TYPE :   anssa;
ADDRESS_TYPE_DESC : rstxtmd;

STREET : pad_stras;
LOCAT : pad_locat;
HSNMR : pad_hsnmr;
APARTMENT : pad_posta;
POSTAL_CD : pstlz_hr;
CITY : pad_ort01;

COUNTRY:landx50;
COUNTRY_ISO:intca3;
DISTANCE : entkm;
MEDST : medst;

TEL_NUMBER : telnr;

NAME2 : pad_conam;
WKWNG : wkwng;
BUSRT : busrt;
STATE : regio;
ORT02 : pad_ort02;
DISTANCE2 : entkm;
ADR03 : ad_strspp1;
ADR04 : ad_strspp2;


BLDNG : ad_bld_10;
FLOOR : ad_floor;
EMAIL : zhrmail;

DATETO    :   dats   ;
DATEFROM  :   dats ;
SUBTY   :   subty    ;
OBJPS   :   objps    ;
SEQNR   :   seqnr    ;
INFTY   :   infty    ;
CH_ON   :   aedtm    ;
UNAME   :   aenam    ;  
}
implemented by method ZCL_SEZ_INFOTYPES=>READ_HR006;
