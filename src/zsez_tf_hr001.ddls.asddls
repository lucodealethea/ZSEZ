@EndUserText.label: 'Sezame PA0001 (Org. Assignment)'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.type: #CLIENT_DEPENDENT
//SELECT HRPOSITION, EMPLOYEE_STATUS, EMPLGROUP, EMPLGROUP_TEXT, COUNT(EMPLOYEE) AS CTR_EMPLOYEE
//FROM "ZSEZ_TF_HR001"(P_KEYDATE => '20221215', P_EMPLSTATUS => '3', P_EMPLGRP => '*', P_COMP_CODE => 'BE74,BE76,BE97,BR02,CL65,CZ77,DE90,DE91,FRWA,IN93,IT96,RO94,TH59'  )
//WHERE HRPOSITION = '99999999'
//GROUP BY HRPOSITION, EMPLOYEE_STATUS, EMPLGROUP, EMPLGROUP_TEXT;
define table function ZSEZ_TF_HR001
with parameters
p_keydate : dats,
p_emplstatus : rsdm4nodename,
p_emplgrp :  rsdm4nodename,
p_comp_code : rsdm4nodename
returns {
mandt      :mandt;
EMPLOYEE    :   persno ;
COMP_CODE : bukrs;
EMPLOYEE_STATUS : stat2   ;
EMPLOYEE_GROUP : persg;
LEGAL_FIRST_NAME:   pad_vorna;
LEGAL_LAST_NAME :   pad_nachn    ;

PERS_AREA   :   persa   ;
PERS_AREA_DESC  :   rstxtmd ;
PERS_SAREA      :   btrtl   ;
PERS_SAREA_DESC :   rstxtsh ;
EMPLGROUP   :   persg   ;
EMPLGROUP_TEXT  :   rstxtsh ;
EMPLSGROUP  :   persk   ;
EMPLSGROUP_TEXT :   rstxtsh ;
JOB :   stell   ;
//ZSEZ_LE_MAP           
LEGAL_ENTITY    :   zsez_le ;
LEGAL_ENTITY_DESC   :   rstxtlg ;
PAYRL_AREA  :   abkrs   ;
EMPLCNTRCT  :   ansvh   ;
CO_AREA :   kokrs   ;
MAST_CCTR   :   kostl   ;
ORGUNIT :   orgeh   ;
HRPOSITION  :   plans   ;
HRPOSITION_TEXT    :   rstxtmd ;
EMPLOYEE_PERC : empct;
PARTENA_ERP_KEY :   zhr_erp_dat_technical_key_erp   ;


DATETO    :   dats   ;
DATEFROM  :   dats ;
SUBTY   :   subty    ;
OBJPS   :   objps    ;
SEQNR   :   seqnr    ;
INFTY   :   infty    ;
CH_ON   :   aedtm    ;
UNAME   :   aenam    ;
  
}
implemented by method ZCL_SEZ_INFOTYPES=>READ_HR001;
