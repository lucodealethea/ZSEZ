@AbapCatalog.sqlViewName: 'ZVSEZ_HR105_GDFS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sezame InfoType 105 with GDFS and 0001'
define view ZSEZ_HR105_GDFS as 
select from ZSEZ_TF_HR105_GDFS( p_keydate: $session.system_date, p_emplstatus: '*', p_comp_code: '*') as GDFS
{
key GDFS.EMPLOYEE,
key GDFS.COMP_CODE,
key GDFS.EMPLOYEE_STATUS,
GDFS.LEGAL_FIRST_NAME,
GDFS.LEGAL_LAST_NAME,
GDFS.USRID,
GDFS.USRID_LONG,
GDFS.IS_REALLY_SYS_USR,
GDFS.DATETO,
GDFS.DATEFROM,
GDFS.SUBTY,
GDFS.OBJPS,
GDFS.SEQNR,
GDFS.INFTY,
GDFS.CH_ON,
GDFS.UNAME    
}
