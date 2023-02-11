@EndUserText.label: 'Sezame HRPOSITION'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.type: #CLIENT_DEPENDENT
//SELECT * FROM "ZCL_SEZ_INFOTYPES=>READ_HRPOSITION"(P_KEYDATE => '20221226');
// COUNTER allows to detect several descriptions in other language than EN
// usually seems that position in NL are also in English
// therefore COUNTER return distinct description : 2 for some positions, because EN description  <> FR description
define table function ZSEZ_TF_HRPOSITION
with parameters p_keydate : dats
returns {
mandt      :mandt;
HRPOSITION : plans;
HRPOSITION_DESC : hr_mcstext;
HRPOSITION_TEXT : stext;

COUNTER : seqnr;  

DATETO  :   /bi0/oidateto   ;
DATEFROM    :   /bi0/oidatefrom ;
INFTY   :   infty    ;
CH_ON   :   aedtm    ;
UNAME   :   aenam    ;

}
implemented by method ZCL_SEZ_INFOTYPES=>READ_HRPOSITION;
