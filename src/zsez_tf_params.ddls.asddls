@EndUserText.label: 'Returns Each Parameter'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.type: #CLIENT_INDEPENDENT
//SELECT *
//FROM "ZSEZ_TF_PARAMS"( P_KEYDATE =>'20221231', P_EMPLSTATUS=>'*', P_COMP_CODE =>'*', P_ANSSA=>'*');
//SELECT *
//FROM "ZSEZ_TF_PARAMS"( '20221231', '*', '*', '*');
define table function ZSEZ_TF_PARAMS
with parameters
p_keydate : dats,
p_emplstatus : rsdm4nodename,
p_emplgrp :  rsdm4nodename,
p_comp_code : rsdm4nodename,
p_anssa : rsdm4nodename
returns {
lv_keydate : dats;
lv_emplstatus : rsdm4nodename;
lv_emplgrp : rsdm4nodename;
lv_comp_code : rsdm4nodename;
lv_anssa :    rsdm4nodename;
lv_bup_emplstatus :    rsdm4nodename;
lv_bup_emplgrp :    rsdm4nodename;
lv_bup_comp_code :    rsdm4nodename;
lv_bup_anssa  :  rsdm4nodename;
}
implemented by method ZCL_AMDP_SPLIT_STRG=>GET_PARAMS;
