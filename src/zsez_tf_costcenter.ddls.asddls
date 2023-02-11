@EndUserText.label: 'Sezame CostCenter From CSKS'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.type: #CLIENT_DEPENDENT
//SELECT * FROM "ZCL_SEZ_INFOTYPES=>READ_CSKS"( '20221115','TE01', 'BE74');
//SELECT * FROM "ZCL_SEZ_INFOTYPES=>READ_CSKS"( P_KEYDATE => :p_keydate, P_LANGU = :p_langu, P_CO_AREA => _p_co_area, P_COMP_CODE => p_comp_code);
define table function ZSEZ_TF_COSTCENTER
with parameters p_keydate : dats,
p_langu : spras,
p_co_area : kokrs,
p_comp_code : rsdm4nodename
returns {
mandt      :mandt;
langu : spras;
CO_AREA :   kokrs  ;
COSTCENTER  :   kostl   ;
DATETO  :   datbi   ;
DATEFROM    :   datab ;
COMP_CODE   :   bukrs    ;
OBJECT_NO : j_objnr;
CO_CCCAT : kosar;
CO_CCCAT_TEXT : ktext;
OBJ_CURR    :   waers ;
PROFIT_CTR  :   prctr   ;
PROFIT_CTR_DESC : ltext;
RESP_PERS   :   verak    ;

HNODE : khinr;
OVHLINE    :   ztps_ovhl;
OVHLINE_DESC : rstxtmd;
FUNC_AREA   :   fkber    ;
FUNC_AREA_DESC : fkbtx;
RESP_CCTR   :   fis_resp_cctr    ;
RESP_USER   :   verak_user    ;
//ABTEI  :   /BIC/OIABTEI    ;
COUNTRY : land1;
RT_LOCATIO  :   ort01   ;
COSTCENTER_DESC : kltxt;
  
}
implemented by method ZCL_SEZ_INFOTYPES=>READ_CSKS;
