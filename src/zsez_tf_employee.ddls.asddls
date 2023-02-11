@EndUserText.label: 'Sezame Employee Mock 3'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.type: #CLIENT_DEPENDENT
//
//SELECT *
//FROM "ZSEZ_TF_EMPLOYEE"
//( P_KEYDATE => '20221219' , P_EMPLSTATUS => '3', P_EMPLGRP => '1,2,3,4,5,B', P_ANSSA => '*', P_COMP_CODE => '*');
//( P_KEYDATE => '20230119' , P_EMPLSTATUS => '3', P_EMPLGRP => '1,2,3,4,5,B', P_ANSSA => '1,2,3,4,5,6,7', P_COMP_CODE => 'BE74,BE76,BE97,BR02,CL65,CZ77,DE90,DE91,FRWA,IN93,IT96,RO94,TH59')
//WHERE NOT LB_POSITION_ID_RB IS NULL;
define table function ZSEZ_TF_EMPLOYEE
with parameters p_keydate : dats,
p_emplstatus : rsdm4nodename,
p_emplgrp :  rsdm4nodename,
p_ANSSA : rsdm4nodename,
p_comp_code : rsdm4nodename
returns {
mandt      :mandt;
LB_SAP_EMPLOYEE_ID_RB   :   persno  ;
GROUP_ID    :   sysid   ;
CONVERGENCE_ID  :   sysid   ;
LEGAL_FIRST_NAME:   pad_vorna;
NICK_NAME   :   pad_rufnm  ;
OTHER_FIRST_NAME    :   pad_vorna  ;
LEGAL_LAST_NAME :   pad_nachn   ;
PREFERRED_LAST_NAME :   pad_nachn   ;
BIRTH_NAME  :   pad_name2   ;
MIDDLE_NAME :   pad_midnm   ;
SUFFIX  :   char1   ;
NATIONALITY :   landx50 ;
SECOND_NATIONALITY  :   landx50 ;
GENDER  :   uj_dim_member   ;
MARITAL_STATUS  :   uj_dim_member   ;
DATE_OF_MARITAL_STATUS  :   dats    ;
BUSINESS_COMMUNICAT_LANGUAGE    :   rstxtsh ;
DISABILITY  :   uj_dim_member   ;
DATE_OF_BIRTH   :   gbdat    ;
COUNTRY_OF_BIRTH    :   landx50 ;
REGION_OF_BIRTH :   gbdep   ;
PLACE_OF_BIRTH  :   pad_gbort   ;
OFFICIAL_LANGUAGE   :   uj_dim_member   ;
MOST_RECENT_HIRE_DATE   :   dats    ;
GROUP_START_DATE    :   dats    ;
SENORITY_DATE   :   dats    ;
START_DATE_BEFORE_ACQUISITION   :   dats    ;
LB_POSITION_ID_RB   :   sysid   ;
LB_POSITION_RB  :   /bi0/oibpcsteptxt   ;
LB_POSITION_WEIGHT_RB   :   perct   ;
LB_POSITION_TITLE_RB    :   /bi0/oibpcsteptxt   ;
LB_LEGAL_ENTITYNAME_RB  :   /bi0/oibpcsteptxt   ;
LEGAL_ENTITY    :   zsez_le ;
LB_COMP_CODE_RB :   bukrs   ;
PERS_AREA   :   persa   ;
LB_PERS_AREA_DESC_RB    :   rstxtmd ;
PERS_SAREA  :   btrtl   ;
LB_PERS_SAREA_DESC_RB   :   rstxtsh ;
LB_DEPARTMENT_CODE_RB   :   rstxtsh ;
DEPARTMENT  :   char1   ;
SECOND_ORG_AXIS :   char1   ;
SEZAME_COST_CENTER_ID   :   uj_dim_member   ;
LB_EMPLOYEE_GROUP_RB    :   persg   ;
LB_EMPLOYEE_SGROUP_RB   :   persk   ;
LB_WORK_LOCATION_NAME_RB    :   gebnr   ;
WORK_LOCATION   :   char1   ;
FULL_TIME_REMOTE    :   char1   ;
LINE_MANAGER    :   sysid   ;
ENGIE_JOB   :   uj_dim_member   ;
LOCAL_JOB_NAME  :   char1   ;
POSITION_HAY_LEVEL  :   perct   ;
PERSONAL_HAY_LEVEL  :   uj_dim_member   ;
BAREME  :   zbareme  ;
LABOR_STATUS    :   char1   ;
EMPLOYEE_CLASS  :   rstxtsh ;
LB_CONTRACT_TYPE_16_RB  :   rstxtlg ;
CONTRACT_TYPE   :   rstxtlg ;
CONTRACT_END_DATE   :   dats    ;
PROBATIONARY_PERIOD_END_DATE    :   char1   ;
EMPLOYMENT_TYPE :   rstxtsh ;
STANDARD_WEEKLY_HOURS   :   wostd   ;
LB_GLOBAL_EMPLOYEE_LEVEL_RB :   rstxtmd ;
GLOBAL_EMPLOYEE_LEVEL   :   char1   ;
TIME_PROFILE    :   rstxtmd ;
DEFINITE_WORK   :   char2   ;
GROUP_OF_INTEREST   :   char2   ;
LB_ACTIONREAS_RB    :   massg   ;
LB_ACTIONTYPE_RB    :   massn   ;
LB_ACTIONTYPE_DESC_RB   :   rstxtmd ;
LOCAL_EVENT_REASON  :   rstxtsh ;
PAYROLL_ID  :   uj_dim_member   ;
SMART_CODE  :   char1   ;
ENTRY_DATE   :   dats    ;
  
}
implemented by method ZCL_SEZ_AMDP_EMPLOYEE=>GET_EMPLOYEE_DATA;
