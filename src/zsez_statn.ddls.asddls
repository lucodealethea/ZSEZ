@AbapCatalog.sqlViewName: 'ZVSEZSTATN'
@AbapCatalog.compiler.compareFilter: true
@ObjectModel.representativeKey: 'HREmployeeStatus'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sezame Domain STATN Fixed Values'
@ClientHandling.algorithm: #SESSION_VARIABLE
@ObjectModel.dataCategory: #TEXT
@VDM.viewType: #BASIC
@ObjectModel.usageType.sizeCategory: #L
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.dataClass: #MIXED
define view ZSEZ_STATN 
as select from dd07t
association[0..1] to t529u as _HREmployeeStatus                        
                   on $projection.HREmployeeStatusScope = _HREmployeeStatus.statn
association[0..1] to I_Language as _Language2 on $projection.StatusLanguage = _Language.language2
 
{
      @ObjectModel.foreignKey.association: '_HREmployeeStatus'
      key domvalue_l as HREmployeeStatusScope,
      key ddtext as ScopeText,
      key _HREmployeeStatus.statv as HREmployeeStatusCode,
      @Semantics.language: true
      @ObjectModel.foreignKey.association: '_Language2'   
      key cast(_HREmployeeStatus.sprsl as spras) as StatusLanguage,  

      _HREmployeeStatus.text1    as HREmployeeStatus,
      _HREmployeeStatus

}
where domname = 'STATN' and as4local = 'A' and _HREmployeeStatus.statn = '2' and ddlanguage = 'E'
;
