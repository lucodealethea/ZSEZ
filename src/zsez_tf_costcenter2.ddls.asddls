@EndUserText.label: 'Get CostCenter From Employee Data'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.type: #CLIENT_DEPENDENT
define table function ZSEZ_TF_COSTCENTER2
with parameters p_keydate : dats,
p_emplstatus : rsdm4nodename,
p_emplgrp : rsdm4nodename,
p_ANSSA : rsdm4nodename,
p_comp_code : rsdm4nodename
returns {
mandt : mandt;
SEZAME_COST_CENTER_ID : uj_dim_member ;
STATUS : char1 ;
EFFECTIVE_AS_OF : uj_dim_member ;
COSTCENTER : kostl;
LEGAL_ENTITY : zsez_le;
NAME : rstxtmd;

  
}
implemented by method zcl_sez_amdp_employee=>GET_COSTCENTER;
