*&---------------------------------------------------------------------*
*& Report zthcm_sez_files
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zthcm_sez_files MESSAGE-ID geocoding.

TABLES: ZVSEZSTATN_E, PA0006, PA0001, T001.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
PARAMETERS: p_keydt TYPE dats DEFAULT sy-datum OBLIGATORY.
SELECTION-SCREEN SKIP 1.
SELECT-OPTIONS:
            so_empls  FOR ZVSEZSTATN_E-HREmployeeStatusCode OBLIGATORY DEFAULT '3',
            so_anssa  FOR PA0006-anssa OBLIGATORY DEFAULT '0001',
            so_ccycd FOR T001-BUKRS OBLIGATORY DEFAULT 'BE74',
            so_empgr FOR PA0001-PERSG OBLIGATORY DEFAULT '1'.
SELECTION-SCREEN END OF BLOCK b1.


SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-003.

*SELECTION-SCREEN SKIP 1.
SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 3(30) TEXT-012 FOR FIELD p_empld.   "Employee Data
SELECTION-SCREEN POSITION 36.
PARAMETERS: p_empld RADIOBUTTON GROUP grp2 DEFAULT 'X'.
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 3(30) TEXT-013 FOR FIELD p_empla.   "Employee Addresses(BE)
SELECTION-SCREEN POSITION 36.
PARAMETERS: p_empla RADIOBUTTON GROUP grp2. "Employee Addresses(BE)
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 3(30) TEXT-014 FOR FIELD p_empln.   "Employee NIC(BE)
SELECTION-SCREEN POSITION 36.
PARAMETERS: p_empln RADIOBUTTON GROUP grp2. "Employee NIC(BE)
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 3(30) TEXT-015 FOR FIELD p_emple.   "Employee Emergency Contact
SELECTION-SCREEN POSITION 36.
PARAMETERS: p_emple RADIOBUTTON GROUP grp2. "Employee Emergency Contact
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 3(33) TEXT-016 FOR FIELD p_emplc.   "CostCenters Used in Employee Data
SELECTION-SCREEN POSITION 36.
PARAMETERS: p_emplc RADIOBUTTON GROUP grp2. "CostCenters
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 3(30) TEXT-017 FOR FIELD p_meta.   "Metadata
SELECTION-SCREEN POSITION 36.
PARAMETERS: p_meta RADIOBUTTON GROUP grp2. "Metadata
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 3(30) TEXT-018 FOR FIELD p_nplus.   "Employee N+1 (ZSEZ_TF_EMPL_N_PLUS_ONE)
SELECTION-SCREEN POSITION 36.
PARAMETERS: p_nplus RADIOBUTTON GROUP grp2. "Employee N+1
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN END OF BLOCK b2.

SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE TEXT-101.
SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 3(30) TEXT-111 FOR FIELD p_mock3.   "Employee Data Mock 3
SELECTION-SCREEN POSITION 36.
PARAMETERS: p_mock3 RADIOBUTTON GROUP grp3 .
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 3(30) TEXT-131 FOR FIELD p_mock3a.   "Employee Data Mock 3 All Fields
SELECTION-SCREEN POSITION 36.
PARAMETERS: p_mock3a RADIOBUTTON GROUP grp3. "Employee Data Mock 3 All Fields
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN END OF BLOCK b3.

DATA: lv_datasel TYPE c LENGTH 2 VALUE '',
            m3  TYPE string,
            l_title  TYPE sy-title.

DATA: lv_emplst TYPE rsdm4nodename.

DATA: string_list_emplst  TYPE string,
      string_list_emplgrp TYPE string,
      string_list_anssa TYPE string,
      string_list_comp_code TYPE string,
      txt TYPE string.
* not used - just for example
DATA(lv_where_emplst) = cl_shdb_seltab=>combine_seltabs(
    it_named_seltabs = VALUE #(
    ( name = 'EMPLSTATUS' dref = REF #( so_empls[] ) )
     )
    ).

DATA(lv_where_anssa) = cl_shdb_seltab=>combine_seltabs(
    it_named_seltabs = VALUE #(
    ( name = 'ANSSA' dref = REF #( so_anssa[] ) )
     )
    ).

DATA(lv_where_comp_code) = cl_shdb_seltab=>combine_seltabs(
    it_named_seltabs = VALUE #(
    ( name = 'COMP_CODE' dref = REF #( so_ccycd[] ) )
     )
    ).
* end not used

DATA: ls_rec                TYPE REF TO data,
      lt_databup            TYPE REF TO data.

FIELD-SYMBOLS:  <itab_file> TYPE STANDARD TABLE,
               <ls_rec>     TYPE any,
               <lt_databup> TYPE STANDARD TABLE.

* files names prefixes
CONSTANTS:
c_fempld1 TYPE string VALUE 'EMPLOYEE_DATA Mock 3',
c_fempld2 TYPE string VALUE 'EMPLOYEE_DATA Mock 3 All Fields',
c_fempla TYPE string VALUE 'EMPLOYEE_ADDRESSES_BE Mock 3',
c_fempln TYPE string VALUE 'EMPLOYEE_NIC_BE Mock 3',
c_femple TYPE string VALUE 'EMPLOYEE_EMERGENCY_CONTACTS Mock 3',
c_femplc TYPE string VALUE 'EMPLOYEE_DATA_CCTR',
c_fmeta TYPE  string VALUE 'EMPLOYEE_METADATA',
c_femplone TYPE string VALUE 'EMPLOYEE_N_PLUS_ONE'.

INITIALIZATION.

DATA: lv_selected_flr TYPE string,
      p_alv TYPE C LENGTH 1 VALUE 'X'.

AT SELECTION-SCREEN OUTPUT.
* no roles received to include authority-objects
* PERFORM check_authority.

START-OF-SELECTION.
CLEAR : string_list_emplst, string_list_emplgrp, string_list_anssa, string_list_comp_code.


SELECT DISTINCT HREmployeeStatusCode as emplstatus
FROM ZVSEZSTATN_E
INTO TABLE @DATA(t_emplst)
WHERE HREmployeeStatusCode IN @so_empls ORDER BY HREmployeeStatusCode.

SELECT DISTINCT PERSG as emplgrp
FROM PA0001
INTO TABLE @DATA(t_emplgrp)
WHERE PERSG IN @so_empgr ORDER BY PERSG.

*DATA(t_emplst) = FILTER #( t_emplst USING KEY emplstatus WHERE (lv_where_emplst) ).

LOOP AT so_anssa.
CALL FUNCTION 'CONVERSION_EXIT_ALPHA_OUTPUT' EXPORTING input = so_anssa-low IMPORTING output = so_anssa-low.
CALL FUNCTION 'CONVERSION_EXIT_ALPHA_OUTPUT' EXPORTING input = so_anssa-high IMPORTING output = so_anssa-high.
MODIFY so_anssa.
ENDLOOP.

SELECT DISTINCT ANSSA
FROM PA0006
INTO TABLE @DATA(t_anssa)
WHERE anssa IN @so_anssa ORDER BY anssa.

SELECT DISTINCT bukrs as comp_code
FROM T001
INTO TABLE @DATA(t_ccycod)
WHERE bukrs IN @so_ccycd ORDER BY bukrs.
* employee status
LOOP AT t_emplst ASSIGNING FIELD-SYMBOL(<row>).
CONCATENATE string_list_emplst <row>-emplstatus INTO string_list_emplst SEPARATED BY ','.
ENDLOOP.

DESCRIBE TABLE t_emplst LINES DATA(rec_emplst).
IF rec_emplst <= 1. REPLACE ALL OCCURRENCES OF '''' IN string_list_emplst WITH ''. ENDIF.

* employee group
LOOP AT t_emplgrp ASSIGNING FIELD-SYMBOL(<row4>).
CONCATENATE string_list_emplgrp <row4>-emplgrp INTO string_list_emplgrp SEPARATED BY ','.
ENDLOOP.

DESCRIBE TABLE t_emplgrp LINES DATA(rec_emplgrp).
IF rec_emplgrp <= 1. REPLACE ALL OCCURRENCES OF '''' IN string_list_emplgrp WITH ''. ENDIF.


LOOP AT t_anssa ASSIGNING FIELD-SYMBOL(<row2>).
CONCATENATE string_list_anssa <row2>-anssa INTO string_list_anssa SEPARATED BY ','.
ENDLOOP.
DESCRIBE TABLE t_anssa LINES DATA(rec_anssa).

IF rec_anssa <= 1. REPLACE ALL OCCURRENCES OF '''' IN string_list_anssa WITH ''. ENDIF.

LOOP AT t_ccycod ASSIGNING FIELD-SYMBOL(<row3>).
CONCATENATE string_list_comp_code <row3>-comp_code INTO string_list_comp_code SEPARATED BY ','.
ENDLOOP.

DESCRIBE TABLE t_ccycod LINES DATA(rec_ccycod).

IF rec_ccycod <= 1. REPLACE ALL OCCURRENCES OF '''' IN string_list_comp_code WITH ''. ENDIF.

IF p_empld = 'X' and p_mock3 = 'X'.  lv_datasel = 'D1'.
 ELSEIF p_empld = 'X' and p_mock3a = 'X'.  lv_datasel = 'D2'.

   ELSEIF p_empla = 'X'. lv_datasel = 'A'.
    ELSEIF p_empln = 'X'. lv_datasel = 'N'.
      ELSEIF p_emple = 'X'. lv_datasel = 'E'.
        ELSEIF p_emplc = 'X'. lv_datasel = 'C'.
        ELSEIF p_meta = 'X' and p_mock3 = 'X'. lv_datasel = 'M1'.
         ELSEIF p_meta = 'X' and p_mock3a = 'X'. lv_datasel = 'M2'.
          ELSEIF p_nplus = 'X'. lv_datasel = 'N+'.

ENDIF.

IF NOT cl_abap_dbfeatures=>use_features(
          EXPORTING
            requested_features =
              VALUE #( ( cl_abap_dbfeatures=>call_amdp_method )
                       ( cl_abap_dbfeatures=>amdp_table_function ) ) ).
cl_demo_output=>display(
        `System does not support AMDP or CDS table functions` ).
 RETURN.
ENDIF.

IF lv_datasel = 'D1'.
* DISTINCT : selecting several address type ends up with dup records per employee
SELECT DISTINCT * FROM zsez_tf_employee( p_keydate = @p_keydt ,
   p_emplstatus = @string_list_emplst,
   p_emplgrp = @string_list_emplgrp,
   p_anssa = @string_list_anssa,
   p_comp_code = @string_list_comp_code )
 INTO TABLE @DATA(lt_resultd1)
  ##db_feature_mode[amdp_table_function].
ELSEIF lv_datasel = 'D2'.
* DISTINCT : selecting several address type ends up with dup records per employee
SELECT DISTINCT * FROM zsez_tf_employee_a( p_keydate = @p_keydt ,
   p_emplstatus = @string_list_emplst,
  p_emplgrp = @string_list_emplgrp,
   p_anssa = @string_list_anssa,
   p_comp_code = @string_list_comp_code )
 INTO TABLE @DATA(lt_resultd2)
  ##db_feature_mode[amdp_table_function].

ELSEIF p_empla = 'X'.
  SELECT *
    FROM zsez_tf_hr006( p_keydate = @p_keydt ,
   p_emplstatus = @string_list_emplst,
   p_emplgrp = @string_list_emplgrp,
   p_anssa = @string_list_anssa,
   p_comp_code = @string_list_comp_code )
 INTO TABLE @DATA(lt_resulta)
  ##db_feature_mode[amdp_table_function].
ELSEIF lv_datasel = 'N'.
  SELECT *
    FROM zsez_tf_empl_nid( p_keydate = @p_keydt ,
   p_emplstatus = @string_list_emplst,
   p_emplgrp = @string_list_emplgrp,
   p_comp_code = @string_list_comp_code )
 INTO TABLE @DATA(lt_resultn)
  ##db_feature_mode[amdp_table_function].
ELSEIF lv_datasel = 'E'.
  SELECT *
    FROM zsez_tf_empl_emc( p_keydate = @p_keydt ,
   p_emplstatus = @string_list_emplst,
   p_emplgrp = @string_list_emplgrp,
   p_comp_code = @string_list_comp_code )
 INTO TABLE @DATA(lt_resulte)
  ##db_feature_mode[amdp_table_function].
ELSEIF lv_datasel = 'C'.
  SELECT *
    FROM zsez_tf_costcenter2( p_keydate = @p_keydt ,
   p_emplstatus = @string_list_emplst,
   p_emplgrp = @string_list_emplgrp,
   p_anssa = @string_list_anssa,
   p_comp_code = @string_list_comp_code )
 INTO TABLE @DATA(lt_resultc)
  ##db_feature_mode[amdp_table_function].
ELSEIF lv_datasel = 'M1'.
  SELECT FIELDNAME, POSITION, ROLLNAME as DATATYPE, LENG AS LENGTH
    FROM DD03ND WHERE STRUCOBJN = 'ZSEZ_TF_EMPLOYEE' AND AS4LOCAL = 'A'
     ORDER BY POSITION
 INTO TABLE @DATA(lt_resultm)
  ##db_feature_mode[amdp_table_function].
ELSEIF lv_datasel = 'M2'.
  SELECT FIELDNAME, POSITION, ROLLNAME as DATATYPE, LENG AS LENGTH
    FROM DD03ND WHERE STRUCOBJN = 'ZSEZ_TF_EMPLOYEE_A' AND AS4LOCAL = 'A'
     ORDER BY POSITION
 INTO TABLE @DATA(lt_resultm2)
  ##db_feature_mode[amdp_table_function].
ELSEIF lv_datasel = 'M3'.
  SELECT FIELDNAME, POSITION, ROLLNAME as DATATYPE, LENG AS LENGTH
    FROM DD03ND WHERE STRUCOBJN = 'ZSEZ_TF_EMPLOYEE_?' AND AS4LOCAL = 'A'
     ORDER BY POSITION
 INTO TABLE @DATA(lt_resultm3)
  ##db_feature_mode[amdp_table_function].
ELSEIF lv_datasel = 'N+'.
  SELECT *
    FROM ZSEZ_TF_EMPL_N_PLUS_ONE( p_keydate = @p_keydt ,
    p_emplstatus = @string_list_emplst,
   p_comp_code = @string_list_comp_code, p_level = '1' )
 INTO TABLE @DATA(lt_resultnplus)
  ##db_feature_mode[amdp_table_function].
ENDIF. "lv_datasel

IF p_alv = 'X'.
CASE lv_datasel.
  WHEN 'D1'. PERFORM callback_alv USING l_title lt_resultd1.
  WHEN 'D2'. PERFORM callback_alv USING l_title lt_resultd2.

  WHEN 'A'. PERFORM callback_alv USING l_title lt_resulta.
  WHEN 'N'. PERFORM callback_alv USING l_title lt_resultn.
  WHEN 'E'. PERFORM callback_alv USING l_title lt_resulte.
  WHEN 'C'. PERFORM callback_alv USING l_title lt_resultc.
  WHEN 'M1'. PERFORM callback_alv USING l_title lt_resultm.
  WHEN 'M2'. PERFORM callback_alv USING l_title lt_resultm2.
  WHEN 'M3'. PERFORM callback_alv USING l_title lt_resultm3.
  WHEN 'N+'. PERFORM callback_alv USING l_title lt_resultnplus.
ENDCASE.

*ELSEIF p_foreg = 'X' AND p_dir IS NOT INITIAL.
*
*ELSEIF p_backg = 'X'.

ENDIF. "P_ALV = 'X' or P_FOREG or P_BACKG

REFRESH: lt_resultd1, lt_resultd2, lt_resulta, lt_resultn, lt_resulte, lt_resultc, lt_resultm, lt_resultm2, lt_resultm3,lt_resultnplus.

*CREATE DATA ls_rec LIKE LINE OF lt_resultd1.
*ASSIGN ls_rec->* TO <ls_rec>.
*
**Creating internal table based on Line structure
*CREATE DATA lt_databup LIKE lt_resultd1.
*ASSIGN lt_databup->* TO <lt_databup>.


FORM callback_alv USING
  VALUE(i_title) TYPE sy-title
  it_data        TYPE ANY TABLE.

IF it_data IS INITIAL.
  CONCATENATE 'No data found with : ' c_fempld1  INTO m3.
  MESSAGE i799(rsm1) WITH m3.

ELSE.
IF p_empld = 'X' and p_mock3 = 'X'.  CONCATENATE c_fempld1 p_keydt INTO i_title SEPARATED BY '_'.
 ELSEIF p_empld = 'X' and p_mock3a = 'X'.  CONCATENATE c_fempld2 p_keydt INTO i_title SEPARATED BY '_'.
*  ELSEIF p_empld = 'X' and p_mock3 = 'X'.  CONCATENATE c_fempld3 p_keydt INTO i_title SEPARATED BY '_'.
  ELSEIF p_empla = 'X'. CONCATENATE c_fempla p_keydt INTO i_title SEPARATED BY '_'.
    ELSEIF p_empln = 'X'. CONCATENATE c_fempln p_keydt INTO i_title SEPARATED BY '_'.
      ELSEIF p_emple = 'X'. CONCATENATE c_femple p_keydt text-101 INTO i_title SEPARATED BY '_'.
        ELSEIF p_emplc = 'X'. CONCATENATE c_femplc p_keydt INTO i_title SEPARATED BY '_'.
          ELSEIF p_meta = 'X' and p_mock3 = 'X'. CONCATENATE c_fmeta c_fempld1 INTO i_title SEPARATED BY '_'.
           ELSEIF p_meta = 'X' and p_mock3a = 'X'. CONCATENATE c_fmeta c_fempld2 INTO i_title SEPARATED BY '_'.
            ELSEIF p_nplus = 'X'. CONCATENATE c_femplone p_keydt INTO i_title SEPARATED BY '_'.


ENDIF.


ENDIF.

    CALL FUNCTION 'RSDU_CALL_ALV_TABLE'
      EXPORTING
        i_title   = i_title
        i_ta_data = it_data.
*  DATA: o_salv2 TYPE REF TO cl_salv_table.
*  TRY.
*      CALL METHOD cl_salv_table=>factory
*        IMPORTING
*          r_salv_table = o_salv2
*        CHANGING
*          t_table      = it_data.
*      o_salv2->display( ).
*    CATCH cx_salv_msg .
*  ENDTRY.


ENDFORM.                    "callback_alv

FORM check_authority.
* cfr. tcode SACF and OSS 1946079 - Initial Authorization Check in Function SUBMIT_REPORT
*-----------------------*
*  AUTHORITY-CHECK OBJECT 'S_PROGNAM'
*                  ID 'TCD' FIELD sy-tcode.
*IF sy-subrc NE 0.
*  MESSAGE e077(s#) WITH sy-tcode.
* You are not authorized to run & !
*ENDIF.

** check authority: Customizing Authority is needed here
*  AUTHORITY-CHECK OBJECT 'P_CZ_RTEEX'
*    ID 'REPID' FIELD 'ZSEZ_FILES'. "sy-repid.
*  IF sy-subrc <> 0.
*    MESSAGE e014 WITH sy-repid.
*    EXIT.
*  ENDIF.
* ? maintain SE93 ZSEZ_FILES with dedicated authorization-object
* AUTHORITY-CHECK OBJECT 'S_TCODE'
*         ID 'TCD' FIELD 'ZSEZ_FILES'."sy-tcode.
*IF sy-subrc NE 0.
*  MESSAGE e077(s#) WITH sy-tcode.
*ENDIF.

*AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_dir.
*  IF p_foreg = abap_true.
*  cl_gui_frontend_services=>directory_browse(
*      CHANGING
*        selected_folder      = lv_selected_flr
*      EXCEPTIONS
*        OTHERS               = 4 ).
*  IF lv_selected_flr IS NOT INITIAL.
*    p_dir = lv_selected_flr.
*  ENDIF.
*  ELSEIF p_backg = abap_true.
*    p_dir = '/usr/sap/TP4/archive/?'. "create NFILE accordingly first
*
*  ENDIF.

ENDFORM. "check_authority.
