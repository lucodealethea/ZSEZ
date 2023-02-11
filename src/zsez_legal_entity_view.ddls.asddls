@AbapCatalog.sqlViewName: 'ZVSEZLEGALENTITY'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View To derive Legal Entity'
define view ZSEZ_LEGAL_ENTITY_VIEW 
as select from zsez_map_le as MAP
left outer join zsez_legalentity as LE
    on MAP.legal_entity = LE.legal_entity 
{
key MAP.comp_code as Comp_Code,
key MAP.pers_area as Pers_Area,
key MAP.pers_sarea as Pers_Sarea,
key MAP.legal_entity as Legal_Entity,
LE.legal_entity_desc,
//this is to generate ABP VALUES STATEMENT
'zv_tsl' as Lastchangedat
    
}
