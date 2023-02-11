@EndUserText.label: 'Sezame PA0105 (Communications)'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.type: #CLIENT_DEPENDENT
// insert into prompt p_emplstatus : '2,3'
//if p_emplstatus = '3' then only "active employee" P_SUBTY (only one) possible entries '010' '020' 'CELL' '9001'
// GDFS handled via ZSEZ_TF_HR105_GDFS
//SELECT * FROM "ZSEZ_TF_HR105"( P_KEYDATE => '20221229' , P_EMPLSTATUS => '3', P_EMPLGRP => '*', P_COMP_CODE => 'BE74', P_SUBTY => 'CELL');
// LPID for CONVERGENCE_ID (FR), SUBTY '0010' for email, '0020' fixed line phone number CELL is cell 9001 for Partena
define table function ZSEZ_TF_HR105
with parameters 
p_keydate : dats,
p_emplstatus : rsdm4nodename,
p_emplgrp : rsdm4nodename,
p_comp_code : rsdm4nodename,
p_subty   :   subty
returns {
mandt      :mandt;
EMPLOYEE    :   persno ;
COMP_CODE : bukrs;
LEGAL_ENTITY : zsez_le;
EMPLOYEE_STATUS :  stat2   ;
EMPLOYEE_GROUP : persg;
LEGAL_FIRST_NAME:   pad_vorna;
LEGAL_LAST_NAME :   pad_nachn    ;
USRID : sysid;
USRID_LONG : comm_id_long;
PARTENA_ERP_KEY : zhr_erp_dat_technical_key_erp;
DATETO    :   dats   ;
DATEFROM  :   dats ;
SUBTY   :   subty    ;
OBJPS   :   objps    ;
SEQNR   :   seqnr    ;
INFTY   :   infty    ;
CH_ON   :   aedtm    ;
UNAME   :   aenam    ;
  
}
implemented by method ZCL_SEZ_INFOTYPES=>READ_HR105;
