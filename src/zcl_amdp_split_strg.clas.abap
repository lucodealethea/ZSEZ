CLASS zcl_amdp_split_strg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

PUBLIC SECTION.
INTERFACES if_amdp_marker_hdb .
TYPES:

BEGIN OF g_t_mbr,
  base_member TYPE UJ_DIM_MEMBER,
END OF g_t_mbr.

CLASS-METHODS:
strg_to_table
FOR TABLE FUNCTION ZTF_SPLIT_STRG.

CLASS-METHODS: GET_PARAMS
FOR TABLE FUNCTION ZSEZ_TF_PARAMS.
ENDCLASS.



CLASS ZCL_AMDP_SPLIT_STRG IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_BPC_AMDP_SPLIT_STRG=>STRG_TO_TABLE
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
method strg_to_table
  BY DATABASE FUNCTION FOR HDB
  LANGUAGE SQLSCRIPT
  OPTIONS READ-ONLY
.
RETURN
SELECT RESULT AS BASE_MEMBER FROM SYS.SQLSCRIPT_STRING:SPLIT_TO_TABLE(:p_nodename, ',', -1)
ORDER BY 1
;
ENDMETHOD.

METHOD GET_PARAMS
BY DATABASE FUNCTION FOR HDB
  LANGUAGE SQLSCRIPT
  OPTIONS READ-ONLY
  USING PA0000 PA0001 PA0006 CSKS ZTF_SPLIT_STRG
  .
DECLARE string_list_status varchar( 1333 );
DECLARE string_list_emplgrp varchar( 1333 );
DECLARE string_list_comp_code varchar( 1333 );
DECLARE bup_comp_code varchar( 1333 );
DECLARE bup_emplstatus varchar( 1333 );
DECLARE bup_emplgrp varchar( 1333 );
DECLARE string_list_anssa varchar( 1333 );
DECLARE bup_anssa varchar( 1333 );

string_list_anssa = '';
string_list_status = '';
string_list_emplgrp = '';
string_list_comp_code = '';

bup_comp_code := :p_comp_code;
bup_emplstatus := :p_emplstatus;
bup_emplgrp := p_emplgrp;
bup_anssa := p_anssa;
-- status
if :p_emplstatus <> '*'
then
cte_column_status=
SELECT BASE_MEMBER FROM "ZTF_SPLIT_STRG"(:p_emplstatus);
select STRING_AGG(BASE_MEMBER, ',' ORDER BY BASE_MEMBER) into string_list_status
FROM :cte_column_status;
else
p_emplstatus := '';
cte_dist_emplstatus=
SELECT DISTINCT STAT2 AS EMPLSTATUS FROM PA0000 WHERE MANDT = session_context('CLIENT');
select STRING_AGG(EMPLSTATUS, ',' ORDER BY EMPLSTATUS) into p_emplstatus FROM :cte_dist_emplstatus;
end if;
-- employee group
if :p_emplgrp <> '*'
then
cte_column_emplgrp=
SELECT BASE_MEMBER FROM "ZTF_SPLIT_STRG"(:p_emplgrp);
select STRING_AGG(BASE_MEMBER, ',' ORDER BY BASE_MEMBER) into string_list_emplgrp
FROM :cte_column_emplgrp;
else
p_emplgrp := '';
cte_dist_emplgrp=
SELECT DISTINCT PERSG AS EMPLGROUP FROM PA0001 WHERE MANDT = session_context('CLIENT');
select STRING_AGG(EMPLGROUP, ',' ORDER BY EMPLGROUP) into p_emplgrp FROM :cte_dist_emplgrp;
end if;
-- comp_code
if :p_comp_code <> '*'
then
cte_column_comp_code=
SELECT BASE_MEMBER AS COMP_CODE FROM "ZTF_SPLIT_STRG"(:p_comp_code);
select STRING_AGG(COMP_CODE, ',' ORDER BY COMP_CODE) into string_list_comp_code
FROM :cte_column_comp_code;
else
p_comp_code := '';
cte_dist_ccycode=
SELECT DISTINCT BUKRS FROM CSKS WHERE MANDT = session_context('CLIENT') AND BUKRS BETWEEN 'AAAA' AND 'UUUU' ORDER BY 1;
select STRING_AGG(BUKRS, ',' ORDER BY BUKRS) into p_comp_code FROM :cte_dist_ccycode;
end if;

if :p_anssa <> '*' then cte_column_anssa=SELECT BASE_MEMBER FROM "ZTF_SPLIT_STRG"(:p_anssa);
select STRING_AGG(BASE_MEMBER, ',' ORDER BY BASE_MEMBER) into string_list_anssa
FROM :cte_column_anssa;
else
p_anssa := '';
cte_dist_anssa=
SELECT DISTINCT ANSSA as ADDRESS_TYPE FROM PA0006 WHERE MANDT = session_context('CLIENT');
select STRING_AGG(ADDRESS_TYPE, ',' ORDER BY ADDRESS_TYPE) into p_anssa FROM :cte_dist_anssa;
end if;

RETURN
SELECT :p_keydate as lv_keydate,
 :p_emplstatus as lv_emplstatus, :p_emplgrp as lv_emplgrp, :p_comp_code as lv_comp_code, :p_anssa as lv_anssa,
 :bup_emplstatus as lv_bup_emplstatus, :bup_emplgrp as lv_bup_emplgrp,
 :bup_comp_code as lv_bup_comp_code, bup_anssa as lv_bup_anssa
 FROM DUMMY;

ENDMETHOD.
ENDCLASS.
