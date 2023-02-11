@EndUserText.label: 'Sezame Employee N Plus One'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.type: #CLIENT_DEPENDENT
////SELECT * FROM ZSEZ_TF_EMPL_N_PLUS_ONE(P_KEYDATE => '20230120', P_EMPLSTATUS => '*', P_COMP_CODE => '*', P_LEVEL => '1')
//WHERE EMPLOYEE = '00220409';
define table function ZSEZ_TF_EMPL_N_PLUS_ONE
with parameters p_keydate : dats,
p_emplstatus : rsdm4nodename,
p_comp_code : rsdm4nodename,
p_level : rsdm4nodename
returns {
key mandt      :mandt;
key BASE_EMPLOYEE    :   persno ;
key BASE_EMPL_HRPOSITION : plans ;
key SEQNRX : uc_seqnr1;
BASE_EMPL_COMP_CODE : bukrs;
BASE_EMPL_STATUS : stat2   ;
BASE_EMPL_LEGAL_FIRST_NAME:   pad_vorna;
BASE_EMPL_LEGAL_LAST_NAME :   pad_nachn    ;
BASE_EMPL_GROUP_ID    :    sysid;

BASE_EMPL_HRPOSITION_DESC :rstxtmd;
BASE_EMPL_POSITION_WEIGHT  : perct ;
BASE_EMPL_ORGUNIT : orgeh ;
BASE_EMPL_COSTCENTER : kostl ;
BASE_EMPL_DEPARTMENT : rstxtsh;
BASE_EMPL_ORGUNIT_DESC : rstxtmd;

N_PLUS_ONE    :   persno ;
N_PLUS_ONE_COMP_CODE : bukrs;
N_PLUS_ONE_STATUS : stat2   ;
N_PLUS_ONE_FIRST_NAME:   pad_vorna;
N_PLUS_ONE_LAST_NAME:   pad_nachn    ;
N_PLUS_ONE_GROUP_ID    :    sysid;
N_PLUS_ONE_EMPL_HRPOSITION : plans ;
N_PLUS_ONE_HRPOSITION_DESC :rstxtmd;
N_PLUS_ONE_POSITION_WEIGHT  : perct ;
//IS_HEAD_OF : char1;
REPORTS_TO1 : orgeh ;
REPORTS_TO1_DESC : rstxtmd;
N_PLUS_ONE_COSTCENTER : kostl ;
N_PLUS_ONE_DEPARTMENT : rstxtsh;

REPORTS_TO2  : orgeh ;
REPORTS_TO3 : orgeh ;
REPORTS_TO4 : orgeh ;
REPORTS_TO5 : orgeh ;
REPORTS_TO6 : orgeh ;
REPORTS_TO7 : orgeh ;
REPORTS_TO8 : orgeh ;
REPORTS_TO9 : orgeh ;

DATETO  :   /bi0/oidateto   ;
DATEFROM    :   /bi0/oidatefrom ;
SUBTY   :   subty    ;
OBJPS   :   objps    ;
//SEQNR
INFTY   :   infotyp    ;
CH_ON   :   aedtm    ;
UNAME   :   aenam    ;
  
}
implemented by method ZCL_SEZ_INFOTYPES=>GET_N_PLUS_ONE_FROM_ORGSTRUCT;
