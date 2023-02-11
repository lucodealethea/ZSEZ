@EndUserText.label: 'SEZAME Employee Emergency Contact TF'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.type: #CLIENT_DEPENDENT
//SELECT *
//FROM ZSEZ_TF_EMPL_EMC(P_KEYDATE => '20221231', '*','*');
define table function ZSEZ_TF_EMPL_EMC
with parameters
p_keydate : dats,
p_emplstatus : rsdm4nodename,
p_emplgrp : rsdm4nodename,
p_comp_code : rsdm4nodename
returns {
MANDT : mandt;
SAP_EMPLOYEE_ID :  persno ;
GROUP_ID    :   sysid    ;
NAME : pad_conam;
RELATIONSHIP : uj_dim_member ;
PHONE_NUMBER : telnr;
EMAIL_ADDRESS : ad_smtpadr;
//cases where several emergency contacts are given ? no, then ? yes in next field
IS_PRIMARY : char3;
}
implemented by method zcl_sez_amdp_employee=>GET_EMPLOYEE_EMC;
