CLASS zcl_sez_amdp_employee DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb .

  CLASS-METHODS GET_EMPLOYEE_DATA
  FOR TABLE FUNCTION ZSEZ_TF_EMPLOYEE.

  CLASS-METHODS GET_EMPLOYEE_DATA_A
  FOR TABLE FUNCTION ZSEZ_TF_EMPLOYEE_A.

  CLASS-METHODS GET_COSTCENTER
  FOR TABLE FUNCTION ZSEZ_TF_COSTCENTER2.

  CLASS-METHODS GET_EMPLOYEE_NID
  FOR TABLE FUNCTION ZSEZ_TF_EMPL_NID.

  CLASS-METHODS GET_EMPLOYEE_EMC
  FOR TABLE FUNCTION ZSEZ_TF_EMPL_EMC.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sez_amdp_employee IMPLEMENTATION.

METHOD GET_EMPLOYEE_DATA_A
BY DATABASE FUNCTION FOR HDB
  LANGUAGE SQLSCRIPT
  OPTIONS READ-ONLY
  USING ZSEZ_TF_EMPLOYEE ZSEZ_TF_PARAMS.
  DECLARE bup_emplstatus varchar (  1333 );
  DECLARE bup_emplgrp varchar (  1333 );
  DECLARE bup_comp_code varchar (  1333 );
  DECLARE bup_anssa varchar (  1333 );
cte_param=
SELECT *
FROM "ZSEZ_TF_PARAMS"( :p_keydate, :p_emplstatus, :p_emplgrp, :p_comp_code, :p_anssa);
p_keydate := ''; p_emplstatus := ''; p_emplgrp := ''; p_comp_code := ''; p_anssa := ''; bup_emplstatus := ''; bup_comp_code := ''; bup_anssa := '';
SELECT lv_keydate into p_keydate from :cte_param;
SELECT lv_emplstatus into p_emplstatus from :cte_param;
SELECT lv_emplgrp into p_emplgrp from :cte_param;
SELECT lv_anssa into p_anssa from :cte_param;
SELECT lv_comp_code into p_comp_code from :cte_param;
SELECT lv_bup_emplstatus into bup_emplstatus from :cte_param;
SELECT lv_bup_emplgrp into bup_emplgrp from :cte_param;
SELECT lv_bup_comp_code into bup_comp_code from :cte_param;
SELECT lv_bup_anssa into bup_anssa from :cte_param;

cte_employee=
SELECT *
FROM "ZSEZ_TF_EMPLOYEE"(P_KEYDATE => :p_keydate,P_EMPLSTATUS => :p_emplstatus,P_EMPLGRP => :p_emplgrp, P_COMP_CODE => :p_comp_code, P_ANSSA => :p_anssa );
RETURN
SELECT
mandt
,LB_SAP_EMPLOYEE_ID_RB
,GROUP_ID
,CONVERGENCE_ID
,LEGAL_FIRST_NAME
,NICK_NAME
,OTHER_FIRST_NAME
,LEGAL_LAST_NAME
,PREFERRED_LAST_NAME
,BIRTH_NAME
,MIDDLE_NAME
,SUFFIX
,NATIONALITY
,SECOND_NATIONALITY
,GENDER
,MARITAL_STATUS
,DATE_OF_MARITAL_STATUS
,BUSINESS_COMMUNICAT_LANGUAGE
,DISABILITY
,DATE_OF_BIRTH
,COUNTRY_OF_BIRTH
,REGION_OF_BIRTH
,PLACE_OF_BIRTH
,' ' as PI_NL_01
,' ' as PI_PE_01
,' ' as PI_PE_02
,' ' as PI_PE_03
,' ' as PI_PE_04
,' ' as PI_PE_05
,' ' as PI_CA_01
,' ' as PI_CA_02
,' ' as PI_CA_03
,' ' as PI_CA_04
,' ' as PI_CA_05
,' ' as PI_CA_06
,' ' as PI_CA_07
,' ' as PI_CA_08
,' ' as PI_CA_09
,' ' as PI_US_01
,' ' as PI_US_02
,' ' as PI_US_03
,' ' as PI_US_04
,' ' as PI_US_05
,' ' as PI_US_06
,' ' as PI_US_07
,' ' as PI_US_08
,' ' as PI_US_09
,' ' as PI_US_10
,' ' as PI_US_11
,' ' as PI_US_12
,' ' as PI_UK_01
,' ' as PI_UK_02
,' ' as PI_UK_03
,' ' as PI_UK_04
,' ' as PI_UK_05
,' ' as PI_UK_06
,' ' as PI_UA_01
,' ' as PI_UA_02
,' ' as PI_UA_03
,' ' as PI_UA_04
,' ' as PI_UA_05
,' ' as PI_UA_06
,' ' as PI_UA_07
,' ' as PI_RO_01
,' ' as PI_RO_02
,' ' as PI_RO_03
,' ' as PI_RO_04
,' ' as PI_RO_05
,' ' as PI_RO_06
,' ' as PI_RO_07
,' ' as PI_PO_01
,' ' as PI_IN_01
,' ' as PI_IN_02
,' ' as PI_IN_03
,' ' as PI_IN_04
,' ' as PI_IN_05
,' ' as PI_IN_06
,' ' as PI_IN_07
,' ' as PI_IN_08
,' ' as PI_IN_09
,' ' as PI_IN_10
,' ' as PI_IN_11
,' ' as PI_IN_12
,' ' as PI_IN_13
,' ' as PI_SG_01
,' ' as PI_SG_02
,' ' as PI_SG_03
,' ' as PI_SG_04
,' ' as PI_SG_05
,' ' as PI_SG_06
,' ' as PI_SG_07
,' ' as PI_SG_08
,' ' as PI_SG_09
,' ' as PI_SG_10
,' ' as PI_SG_11
,' ' as PI_SG_12
,' ' as PI_SG_13
,' ' as PI_SG_14
,' ' as PI_SG_15
,' ' as PI_SG_16
,' ' as PI_BR_01
,' ' as PI_BR_02
,' ' as PI_BR_03
,' ' as PI_BR_04
,' ' as PI_BR_05
,' ' as PI_BR_06
,' ' as PI_BR_07
,' ' as PI_BR_08
,' ' as PI_BR_09
,' ' as PI_BR_10
,' ' as PI_BR_11
,' ' as PI_BR_12
,' ' as PI_BR_13
,' ' as PI_BR_14
,' ' as PI_BR_15
,' ' as PI_BR_16
,' ' as PI_BR_17
,' ' as PI_BR_18
,' ' as PI_AU_01
,' ' as PI_IG_01
,OFFICIAL_LANGUAGE
,' ' as PI_FR_01
,' ' as PI_FR_02
,' ' as PI_IT_01
,' ' as PI_IT_02
,' ' as PI_NC_01
,' ' as PI_NC_02
,' ' as PI_NC_03
,' ' as PI_PF_01
,' ' as PI_PF_02
,' ' as PI_PF_03
,' ' as PI_MC_01
,' ' as PI_MC_02
,' ' as PI_MC_03
,' ' as PI_WF_01
,' ' as PI_WF_02
,' ' as PI_WF_03
,' ' as PI_DE_01
,' ' as PI_DE_02
,' ' as PI_DE_03
,' ' as PI_VU_01
,' ' as PI_VU_02
,' ' as PI_VU_03
,' ' as PI_ES_01
,' ' as PI_ES_02
,' ' as PI_ES_03
,' ' as PI_ES_04
,' ' as PI_ES_05
,' ' as PI_CL_01
,' ' as PI_CL_02
,' ' as PI_CL_03
,' ' as PI_CL_04
,' ' as PI_CL_05
,' ' as PI_CL_06
,' ' as PI_SK_01
,' ' as PI_SK_02
,' ' as PI_SK_03
,' ' as PI_SK_04
,' ' as PI_SK_05
,' ' as PI_SK_06
,' ' as PI_MX_01
,' ' as PI_MX_02
,' ' as PI_MX_03
,' ' as PI_MX_04
,' ' as PI_MX_05
,' ' as PI_MX_06
,' ' as PI_PT_01
,' ' as PI_PT_02
,' ' as PI_PT_03
,' ' as PI_PT_04
,' ' as PI_PT_05
,' ' as PI_PT_06
,' ' as PI_PT_07
,' ' as PI_PT_08
,MOST_RECENT_HIRE_DATE
,GROUP_START_DATE
,SENORITY_DATE
,START_DATE_BEFORE_ACQUISITION
,' ' as COMMENTS
,LB_POSITION_ID_RB
,LB_POSITION_RB
,LB_POSITION_WEIGHT_RB
,LB_POSITION_TITLE_RB
,LB_LEGAL_ENTITYNAME_RB
,LEGAL_ENTITY
,LB_COMP_CODE_RB
,LB_DEPARTMENT_CODE_RB
,DEPARTMENT
,SECOND_ORG_AXIS
,SEZAME_COST_CENTER_ID
,LB_WORK_LOCATION_NAME_RB
,WORK_LOCATION
,FULL_TIME_REMOTE
,LINE_MANAGER
,ENGIE_JOB
,LOCAL_JOB_NAME
,POSITION_HAY_LEVEL
,PERSONAL_HAY_LEVEL
,BAREME
,LABOR_STATUS
,EMPLOYEE_CLASS
,LB_CONTRACT_TYPE_16_RB
,CONTRACT_TYPE
,CONTRACT_END_DATE
,PROBATIONARY_PERIOD_END_DATE
,EMPLOYMENT_TYPE
,STANDARD_WEEKLY_HOURS
,LB_GLOBAL_EMPLOYEE_LEVEL_RB
,GLOBAL_EMPLOYEE_LEVEL
,TIME_PROFILE
,' ' as JI_CA_01
,' ' as JI_CA_02
,' ' as JI_CA_03
,' ' as JI_CA_04
,' ' as JI_US_01
,' ' as JI_US_02
,' ' as JI_US_03
,' ' as JI_US_04
,' ' as JI_US_05
,' ' as JI_US_06
,' ' as JI_US_07
,' ' as JI_AU_01
,' ' as JI_AU_02
,' ' as JI_AU_03
,' ' as JI_AU_04
,' ' as JI_AU_05
,' ' as JI_MX_01
,' ' as JI_MX_02
,' ' as JI_MX_03
,' ' as JI_MX_04
,' ' as JI_MX_05
,' ' as JI_MX_06
,' ' as JI_IT_01
,' ' as JI_IT_02
,' ' as JI_IT_03
,' ' as JI_RO_01
,' ' as JI_RO_02
,' ' as JI_RO_03
,PERS_AREA
,LB_PERS_AREA_DESC_RB
,PERS_SAREA
,LB_PERS_SAREA_DESC_RB
,LB_EMPLOYEE_GROUP_RB
,LB_EMPLOYEE_SGROUP_RB
,DEFINITE_WORK
,GROUP_OF_INTEREST
,LB_ACTIONREAS_RB
,LB_ACTIONTYPE_RB
,LB_ACTIONTYPE_DESC_RB
,LOCAL_EVENT_REASON
,' ' as JI_UK_01
,' ' as JI_UK_02
,' ' as JI_UK_03
,' ' as JI_UK_04
,' ' as JI_UK_05
,' ' as JI_UK_06
,' ' as JI_UK_07
,' ' as JI_UK_08
,' ' as JI_MC_01
,' ' as JI_MC_02
,' ' as JI_MC_03
,' ' as JI_MC_04
,' ' as JI_MC_05
,' ' as JI_MC_06
,' ' as JI_MC_07
,' ' as JI_MC_08
,' ' as JI_DE_01
,' ' as JI_DE_02
,' ' as JI_DE_03
,' ' as JI_DE_04
,' ' as JI_DE_05
,' ' as JI_DE_06
,' ' as JI_DE_07
,' ' as JI_DE_08
,' ' as JI_FR_01
,' ' as JI_FR_02
,' ' as JI_FR_03
,' ' as JI_FR_04
,' ' as JI_FR_05
,' ' as JI_FR_06
,' ' as JI_FR_07
,' ' as JI_FR_08
,' ' as JI_FR_09
,' ' as JI_FR_10
,' ' as JI_FR_11
,' ' as JI_FR_12
,' ' as JI_FR_13
,' ' as JI_FR_14
,' ' as JI_WF_01
,' ' as JI_NC_01
,' ' as JI_IN_01
,' ' as JI_IN_02
,' ' as JI_IN_03
,' ' as JI_PT_01
,' ' as JI_PT_02
,' ' as JI_PF_01
,' ' as JI_PF_02
,' ' as JI_PF_03
,' ' as JI_PE_01
,' ' as JI_SP_01
,' ' as JI_VU_01
,' ' as JI_CL_01
,' ' as JI_CL_02
,' ' as JI_CL_03
,' ' as JI_CL_04
,' ' as JI_CL_05
,' ' as JI_CL_06
,' ' as JI_CL_07
,' ' as JI_CL_08
,' ' as JI_CL_09
,' ' as JI_CL_10
,' ' as JI_CL_11
,' ' as JI_CL_12
,' ' as JI_CL_13
,' ' as JI_SG_01
,' ' as JI_SG_02
,' ' as JI_SG_03
,' ' as JI_SG_04
,' ' as JI_SG_05
,' ' as JI_SG_06
,' ' as JI_SG_07
,' ' as JI_SG_08
,' ' as JI_SG_09
,' ' as JI_SG_10
,' ' as JI_SG_11
,' ' as JI_SG_12
,' ' as JI_SG_13
,' ' as JI_SG_14
,' ' as JI_SG_15
,' ' as JI_SG_16
,' ' as JI_BR_01
,' ' as JI_BR_02
,' ' as JI_BR_03
,' ' as JI_BR_04
,' ' as JI_BR_05
,' ' as JI_BR_06
,' ' as JI_BR_07
,' ' as JI_BR_08
,' ' as JI_BR_09
,' ' as JI_BR_10
,' ' as JI_BR_11
,' ' as JI_BR_12
,' ' as JI_BR_13
,' ' as JI_BR_14
,' ' as JI_BR_15
,' ' as JI_BR_16
,' ' as JI_BR_17
,' ' as JI_BR_18
,' ' as PAY_GROUP
,PAYROLL_ID
,' ' as HOURLY_RATE
,' ' as CI_US_01
,' ' as CI_US_02
,' ' as CI_US_03
,' ' as CI_US_04
,' ' as CI_US_05
,' ' as CI_US_06
,' ' as CI_US_07
,' ' as CI_US_08
,' ' as CI_US_09
,' ' as CI_UAE_01
,' ' as CI_UAE_02
,' ' as CI_UAE_03
,' ' as CI_UAE_04
,' ' as CI_UAE_05
,' ' as CI_UAE_06
,' ' as CI_MX_01
,' ' as CI_MX_02
,' ' as CI_MX_03
,' ' as CI_MX_04
,' ' as CI_MX_05
,' ' as CI_MX_06
,' ' as CI_AU_01
,' ' as CI_AU_02
,' ' as CI_AU_03
,' ' as CI_AU_04
,' ' as CI_UK_01
,' ' as CI_UK_02
,' ' as CI_DE_01
,' ' as CI_DE_02
,' ' as CI_DE_03
,' ' as CI_DE_04
,' ' as CI_CA_01
,' ' as CI_CA_02
,' ' as CI_CA_03
,' ' as CI_CA_04
,' ' as CI_CA_05
,' ' as CI_CA_06
,' ' as CI_CA_07
,' ' as CI_CA_08
,' ' as CI_CA_09
,' ' as CI_UAE_21
,' ' as CI_MC_01
,' ' as CI_FR_01
,' ' as CI_FR_02
,SMART_CODE
,ENTRY_DATE
from :CTE_EMPLOYEE
;
ENDMETHOD. "GET_EMPLOYEE_DATA_A

METHOD GET_EMPLOYEE_DATA
BY DATABASE FUNCTION FOR HDB
  LANGUAGE SQLSCRIPT
  OPTIONS READ-ONLY
  USING
ZSEZ_TF_HR002
*ZSEZ_TF_HR9351
ZSEZ_TF_HR001
ZSEZ_TF_HR105
ZSEZ_TF_HR105_GDFS
ZSEZ_TF_HR008
ZSEZ_TF_HR041
ZSEZ_TF_HR016
ZSEZ_TF_HR007
ZSEZ_TF_HR032
ZSEZ_TF_HR315
*ZSEZ_TF_HR006
*ZSEZ_TF_HR101 DISABILITY included in HR002 as BVWMV
ZSEZ_TF_HR9007
ZSEZ_TF_EMPL_N_PLUS_ONE
ZTF_SPLIT_STRG
ZSEZ_TF_PARAMS.
  DECLARE bup_emplstatus varchar (  1333 );
  DECLARE bup_emplgrp varchar (  1333 );
  DECLARE bup_comp_code varchar (  1333 );
  DECLARE bup_anssa varchar (  1333 );
cte_param=
SELECT *
FROM "ZSEZ_TF_PARAMS"( :p_keydate, :p_emplstatus, :p_emplgrp, :p_comp_code, :p_anssa);
p_keydate := ''; p_emplstatus := ''; p_emplgrp := ''; p_comp_code := ''; p_anssa := ''; bup_emplstatus := ''; bup_comp_code := ''; bup_anssa := '';
SELECT lv_keydate into p_keydate from :cte_param;
SELECT lv_emplstatus into p_emplstatus from :cte_param;
SELECT lv_emplgrp into p_emplgrp from :cte_param;
SELECT lv_anssa into p_anssa from :cte_param;
SELECT lv_comp_code into p_comp_code from :cte_param;
SELECT lv_bup_emplstatus into bup_emplstatus from :cte_param;
SELECT lv_bup_emplgrp into bup_emplgrp from :cte_param;
SELECT lv_bup_comp_code into bup_comp_code from :cte_param;
SELECT lv_bup_anssa into bup_anssa from :cte_param;

-- only ZSEZ_TF_EMPLOYEE and ZSEZ_TF_EMPLOYEE_A filter on :p_emplgrp
cte_hr002=
SELECT * FROM "ZSEZ_TF_HR002"(P_KEYDATE => :p_keydate,P_EMPLSTATUS => :p_emplstatus, P_EMPLGRP => '*', P_COMP_CODE => :p_comp_code);
cte_hr001=
SELECT * FROM "ZSEZ_TF_HR001"(P_KEYDATE => :p_keydate,P_EMPLSTATUS => :p_emplstatus, P_EMPLGRP => '*', P_COMP_CODE => :p_comp_code);
*cte_hr9351=
*SELECT * FROM "ZSEZ_TF_HR9351"(P_KEYDATE => :p_keydate,P_EMPLSTATUS => :p_emplstatus, P_EMPLGRP => '*', P_COMP_CODE => :p_comp_code);
cte_hr105_lpid=
SELECT * FROM "ZSEZ_TF_HR105"(P_KEYDATE => :p_keydate,P_EMPLSTATUS => :p_emplstatus, P_EMPLGRP => '*', P_COMP_CODE => 'FRWA', P_SUBTY => 'LPID');
cte_hr105_gdfs=
SELECT * FROM "ZSEZ_TF_HR105_GDFS"(P_KEYDATE => :p_keydate,P_EMPLSTATUS => :p_emplstatus, P_EMPLGRP => '*', P_COMP_CODE => :p_comp_code);
cte_hr008=
SELECT * FROM "ZSEZ_TF_HR008"(P_KEYDATE => :p_keydate,P_EMPLSTATUS => :p_emplstatus, P_EMPLGRP => '*', P_COMP_CODE => :p_comp_code);
cte_hr041=
SELECT * FROM "ZSEZ_TF_HR041"(P_KEYDATE => :p_keydate,P_EMPLSTATUS => :p_emplstatus, P_EMPLGRP => '*', P_COMP_CODE => :p_comp_code);
cte_hr016=
SELECT * FROM "ZSEZ_TF_HR016"(P_KEYDATE => :p_keydate,P_EMPLSTATUS => :p_emplstatus, P_EMPLGRP => '*',  P_COMP_CODE => :p_comp_code);
cte_hr007=
SELECT * FROM "ZSEZ_TF_HR007"(P_KEYDATE => :p_keydate,P_EMPLSTATUS => :p_emplstatus, P_EMPLGRP => '*', P_COMP_CODE => :p_comp_code);
cte_hr032=
SELECT * FROM "ZSEZ_TF_HR032"(P_KEYDATE => :p_keydate,P_EMPLSTATUS => :p_emplstatus, P_EMPLGRP => '*', P_COMP_CODE => :p_comp_code);
cte_hr315=
SELECT * FROM "ZSEZ_TF_HR315"(P_KEYDATE => :p_keydate,P_EMPLSTATUS => :p_emplstatus, P_EMPLGRP => '*', P_COMP_CODE => :p_comp_code);
*cte_hr006=
*SELECT * FROM "ZSEZ_TF_HR006"(P_KEYDATE => :p_keydate,P_EMPLSTATUS => '*', P_COMP_CODE => '*', P_ANSSA => '*' );
cte_hr9007=
SELECT * FROM "ZSEZ_TF_HR9007"(P_KEYDATE => :p_keydate,P_EMPLSTATUS => :p_emplstatus, P_EMPLGRP => '*', P_COMP_CODE => :p_comp_code);
cte_n_plus_one=
SELECT * FROM "ZSEZ_TF_EMPL_N_PLUS_ONE" (P_KEYDATE => :p_keydate, P_EMPLSTATUS => :p_emplstatus, P_COMP_CODE => :p_comp_code, P_LEVEL => '1');
cte_temp=
SELECT * FROM :cte_hr9007;

cte_employee_prep=
SELECT
HR002.MANDT
,HR002.EMPLOYEE AS SAP_EMPLOYEE_ID
,HR002.EMPLOYEE_STATUS
,COALESCE(HR105G.USRID,'TE'||HR002.EMPLOYEE) AS GROUP_ID
,HR105LPID.USRID AS CONVERGENCE_ID
,HR002.LEGAL_FIRST_NAME
,HR002.NICK_NAME AS NICK_NAME
,'' AS OTHER_FIRST_NAME
,HR002.LEGAL_LAST_NAME
,HR002.LEGAL_LAST_NAME AS PREFERRED_LAST_NAME
,HR002.BIRTH_NAME
,'' AS MIDDLE_NAME
,'' AS SUFFIX
,HR002.NATIONALITY AS NATIONALITY
,HR002.SECOND_NATIONALITY AS SECOND_NATIONALITY
,CASE HR002.GENDER WHEN '1' THEN 'Male' WHEN '2' THEN 'Female' WHEN '3' THEN 'Transgender' ELSE 'Unknown' END AS GENDER
,CASE HR002.MARITAL_STATUS_KEY WHEN '0' THEN 'Single'
  WHEN '1' THEN 'Married' WHEN '2' THEN 'Widowed' WHEN '3' THEN 'Divorced'
  WHEN '4' THEN 'Cohabitation without Contract' WHEN '5' THEN 'Unknown' WHEN '6' THEN 'Unknown'
  WHEN '9' THEN 'Legal Cohabitation'
  ELSE 'Unknown'
  END AS MARITAL_STATUS
,HR002.DATE_OF_MARITAL_STATUS
,HR002.BUSINESS_COM_LANGUAGE_TXT AS BUSINESS_COMMUNICAT_LANGUAGE
,COALESCE(HR002.DISABILITY,'N') AS DISABILITY
,HR002.DATEBIRTH AS DATE_OF_BIRTH
,HR002.COUNTRY_OF_BIRTH
,HR002.COUNTRY_OF_BIRTH_ISO
,HR002.PLACE_OF_BIRTH
,HR002.REGION_OF_BIRTH
,CASE WHEN (SUBSTRING(HR001.COMP_CODE,1,2) = 'BE') THEN
   CASE
   WHEN HR002.BUSINESS_COMMUNICAT_LANGUAGE = 'F'
   OR HR002.BUSINESS_COMMUNICAT_LANGUAGE = 'N'
   OR HR002.BUSINESS_COMMUNICAT_LANGUAGE = 'D' THEN HR002.BUSINESS_COM_LANGUAGE_TXT
   ELSE '???' END
  ELSE HR002.BUSINESS_COM_LANGUAGE_TXT END AS OFFICIAL_LANGUAGE
*,CASE HR351.PRINTING_LANGUAGE WHEN 'F' THEN 'French' WHEN 'N' THEN 'Dutch' ELSE '' END AS PRINTING_LANGUAGE
,HR041.DAT01 AS MOST_RECENT_HIRE_DATE
,REPLACE(HR041.DAT02,'00000000',HR041.DAT01) AS GROUP_START_DATE
,HR016.KONDT AS SENORITY_DATE
,CASE WHEN HR041.DAT02 <> '' AND HR041.DAT01 <> '' THEN CASE
  WHEN HR041.DAT01 <= HR041.DAT02 THEN 'MOST_RECENT_HIRE_DATE'
  WHEN HR041.DAT01 > HR041.DAT02 THEN 'GROUP_START_DATE'
  END
  ELSE 'N/A'
END AS PLACEHOLDER_START_DATE
,HR001.HRPOSITION AS LB_POSITION_ID_RB
,'['||NPLUS.BASE_EMPL_DEPARTMENT||'] '||NPLUS.BASE_EMPL_HRPOSITION_DESC||' ['||NPLUS.BASE_EMPL_HRPOSITION||']' AS LB_POSITION_RB
,NPLUS.BASE_EMPL_POSITION_WEIGHT AS LB_POSITION_WEIGHT_RB
,NPLUS.BASE_EMPL_HRPOSITION_DESC AS LB_POSITION_TITLE_RB

,LTRIM(HR001.LEGAL_ENTITY_DESC ,' ') AS LB_LEGAL_ENTITYNAME_RB
,HR001.LEGAL_ENTITY AS LEGAL_ENTITY
,HR001.COMP_CODE AS COMP_CODE
,HR001.PERS_AREA
,HR001.PERS_SAREA
,HR001.PERS_AREA_DESC
,HR001.PERS_SAREA_DESC

,NPLUS.BASE_EMPL_DEPARTMENT AS DEPARTMENT_CODE
--,HR001.DEPARTMENT
,'ES000' AS BUSINESS_UNIT
,COALESCE(HR315.KOSTL,HR001.LEGAL_ENTITY||'_tbl_cc_tbd') AS SEZAME_COST_CENTER_ID
,NPLUS.N_PLUS_ONE_GROUP_ID AS LINE_MANAGER
,HR001.JOB AS JOB_ID
,RTRIM(HR008.PAYSCALEGR,' ')||HR008.PAYSCALELV AS PERSONAL_HAY_LEVEL
, HR9007.BAREME as BAREME

,HR001.EMPLGROUP
,HR001.EMPLSGROUP
,HR032.BUILDING AS WORK_LOCATION_NAME
,'' AS FULL_TIME_REMOTE


,'' AS JOB_GRADE
,CASE WHEN (HR016.CNTRCTTYPE = '63' OR HR016.CNTRCTTYPE = '64') THEN 'Apprenticeship' ELSE (
    CASE WHEN (HR001.EMPLSGROUP = '07' OR HR001.EMPLSGROUP = '19') THEN 'Internship' ELSE (
      CASE WHEN HR001.EMPLGROUP = '2' THEN 'External' ELSE 'Employee'  END )END)
  END AS EMPLOYEE_CLASS
,HR016.CNTRCTTYPE||'_'||HR016.CNTRCTTYPE_DESC AS CONTRACT_TYPE_16
,HR001.EMPLCNTRCT AS CONTRACT_TYPE_01

,HR016.CTEDT AS CONTRACT_END_DATE

,'' AS PROBATIONARY_PERIOD_END_DATE
,HR007.WOSTD AS STANDARD_WEEKLY_HOURS
,'Salaried' AS EMPLOYMENT_TYPE
,CASE HR001.EMPLSGROUP
WHEN '03' THEN 'Managers'
WHEN '01' THEN 'Senior Technicians and Supervisors'
ELSE ''
END AS LB_GLOBAL_EMPLOYEE_LEVEL_RB
,'No' AS DEFINITE_WORK
,'No' AS GROUP_OF_INTEREST
,HR002.ACTIONREAS AS LB_ACTIONREAS_RB
,HR002.ACTIONTYPE AS LB_ACTIONTYPE_RB
,HR002.ACTIONTYPE_DESC AS LB_ACTIONTYPE_DESC_RB
,CASE SUBSTRING(HR001.COMP_CODE,1,2 ) WHEN 'BE' THEN HR002.EMPLOYEE WHEN 'FR' THEN HR105LPID.USRID ELSE '' END AS PAYROLL_ID
,'' AS SMART_CODE
,HR016.ENTRYDATE AS ENTRY_DATE
FROM :cte_hr002 AS HR002
LEFT OUTER JOIN :cte_n_plus_one as NPLUS ON NPLUS.BASE_EMPLOYEE = HR002.EMPLOYEE
LEFT OUTER JOIN :cte_hr105_gdfs as HR105G ON HR105G.EMPLOYEE = HR002.EMPLOYEE
LEFT OUTER JOIN :cte_hr105_lpid as HR105LPID ON HR105LPID.EMPLOYEE = HR002.EMPLOYEE
LEFT OUTER JOIN :cte_hr001 AS HR001 ON HR001.EMPLOYEE = HR002.EMPLOYEE
*LEFT OUTER JOIN :cte_hr9351 AS HR351 ON HR351.EMPLOYEE = HR002.EMPLOYEE
LEFT OUTER JOIN :cte_hr041 AS HR041 ON HR041.EMPLOYEE = HR002.EMPLOYEE
LEFT OUTER JOIN :cte_hr016 AS HR016 ON HR016.EMPLOYEE = HR002.EMPLOYEE
LEFT OUTER JOIN :cte_hr315 AS HR315 ON HR315.EMPLOYEE = HR002.EMPLOYEE
--LEFT OUTER JOIN :cte_hr105g as HR105G2 ON HR105G2.EMPLOYEE = HR001.DEPT_MGR
LEFT OUTER JOIN :cte_hr032 AS HR032 ON HR032.EMPLOYEE = HR002.EMPLOYEE
LEFT OUTER JOIN :cte_hr007 AS HR007 ON HR007.EMPLOYEE = HR002.EMPLOYEE
--LEFT OUTER JOIN :cte_hr101 AS HR101 ON HR101.EMPLOYEE = HR002.EMPLOYEE
LEFT OUTER JOIN :cte_hr008 as HR008 ON HR008.EMPLOYEE = HR002.EMPLOYEE
LEFT OUTER JOIN :cte_hr9007 as HR9007 ON HR9007.EMPLOYEE = HR002.EMPLOYEE
;
-- missing handling of :bup_comp_code = '*'
RETURN
SELECT DISTINCT
MANDT
,SAP_EMPLOYEE_ID AS LB_SAP_EMPLOYEE_ID_RB
,GROUP_ID
,CONVERGENCE_ID
,LEGAL_FIRST_NAME
,NICK_NAME
,OTHER_FIRST_NAME
,LEGAL_LAST_NAME
,PREFERRED_LAST_NAME
,BIRTH_NAME
,MIDDLE_NAME
,SUFFIX
,NATIONALITY
,SECOND_NATIONALITY
,GENDER
,MARITAL_STATUS
,DATE_OF_MARITAL_STATUS
,BUSINESS_COMMUNICAT_LANGUAGE
,CASE DISABILITY WHEN 'N' THEN 'No' WHEN 'Y' THen 'Yes' ELSE '' END AS DISABILITY
,DATE_OF_BIRTH
,COUNTRY_OF_BIRTH
,REGION_OF_BIRTH
,PLACE_OF_BIRTH
,OFFICIAL_LANGUAGE
,CASE WHEN MOST_RECENT_HIRE_DATE = '00000000' OR MOST_RECENT_HIRE_DATE IS NULL THEN CASE
   WHEN GROUP_START_DATE = '00000000' OR GROUP_START_DATE IS NULL THEN SENORITY_DATE ELSE GROUP_START_DATE END
ELSE MOST_RECENT_HIRE_DATE END AS MOST_RECENT_HIRE_DATE
,GROUP_START_DATE
,SENORITY_DATE
,'' AS START_DATE_BEFORE_ACQUISITION
,LB_POSITION_ID_RB
,LB_POSITION_RB
,LB_POSITION_WEIGHT_RB
,LB_POSITION_TITLE_RB
,LB_LEGAL_ENTITYNAME_RB
,LEGAL_ENTITY
,COMP_CODE AS LB_COMP_CODE_RB
,PERS_AREA
,PERS_AREA_DESC as LB_PERS_AREA_DESC_RB
,PERS_SAREA
,PERS_SAREA_DESC as LB_PERS_SAREA_DESC_RB
,coalesce(DEPARTMENT_CODE,LEGAL_ENTITY) AS LB_DEPARTMENT_CODE_RB
,'' AS DEPARTMENT
,'' AS SECOND_ORG_AXIS
, CASE
WHEN SEZAME_COST_CENTER_ID <> LEGAL_ENTITY||'_tbl_cc_tbd' THEN LEGAL_ENTITY||'_'||SEZAME_COST_CENTER_ID
ELSE SEZAME_COST_CENTER_ID END AS SEZAME_COST_CENTER_ID
,EMPLGROUP as "LB_EMPLOYEE_GROUP_RB"
,EMPLSGROUP as "LB_EMPLOYEE_SGROUP_RB"
,WORK_LOCATION_NAME AS LB_WORK_LOCATION_NAME_RB
,'' AS WORK_LOCATION
,FULL_TIME_REMOTE
,LINE_MANAGER
,JOB_ID AS ENGIE_JOB
,'' as LOCAL_JOB_NAME
,0 as POSITION_HAY_LEVEL
,PERSONAL_HAY_LEVEL
,BAREME
,'' AS LABOR_STATUS
,EMPLOYEE_CLASS
,CONTRACT_TYPE_16 AS LB_CONTRACT_TYPE_16_RB
,CASE WHEN CONTRACT_TYPE_16 = '' OR CONTRACT_TYPE_16 IS null THEN
   CASE WHEN CONTRACT_TYPE_01 = 'DD' THEN 'Fixed-Term'
        WHEN CONTRACT_TYPE_01 = 'DI' THEN 'Permanent' ELSE 'Missing Contract InfoType PA0001' END
ELSE
   CASE WHEN SUBSTRING(SUBSTRING(CONTRACT_TYPE_16,1,2),1,2) = '01' OR SUBSTRING(CONTRACT_TYPE_16,1,2) = '61'
        THEN 'Permanent'
        WHEN SUBSTRING(CONTRACT_TYPE_16,1,2) = '02'
        THEN 'Fixed-Term'
        WHEN SUBSTRING(CONTRACT_TYPE_16,1,2) = '05' OR SUBSTRING(CONTRACT_TYPE_16,1,2) = '62' OR SUBSTRING(CONTRACT_TYPE_16,1,2) = '64'
        THEN 'Casual'
        WHEN SUBSTRING(CONTRACT_TYPE_16,1,2) = '06' THEN 'Casual'
        WHEN SUBSTRING(CONTRACT_TYPE_16,1,2) = '63' THEN 'Seasonal'
     ELSE 'Missing Contract Type' END
END AS CONTRACT_TYPE
,CONTRACT_END_DATE
,PROBATIONARY_PERIOD_END_DATE
,EMPLOYMENT_TYPE
,STANDARD_WEEKLY_HOURS
,LB_GLOBAL_EMPLOYEE_LEVEL_RB
,'' AS GLOBAL_EMPLOYEE_LEVEL
,CASE WHEN (SUBSTRING(COMP_CODE,1,2) = 'BE') THEN 'TP_BEL_TRA' ELSE 'HV_Generic_Profile'
END AS TIME_PROFILE
,DEFINITE_WORK
,GROUP_OF_INTEREST
,LB_ACTIONREAS_RB
,LB_ACTIONTYPE_RB
,LB_ACTIONTYPE_DESC_RB
,CASE WHEN (SUBSTRING(COMP_CODE,1,2) = 'BE') THEN 'Data Migration' ELSE ''
END AS LOCAL_EVENT_REASON
,PAYROLL_ID
,SMART_CODE
,ENTRY_DATE
FROM :cte_employee_prep
WHERE COMP_CODE IN (SELECT distinct BASE_MEMBER AS COMP_CODE FROM "ZTF_SPLIT_STRG"( :p_comp_code ))
AND EMPLOYEE_STATUS IN ( SELECT distinct BASE_MEMBER AS EMPLOYEE_STATUS FROM "ZTF_SPLIT_STRG"( :p_emplstatus))
AND EMPLGROUP IN ( SELECT DISTINCT BASE_MEMBER AS EMPLGROUP FROM "ZTF_SPLIT_STRG"( :p_emplgrp))
;
ENDMETHOD. "GET_EMPLOYEE_DATA

METHOD GET_COSTCENTER
BY DATABASE FUNCTION FOR HDB
  LANGUAGE SQLSCRIPT
  OPTIONS READ-ONLY
  USING ZSEZ_TF_PARAMS ZTF_SPLIT_STRG ZSEZ_TF_EMPLOYEE ZSEZ_TF_COSTCENTER
  .
  DECLARE bup_emplstatus varchar (  1333 );
  DECLARE bup_emplgrp varchar (  1333 );
  DECLARE bup_comp_code varchar (  1333 );
  DECLARE bup_anssa varchar (  1333 );
cte_param=
SELECT *
FROM "ZSEZ_TF_PARAMS"( :p_keydate, :p_emplstatus, :p_emplgrp, :p_comp_code, :p_anssa);
p_keydate := ''; p_emplstatus := ''; p_emplgrp := ''; p_comp_code := ''; p_anssa := ''; bup_emplstatus := ''; bup_comp_code := ''; bup_anssa := '';
SELECT lv_keydate into p_keydate from :cte_param;
SELECT lv_emplstatus into p_emplstatus from :cte_param;
SELECT lv_emplgrp into p_emplgrp from :cte_param;
SELECT lv_anssa into p_anssa from :cte_param;
SELECT lv_comp_code into p_comp_code from :cte_param;
SELECT lv_bup_emplstatus into bup_emplstatus from :cte_param;
SELECT lv_bup_emplgrp into bup_emplgrp from :cte_param;
SELECT lv_bup_comp_code into bup_comp_code from :cte_param;
SELECT lv_bup_anssa into bup_anssa from :cte_param;

cte_employee=
SELECT DISTINCT SEZAME_COST_CENTER_ID,
  'A' AS STATUS,
  LEGAL_ENTITY,
  LB_COMP_CODE_RB AS COMP_CODE
FROM ZSEZ_TF_EMPLOYEE
( P_KEYDATE => :p_keydate , P_EMPLSTATUS => :p_emplstatus, P_EMPLGRP => :p_emplgrp, P_ANSSA => :p_anssa, P_COMP_CODE => :p_comp_code )
WHERE SUBSTRING(SEZAME_COST_CENTER_ID,6,11) <> '_tbl_cc_tbd' AND MANDT = session_context('CLIENT')
;

et_mcostcenter=
SELECT
MANDT
,LANGU
,CO_AREA
,COSTCENTER
,DATETO
,DATEFROM
,COMP_CODE
,OBJECT_NO
,CO_CCCAT
,CO_CCCAT_TEXT
,OBJ_CURR
,PROFIT_CTR
,RESP_PERS
,HNODE
,OVHLINE
,FUNC_AREA
,RESP_CCTR
,RESP_USER
,COUNTRY
,RT_LOCATIO
,COSTCENTER_DESC
FROM   ZSEZ_TF_COSTCENTER(p_keydate => :p_keydate,
p_langu => 'E', p_co_area => 'TE01', p_comp_code => :P_comp_code)
;

cte_cctr_prep=
SELECT
MANDT
,EMP.COMP_CODE
,EMP.SEZAME_COST_CENTER_ID
,EMP.STATUS
,CCTR.COSTCENTER
,CONCAT(CONCAT(CONCAT(CONCAT(SUBSTRING(CCTR.DATEFROM,7,2),'/'),SUBSTRING(CCTR.DATEFROM,5,2)),'/'),SUBSTRING(CCTR.DATEFROM,1,4)) AS EFFECTIVE_AS_OF
,EMP.LEGAL_ENTITY AS LEGAL_ENTITY
,CCTR.COSTCENTER_DESC
FROM :cte_employee as EMP
LEFT OUTER JOIN :et_mcostcenter as CCTR ON CCTR.COSTCENTER = SUBSTRING(EMP.SEZAME_COST_CENTER_ID,7,10)
;
if :bup_emplstatus = '*' and :bup_emplgrp = '*' and :bup_comp_code = '*' and :bup_anssa = '*' then
RETURN
SELECT
MANDT
,SEZAME_COST_CENTER_ID
,STATUS
,EFFECTIVE_AS_OF
,COSTCENTER
,LEGAL_ENTITY
,COSTCENTER_DESC AS NAME
FROM :cte_cctr_prep
WHERE COSTCENTER <> ''
ORDER BY 1;
else
RETURN
SELECT
MANDT
,SEZAME_COST_CENTER_ID
,STATUS
,EFFECTIVE_AS_OF
,COSTCENTER
,LEGAL_ENTITY
,COSTCENTER_DESC AS NAME
FROM :cte_cctr_prep
WHERE COSTCENTER <> '' AND COMP_CODE IN (SELECT distinct BASE_MEMBER AS COMP_CODE FROM "ZTF_SPLIT_STRG"( :p_comp_code ))
ORDER BY 1;
end if;
endmethod.


METHOD GET_EMPLOYEE_NID
BY DATABASE FUNCTION FOR HDB
  LANGUAGE SQLSCRIPT
  OPTIONS READ-ONLY
  USING ZSEZ_TF_PARAMS PA0100 ZSEZ_TF_HR105_GDFS
  .
DECLARE p_anssa varchar ( 1333 );
  DECLARE bup_emplstatus varchar (  1333 );
  DECLARE bup_emplgrp varchar (  1333 );
  DECLARE bup_comp_code varchar (  1333 );
  DECLARE bup_anssa varchar (  1333 );
-- forced ADRRESS_TYPE to *
cte_param=
SELECT *
FROM "ZSEZ_TF_PARAMS"( :p_keydate, :p_emplstatus, :p_emplgrp, :p_comp_code, '*');
p_keydate := ''; p_emplstatus := ''; p_emplgrp := ''; p_comp_code := ''; p_anssa := ''; bup_emplstatus := ''; bup_comp_code := ''; bup_anssa := '';
SELECT lv_keydate into p_keydate from :cte_param;
SELECT lv_emplstatus into p_emplstatus from :cte_param;
SELECT lv_emplgrp into p_emplgrp from :cte_param;
SELECT lv_anssa into p_anssa from :cte_param;
SELECT lv_comp_code into p_comp_code from :cte_param;
SELECT lv_bup_emplstatus into bup_emplstatus from :cte_param;
SELECT lv_bup_emplgrp into bup_emplgrp from :cte_param;
SELECT lv_bup_comp_code into bup_comp_code from :cte_param;
SELECT lv_bup_anssa into bup_anssa from :cte_param;

cte_hr105_gdfs=
SELECT
MANDT
,EMPLOYEE
,USRID AS GROUP_ID
,COMP_CODE
,EMPLOYEE_STATUS
FROM "ZSEZ_TF_HR105_GDFS"(P_KEYDATE => :p_keydate,P_EMPLSTATUS => :p_emplstatus, P_EMPLGRP => '*', P_COMP_CODE => :p_comp_code)
;
if :bup_emplstatus = '*' and :bup_emplgrp = '*' and :bup_comp_code = '*' then
cte_employee_nid=
SELECT
  HR100.MANDT,
  HR100.PERNR as SAP_EMPLOYEE_ID,
  HR105G.GROUP_ID,
  'Belgium' AS COUNTRY,
  'National Registry Number' AS NATIONAL_ID_CARD_TYPE,
  HR100.RSZRR AS NATIONAL_ID,
  'Yes' AS IS_PRIMARY,
  HR105G.COMP_CODE,
  HR105G.EMPLOYEE_STATUS
FROM PA0100 HR100 LEFT OUTER JOIN :cte_hr105_gdfs HR105G ON (
  HR105G.MANDT = HR100.MANDT AND
  HR105G.EMPLOYEE = HR100.PERNR
)
WHERE HR100.MANDT = session_context('CLIENT') AND (
  HR100.ENDDA >= :p_keydate AND
  HR100.BEGDA <= :p_keydate
  );
else
cte_employee_nid=
SELECT
  HR100.MANDT,
  HR100.PERNR as SAP_EMPLOYEE_ID,
  HR105G.GROUP_ID,
  'Belgium' AS COUNTRY,
  'National Registry Number' AS NATIONAL_ID_CARD_TYPE,
  HR100.RSZRR AS NATIONAL_ID,
  'Yes' AS IS_PRIMARY,
  HR105G.COMP_CODE,
  HR105G.EMPLOYEE_STATUS
FROM PA0100 HR100 INNER JOIN :cte_hr105_gdfs HR105G ON (
  HR105G.MANDT = HR100.MANDT AND
  HR105G.EMPLOYEE = HR100.PERNR
)
WHERE HR100.MANDT = session_context('CLIENT') AND (
  HR100.ENDDA >= :p_keydate AND
  HR100.BEGDA <= :p_keydate
  ) AND SUBSTRING( HR105G.COMP_CODE,1,2 ) IN ( 'BE','RO');
end if;
RETURN
SELECT
MANDT
,SAP_EMPLOYEE_ID
,GROUP_ID
,COUNTRY
,NATIONAL_ID_CARD_TYPE
,NATIONAL_ID
,IS_PRIMARY
,COMP_CODE
,EMPLOYEE_STATUS
FROM :cte_employee_nid
;
ENDMETHOD.

METHOD GET_EMPLOYEE_EMC
BY DATABASE FUNCTION FOR HDB
  LANGUAGE SQLSCRIPT
  OPTIONS READ-ONLY
  USING
ZSEZ_TF_HR105_GDFS
ZSEZ_TF_HR006
ZSEZ_TF_PARAMS.
DECLARE p_anssa varchar ( 1333 );
  DECLARE bup_emplstatus varchar (  1333 );
  DECLARE bup_comp_code varchar (  1333 );
  DECLARE bup_anssa varchar (  1333 );
-- forced ADRRESS_TYPE to *
cte_param=
SELECT *
FROM "ZSEZ_TF_PARAMS"( :p_keydate, :p_emplstatus, :p_emplgrp, :p_comp_code, '*');
p_keydate := ''; p_emplstatus := ''; p_comp_code := ''; p_anssa := ''; bup_emplstatus := ''; bup_comp_code := ''; bup_anssa := '';
SELECT lv_keydate into p_keydate from :cte_param;
SELECT lv_emplstatus into p_emplstatus from :cte_param;
SELECT lv_anssa into p_anssa from :cte_param;
SELECT lv_comp_code into p_comp_code from :cte_param;
SELECT lv_bup_emplstatus into bup_emplstatus from :cte_param;
SELECT lv_bup_comp_code into bup_comp_code from :cte_param;
SELECT lv_bup_anssa into bup_anssa from :cte_param;

cte_hr105_gdfs=
SELECT
MANDT
,EMPLOYEE
,USRID AS GROUP_ID
,COMP_CODE
,EMPLOYEE_STATUS
FROM "ZSEZ_TF_HR105_GDFS"(P_KEYDATE => :p_keydate,P_EMPLSTATUS => :p_emplstatus, P_EMPLGRP => '*', P_COMP_CODE => :p_comp_code)
;
cte_employee_emc=
SELECT *
FROM "ZSEZ_TF_HR006"(P_KEYDATE => :p_keydate, P_EMPLSTATUS => '*', P_EMPLGRP => '*', P_COMP_CODE => '*', P_ANSSA => '*' )
WHERE SUBTY = '4';
if :bup_emplstatus = '*' and :bup_comp_code = '*' then
cte_result=
SELECT
  EMC.MANDT,
  EMC.EMPLOYEE as SAP_EMPLOYEE_ID,
  HR105G.GROUP_ID,
  EMC.NAME2 AS NAME,
  'Other' AS RELATIONSHIP,
  EMC.TEL_NUMBER AS PHONE_NUMBER,
  EMC.EMAIL AS EMAIL_ADDRESS,
  'Yes' AS IS_PRIMARY
FROM :cte_employee_emc as EMC
LEFT OUTER JOIN :cte_hr105_gdfs as HR105G ON HR105G.MANDT = EMC.MANDT AND HR105G.EMPLOYEE = EMC.EMPLOYEE;
ELSE
cte_result=
SELECT
  EMC.MANDT,
  EMC.EMPLOYEE as SAP_EMPLOYEE_ID,
  HR105G.GROUP_ID,
  EMC.NAME2 AS NAME,
  'Other' AS RELATIONSHIP,
  EMC.TEL_NUMBER AS PHONE_NUMBER,
  EMC.EMAIL AS EMAIL_ADDRESS,
  'Yes' AS IS_PRIMARY
FROM :cte_employee_emc as EMC
INNER JOIN :cte_hr105_gdfs as HR105G ON HR105G.MANDT = EMC.MANDT AND HR105G.EMPLOYEE = EMC.EMPLOYEE;
end if;
RETURN
SELECT * FROM :cte_result;
ENDMETHOD.
ENDCLASS.
