@AbapCatalog.sqlViewName: 'ZVSEZ_ORGSTRUCT'
@ClientHandling.type: #CLIENT_DEPENDENT
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sezame Org Struct(By Empl) Current View'
define view ZSEZ_ORGSTRUCT_CUR as select from ZSEZ_TF_ORG_STRUCT_CUR as Z
{key Z.EMPLOYEE,
 key Z.HRPOSITION,
 Z.COMP_CODE,
 Z.EMPLOYEE_STATUS,
 Z.EMPLOYEE_GROUP,
 Z.LEGAL_FIRST_NAME,
 Z.LEGAL_LAST_NAME,
 Z.GROUP_ID,
 Z.IS_HEAD_OF,
 Z.REPORTS_TO1,
 Z.REPORTS_TO1_DESC,
 COALESCE(Z.COSTCENTER,CONCAT( Z.LEGAL_ENTITY,'_tbl_cc_tbd')) as COSTCENTER,
 Z.DEPARTMENT,
 Z.REPORTS_TO2,
 Z.REPORTS_TO3,
 Z.REPORTS_TO4,
 Z.REPORTS_TO5,
 Z.REPORTS_TO6,
 Z.REPORTS_TO7,
 Z.REPORTS_TO8,
 Z.REPORTS_TO9,

 Z.POSITION_WEIGHT,
 Z.HRPOSITION_DESC,
 Z.DATETO,
 Z.DATEFROM,
 Z.SUBTY,
 Z.OBJPS,
 Z.INFTY,
 Z.CH_ON,
 Z.UNAME
    
}
