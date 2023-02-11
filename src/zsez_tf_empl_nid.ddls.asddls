@EndUserText.label: 'SEZAME Employee National ID TF'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.type: #CLIENT_DEPENDENT
//SELECT * FROM ZSEZ_TF_EMPL_NID('20221231','*','*');
define table function ZSEZ_TF_EMPL_NID
with parameters
p_keydate : dats,
p_emplstatus : rsdm4nodename,
p_emplgrp : rsdm4nodename,
p_comp_code : rsdm4nodename
returns {
mandt : mandt;
SAP_EMPLOYEE_ID :   persno ;
GROUP_ID    :   sysid    ;
COUNTRY : uj_dim_member ;
NATIONAL_ID_CARD_TYPE : uj_dim_member ;
NATIONAL_ID : uj_dim_member ;
IS_PRIMARY : uj_dim_member ;
COMP_CODE : bukrs ;
EMPLOYEE_STATUS : stat2   ;  
}
implemented by method zcl_sez_amdp_employee=>GET_EMPLOYEE_NID;
