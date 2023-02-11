@AbapCatalog.sqlViewName: 'ZVSEZ_T591S'
@ClientHandling.algorithm: #SESSION_VARIABLE
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sezame SO for Address Type'
define view ZSEZ_T591S as 
select from t591s as AT
{
key AT.subty,
AT.stext
}
where AT.infty = '0006' and AT.sprsl = 'E'
