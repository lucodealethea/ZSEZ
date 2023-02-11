@AbapCatalog.sqlViewName: 'ZVCOSTCCTR_CUR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Current Valid CostCenter from CSKS'
define view ZSEZ_COSTCENTER_BY_CCY 
as select from ZSEZ_TF_COSTCENTER
(p_keydate: $session.system_date, p_langu: $session.system_language, p_co_area: 'TE01', p_comp_code: '*') as C
{
key C.langu,
key C.CO_AREA,
key C.COSTCENTER,
key C.DATETO,
C.DATEFROM,
C.COMP_CODE,
C.OBJECT_NO,
C.CO_CCCAT,
C.CO_CCCAT_TEXT,
C.OBJ_CURR,
C.PROFIT_CTR,
C.PROFIT_CTR_DESC,
C.RESP_PERS,
C.HNODE,
C.OVHLINE,
C.OVHLINE_DESC,
C.FUNC_AREA,
C.FUNC_AREA_DESC,
C.RESP_CCTR,
C.RESP_USER,
C.COUNTRY,
C.RT_LOCATIO,
C.COSTCENTER_DESC    
}
