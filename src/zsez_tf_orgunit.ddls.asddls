@EndUserText.label: 'Sezame Organization Unit'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.type: #CLIENT_DEPENDENT
//SELECT * FROM "ZCL_SEZ_INFOTYPES=>READ_ORGUNIT"(P_KEYDATE => '20221226');

define table function ZSEZ_TF_ORGUNIT
with parameters p_keydate : dats,
p_comp_code : rsdm4nodename
returns {
mandt      :mandt;
ORGUNIT : orgeh ;
ORGUNIT_DESC : stext ;
ORGUNIT_DESC_UPPER : hr_mcstext ;
DEPARTMENT : hr_mcshort;
COMP_CODE : bukrs;
CCTR_FROM_OU : hrobjid;
COSTCENTER_DESC : kltxt;
CCTR_FA : fkber;
DATETO  :   /bi0/oidateto   ;
DATEFROM    :   /bi0/oidatefrom ;
INFTY   :   infty    ;
CH_ON   :   aedtm    ;
UNAME   :   aenam    ;
  
}
implemented by method ZCL_SEZ_INFOTYPES=>READ_ORGUNIT;
