@EndUserText.label: 'Sezame Org Structure Current Validity'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.type: #CLIENT_DEPENDENT
//SELECT * FROM ZSEZ_TF_ORG_STRUCT_CUR();
define table function ZSEZ_TF_ORG_STRUCT_CUR
returns {
mandt      :mandt;
EMPLOYEE    :   persno ;

COMP_CODE : bukrs;
LEGAL_ENTITY : zsez_le ;
EMPLOYEE_STATUS : stat2   ;
EMPLOYEE_GROUP : persg;
LEGAL_FIRST_NAME:   pad_vorna;
LEGAL_LAST_NAME :   pad_nachn   ;

GROUP_ID    :    sysid;
IS_HEAD_OF : char1;
REPORTS_TO1 : orgeh ;
REPORTS_TO1_DESC : rstxtmd;

COSTCENTER : kostl ;
DEPARTMENT : rstxtsh;

REPORTS_TO2  : orgeh ;
REPORTS_TO3 : orgeh ;
REPORTS_TO4 : orgeh ;
REPORTS_TO5 : orgeh ;
REPORTS_TO6 : orgeh ;
REPORTS_TO7 : orgeh ;
REPORTS_TO8 : orgeh ;
REPORTS_TO9 : orgeh ;
HRPOSITION : plans ;
POSITION_WEIGHT  : perct ;
HRPOSITION_DESC :rstxtmd;

DATETO  :   /bi0/oidateto   ;
DATEFROM    :   /bi0/oidatefrom ;
SUBTY   :   subty    ;
OBJPS   :   objps    ;
//SEQNR
INFTY   :   infotyp    ;
CH_ON   :   aedtm    ;
UNAME   :   aenam    ;
}
implemented by method ZCL_SEZ_INFOTYPES=>READ_HRP1001_ORG_CUR;
