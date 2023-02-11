@AbapCatalog.sqlViewName: 'ZVSEZ_EMPLOYEEBP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sezame EMPLOYEE By BP Role'
// change outer joins  P_PDRELATION when eventually data is cleansed, or select on bp_role.rltyp <> ''
define view ZSEZ_EMPLOYEE_BP
  as select distinct from but000       as bp
    left outer join       P_PDRELATION as relt    on  bp.partner                 = relt.RelatedObjectID
                                                  and bp.client                  = relt.mandt
                                                  and relt.ObjectType            = 'CP' /* CP - Central person */
                                                  and relt.RelationShipDirection = 'B'
                                                  and relt.ReleationShip         = '207' /* 207    Is identical to */
                                                  and relt.RelatedObjectType     = 'BP'
                                                  and bp.client = $session.client
  //and relt.StartDate <= TodayDate.TodayDate
  //and relt.EndDate >= TodayDate.TodayDate
    left outer join       but0id       as bpexid  on  bp.partner = bpexid.partner
                                                  and bp.client  = bpexid.client
                                                  and (
                                                     bpexid.type = 'HCM001' or /* HCM001 - Employee ID    */
                                                     bpexid.type = 'HCM030' or /* HCM030 - Service Agent  */
                                                     bpexid.type = 'HCM031' ) /* HCM031 - Freelancer     */
                                                     
//but100 valid_from and valid_to are DEC ...
    left outer join /BOFU/CV_BPRoleValidity as bp_role on  bp_role.partner = bp.partner
                                                  and bp_role.mandt   = bp.client
                                                  and ( bp_role.rltyp = 'BUP003'    or /* BUP003 - Employee */
                                                     bp_role.rltyp    = 'BBP005'    or /* BBP005 - Service Agent */
                                                     bp_role.rltyp    = 'BBP010'  or   /* BBP010 - Freelancer */
                                                     bp_role.rltyp    = 'FLVN00' )  /* FLVN00 - Supplier (Fin.Accounting) */
                                                  and bp.type         = '1'
                                                  and bp_role.valid_to  >= $session.system_date
                                                  and bp_role.valid_from <= $session.system_date
 
    left outer join       pa0315       as HR315   on  bpexid.idnumber = HR315.pernr
                                                  and HR315.endda     >= $session.system_date
                                                  and HR315.begda     <= $session.system_date
                                                  and HR315.mandt      = bp.client
    left outer join       a4ai         as ATC     on  bpexid.idnumber = ATC.pernr
                                                  and ATC.mandt       = bp.client
                                                  and ATC.kappl       = 'CA'
                                                  and ATC.kschl       = 'CACT'
                                                  and ATC.datbi       >= $session.system_date
    left outer join       csla         as AT      on  HR315.lstar = AT.lstar
                                                  and AT.mandt    = bp.client
                                                  and AT.datbi    >= $session.system_date
                                                  and AT.datab    <= $session.system_date
                                                  and AT.kokrs    = 'TE01'
    left outer join       ZSEZ_HR105_GDFS      as HR105   on  HR105.EMPLOYEE = bpexid.idnumber
                                                  and HR105.mandt = bp.client
    left outer join       ZSEZ_HR9007       as HR9007  on  HR9007.EMPLOYEE = bpexid.idnumber
                                                  and HR9007.mandt  = bp.client
  //and HR9007.subty = '0001'
    left outer join       pa0001       as HR0001  on  HR0001.pernr = bpexid.idnumber
                                                  and HR0001.endda >= $session.system_date
                                                  and HR0001.begda <= $session.system_date
                                                  and HR0001.mandt  = bp.client
  //and HR0001.subty = '0001'
    left outer join       pa0016       as HR0016  on  HR0016.pernr = bpexid.idnumber
                                                  and HR0016.mandt  = bp.client
                                                  and HR0016.endda >= $session.system_date
                                                  and HR0016.begda <= $session.system_date
    left outer join       pa0008       as HR0008  on  HR0008.pernr = bpexid.idnumber
                                                  and HR0008.mandt  = bp.client
                                                  and HR0008.endda >= $session.system_date
                                                  and HR0008.begda <= $session.system_date
                                                  
    left outer join ZSEZ_ORGSTRUCT_CUR as OM on OM.EMPLOYEE = bpexid.idnumber                                                 
    left outer join t503t as SGT on HR0001.persk = SGT.persk and SGT.sprsl = 'E'
    left outer join t501t as GT on HR0001.persg = GT.persg and GT.sprsl = 'E'
{
  key relt.ObjectID   as PersonnelNumber,
  key bp.persnumber   as Person,
  key bpexid.idnumber as Employee,
  key bp.partner      as EmployeeInternalID,
  key relt.EndDate    as ValidityEndDate,
      relt.StartDate  as ValidityStartDate,
      OM.EMPLOYEE_STATUS as EmployeeStatus,
      bp_role.rltyp           as BusinessPartnerRole,
      HR0016.cttyp    as ContractType,
      OM.REPORTS_TO1 as OrgUnit,
      OM.REPORTS_TO1_DESC as OrgUnitDesc,
      OM.DEPARTMENT as Department,
      OM.IS_HEAD_OF as Is_Line_Manager,
      HR0001.kostl    as MastCctr,
      HR0001.werks    as PersonelArea,
      HR0001.btrtl    as PersonelSubArea,
      HR0001.persg    as PersonelGroup,
      GT.ptext        as PersonelGroupName,
      HR0001.persk    as PersonelSubGroup,
      SGT.ptext       as PersonelSubGroupName,
      OM.HRPOSITION   as HrPosition,
      OM.HRPOSITION_DESC as HrPositionDesc,
            OM.POSITION_WEIGHT as PositionWeight,
      HR0001.abkrs    as PayrolArea,
      HR0008.trfar    as PayScaleType,
      HR0008.trfgb    as PayScaleArea,

      HR9007.QUALIF   as Qualification,
      HR9007.GRADE    as Grade,
      HR105.USRID     as Gdf_SUEZ_ID,
      HR315.kostl     as CostCenter,

      HR315.lstar     as ActivityType,
      AT.vksta        as GlAccount,


      bp.name1_text   as EmployeeFullName,
      bp.partner_guid as BusinessPartnerUUID,
      bp.mc_name2     as BusinessPartnerName,

      bp.crusr as CreatedByUser,
      bp.crdat as CreationDate,
      bp.crtim as CreationTime,
      bp.chusr as LastChangedByUser,
      bp.chdat as LastChangeDate,
      bp.chtim as LastChangeTime,
      bp.augrp as AuthorizationGroup,
      bp.xpcpt as IsBusinessPurposeCompleted

      
}
