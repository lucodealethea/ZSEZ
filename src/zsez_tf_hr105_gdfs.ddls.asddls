@EndUserText.label: 'Sezame PA0105 GDFS (Coms)'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.type: #CLIENT_DEPENDENT
// UNION on SUBTYP GDFS and 0001 on PA0105
//SELECT *
//FROM "ZSEZ_TF_HR105_GDFS"
//( P_KEYDATE => '20221219' , P_EMPLSTATUS => '3', P_EMPLGRP => '*', P_COMP_CODE => 'AE42,BE74,BE75,BE76,BE95,BE97,BR92,CL65,CZ77,DE51,DE60,DE61,FR80,GB41,IN62,IN63,IN93,IT96,RO94,SG43,TH59,PL91' );
define table function ZSEZ_TF_HR105_GDFS
with parameters 
p_keydate : dats,
p_emplstatus : rsdm4nodename,
p_emplgrp : rsdm4nodename,
p_comp_code : rsdm4nodename
returns {
mandt      :mandt;
EMPLOYEE    :   persno ;
COMP_CODE : bukrs;
LEGAL_ENTITY : zsez_le;
EMPLOYEE_STATUS : stat2   ;
EMPLOYEE_GROUP : persg;
LEGAL_FIRST_NAME:   pad_vorna;
LEGAL_LAST_NAME :   pad_nachn   ;
USRID : sysid;
USRID_LONG : comm_id_long;
DATETO    :   dats   ;
DATEFROM  :   dats ;
SUBTY   :   subty    ;
OBJPS   :   objps    ;
SEQNR   :   seqnr    ;
INFTY   :   infty    ;
CH_ON   :   aedtm    ;
UNAME   :   aenam    ;
  
}
implemented by method ZCL_SEZ_INFOTYPES=>READ_HR105_GDFS;
