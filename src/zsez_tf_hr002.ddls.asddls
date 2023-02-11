@EndUserText.label: 'Sezame PA0002 (Personal Data)'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.type: #CLIENT_DEPENDENT
// PA002 made master infotype with possible employee status and possible comp_code
//SELECT *
//FROM "ZSEZ_TF_HR002"(P_KEYDATE => '20221226',P_EMPLSTATUS => '3', P_COMP_CODE => 'AE42,B066,B067,B068,B071,B078,BE74,BE76,BE95,BE97,BR02,CL65,CZ77,DE82,DE83,DE90,DE91,FRWA,GB41,IN93,IT96,RO94,SG43' );

//SELECT *
//FROM "ZCL_SEZ_INFOTYPES=>READ_HR002"(P_KEYDATE => '20221226',P_EMPLSTATUS => '3', P_COMP_CODE => 'AE42,B066,B067,B068,B071,B078,BE74,BE76,BE95,BE97,BR02,CL65,CZ77,DE82,DE83,DE90,DE91,FRWA,GB41,IN93,IT96,RO94,SG43' );
//SELECT DISTINCT PERNR, VORNA FROM PA0002 WHERE BEGDA <= '20221226' AND ENDDA >= '20221226' AND VORNA like 'Test timesheet application%'

//SELECT *
//FROM "ZCL_SEZ_INFOTYPES=>READ_HR002"('20221226','*','*' )
//WHERE EMPLOYEE <> '00010175'
//ORDER BY 4,3,2;

//SELECT *
//FROM "ZCL_SEZ_INFOTYPES=>READ_HR002"( P_KEYDATE => '20221226',P_EMPLSTATUS => '3',P_EMPLGRP => '*', P_COMP_CODE => 'AE42,B066,B067,B068,B071,B078,BE74,BE76,BE95,BE97,BR02,CL65,CZ77,DE82,DE83,DE90,DE91,FRWA,GB41,IN93,IT96,RO94,SG43' )
//WHERE EMPLOYEE <> '00010175'
//ORDER BY 4,3,2;

// new ccy_codes : FRWA,BE74,DE83,BR02,DE82,B071,B067,BE74,DE90,B066,B068,B078,DE91
// AE42,B066,B067,B068,B071,B078,BE74,BE76,BE95,BE97,BR02,CL65,CZ77,DE82,DE83,DE90,DE91,FRWA,GB41,IN93,IT96,RO94,SG43
define table function ZSEZ_TF_HR002
with parameters
p_keydate : dats,
p_emplstatus : rsdm4nodename,
p_emplgrp : rsdm4nodename,
p_comp_code : rsdm4nodename
returns {
mandt      :mandt;
EMPLOYEE    :   persno ;

COMP_CODE : bukrs;
LEGAL_ENTITY : zsez_le;
EMPLOYEE_STATUS : stat2   ;
EMPLOYEE_GROUP : persg;

LEGAL_FIRST_NAME:   pad_vorna;
LEGAL_LAST_NAME :   pad_nachn   ;
INITS : inits;
BIRTH_NAME   :   pad_name2   ;
//SECOND_NAME : PAD_NACH2;
//COMPLETE_NAME : PAD_CNAME;
TITEL : titel;
NICK_NAME : rufnm ;
MIDDLE_NAME : pad_midnm;
// Mr. Mrs. etc  
ANRED : anred;
GENDER : hrpad_gender;

COUNTRY_OF_BIRTH_SAP : gblnd;
COUNTRY_OF_BIRTH   : landx50;
COUNTRY_OF_BIRTH_ISO  : intca3 ;
PLACE_OF_BIRTH : pad_gbort;
REGION_OF_BIRTH : gbdep;
//NATIO, NATI2, NATI3
NATION_SAP  :   land1;
NATIONALITY_ISO : intca3 ;
NATIONALITY : landx50;
NATION_SAP2  :   land1;
SECOND_NATIONALITY_ISO  : intca3 ;
SECOND_NATIONALITY : landx50;

NATION_SAP3  :   land1;
//SPRSL
BUSINESS_COMMUNICAT_LANGUAGE   :  pad_spras    ;
BUSINESS_COM_LANGUAGE_TXT   :  sptxt    ;
RELIGION_KEY : konfe;

MARITAL_STATUS_KEY :   famst   ;
DATE_OF_MARITAL_STATUS :   dats    ;
//NBR_OF_CHILDREN
FP_TRCHILD  :    anzkd ;
//GBDAT
DATEBIRTH   :   dats    ;
DISABILITY : bvwmv;

ACTIONTYPE  :   massn   ;
ACTIONTYPE_DESC :    rstxtmd    ;
ACTIONREAS  :   massg   ;
ACTIONREAS_DESC :    rstxtmd    ;
 
DATETO    :   dats   ;
DATEFROM  :   dats ;
SUBTY   :   subty    ;
OBJPS   :   objps    ;
SEQNR   :   seqnr    ;
INFTY   :   infty    ;
CH_ON   :   aedtm    ;
UNAME   :   aenam    ;

}
implemented by method ZCL_SEZ_INFOTYPES=>READ_HR002;
