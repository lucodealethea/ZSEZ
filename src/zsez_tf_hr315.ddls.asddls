@EndUserText.label: 'Sezame InfoTyp PA0315(CATS: Sender Info)'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.type: #CLIENT_DEPENDENT
//SELECT *
//FROM "ZSEZ_TF_HR315"(P_KEYDATE => '20221226',P_EMPLSTATUS => '*', P_EMPLGRP => '*', P_COMP_CODE => '*' );
//P_EMPLSTATUS => '3', P_EMPLGRP => '*',P_COMP_CODE => 'AE42,B066,B067,B068,B071,B078,BE74,BE76,BE95,BE97,BR02,CL65,CZ77,DE82,DE83,DE90,DE91,FRWA,GB41,IN93,IT96,RO94,SG43' );

define table function ZSEZ_TF_HR315
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
EMPLOYEE_GROUP : persg;
LEGAL_FIRST_NAME:   pad_vorna;
LEGAL_LAST_NAME :   pad_nachn    ;

KOSTL : skostl;
LSTAR : lstar;
PLSTA : plsta;
WERKS : werks_d;
LIFNR : elifn;
EBELN : sebeln;
EBELP : sebelp;
LSTNR : asnum;
SPRZNR : co_prznr;
ACCNT : catsaccnt;

ZZOVHLINE :  zpps_ovhline;

DATETO    :   dats   ;
DATEFROM  :   dats ;
SUBTY   :   subty    ;
OBJPS   :   objps    ;
SEQNR   :   seqnr    ;
INFTY   :   infty    ;
CH_ON   :   aedtm    ;
UNAME   :   aenam    ;  
}
implemented by method ZCL_SEZ_INFOTYPES=>READ_HR315;
