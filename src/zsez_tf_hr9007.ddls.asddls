@EndUserText.label: 'Sezame PA9007 (Bareme)'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.type: #CLIENT_DEPENDENT
//SELECT * FROM "ZSEZ_TF_HR9007"
//( P_KEYDATE => '20221026' , P_EMPLSTATUS => '3', P_EMPLGRP => '1,2,3,4,5,6,7,8,9,B', P_COMP_CODE => 'AE42,B066,B067,B068,B071,B078,BE74,BE76,BE95,BE97,BR02,CL65,CZ77,DE82,DE83,DE90,DE91,FRWA,GB41,IN93,IT96,RO94,SG43' );
//( P_KEYDATE => '20221026' , P_EMPLSTATUS => '3', P_EMPLGRP => '*', P_COMP_CODE => 'AE42,B066,B067,B068,B071,B078,BE74,BE76,BE95,BE97,BR02,CL65,CZ77,DE82,DE83,DE90,DE91,FRWA,GB41,IN93,IT96,RO94,SG43' );
define table function ZSEZ_TF_HR9007
with parameters
p_keydate : dats,
p_emplstatus : rsdm4nodename,
p_emplgrp : rsdm4nodename,
p_comp_code : rsdm4nodename
returns {
mandt      :mandt;
EMPLOYEE    :   persno ;
COMP_CODE : bukrs;
EMPLOYEE_STATUS : stat2   ;
EMPLOYEE_GROUP : persg ;
LEGAL_FIRST_NAME:   pad_vorna;
LEGAL_LAST_NAME :   pad_nachn   ;

GRADE   :   zgrade  ;
BAREME  :   zbareme ;
ETUDE   :   zetude  ;
FILIERE :   zfiliere    ;
FIL_NIV2    :   zfilniv2    ;
EVALUATEUR  :   zeval   ;
RESP    :   zresp   ;
QUALIF  :   zqualif ;
UH1 :   zuh1    ;
UH2 :   zuh2    ;
UH3 :   zuh3    ;
UH4 :   zuh4    ;
ZTECH   :   ztech   ;
ZHRDIPLOMA1 :   zhrdiploma1 ;
ZHRDIPLOMA2 :   zhrdiploma2 ;
ZHRDIPLOMA3 :   zhrdiploma3 ;
ZPERF_ELIG  :   zperf_elig  ;


DATETO    :   dats   ;
DATEFROM  :   dats ;
SUBTY   :   subty    ;
OBJPS   :   objps    ;
SEQNR   :   seqnr    ;
INFTY   :   infty    ;
CH_ON   :   aedtm    ;
UNAME   :   aenam    ;
}
implemented by method ZCL_SEZ_INFOTYPES=>READ_HR9007;
