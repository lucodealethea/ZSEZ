@AbapCatalog.sqlViewName: 'ZVSEZSTATN_E'
@EndUserText.label: 'Employee Status'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view ZSEZ_STATN_E as select from ZSEZ_STATN as S
{
key S.HREmployeeStatusCode

,S.HREmployeeStatus
   
}
where S.StatusLanguage = $session.system_language and S.HREmployeeStatusScope = '2'
