CLASS zcl_sez_fill_legal_entity DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   interfaces if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sez_fill_legal_entity IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
  DATA: lt_legal_entity type table of ZSEZ_LEGALENTITY.

"read current timestamp
GET TIME STAMP FIELD DATA(zv_tsl).
"fill internal table
lt_legal_entity = VALUE #(
( client ='200' legal_entity = '13838'  legal_entity_desc = 'TRACTEBEL ENGINEERING S.A. (RO)'   lastchangedat = zv_tsl )
( client ='200' legal_entity = '13897'  legal_entity_desc = 'TRACTEBEL ENGINEERING A.S. (CZ)'   lastchangedat = zv_tsl )
( client ='200' legal_entity = '14533'  legal_entity_desc = 'TRACTEBEL ENGINEERING CONSULTANCY LLC' lastchangedat = zv_tsl )
( client ='200' legal_entity = '14714'  legal_entity_desc = 'INTERNATIONAL MARINE AND DREDGING CONSULTANTS (I.M.D.C.)'  lastchangedat = zv_tsl )
( client ='200' legal_entity = '15268'  legal_entity_desc = 'TRACTEBEL ENGINEERING S.A. (FR)'   lastchangedat = zv_tsl )
( client ='200' legal_entity = '15320'  legal_entity_desc = 'TRACTEBEL ENGINEERING S.A. (BE)'   lastchangedat = zv_tsl )
( client ='200' legal_entity = '15321'  legal_entity_desc = 'SYNGENIA'  lastchangedat = zv_tsl )
( client ='200' legal_entity = '15618'  legal_entity_desc = 'TRACTEBEL ENGINEERING PRIVATE LIMITED (IN)'    lastchangedat = zv_tsl )
( client ='200' legal_entity = '15619'  legal_entity_desc = 'TRACTEBEL ENGINEERING LTDA. (BR)'  lastchangedat = zv_tsl )
( client ='200' legal_entity = '17313'  legal_entity_desc = 'COYNE ET BELLIER NIGERIA LIMITED'  lastchangedat = zv_tsl )
( client ='200' legal_entity = '30026'  legal_entity_desc = 'TRACTEBEL ENGINEERING S.r.l. (IT)' lastchangedat = zv_tsl )
( client ='200' legal_entity = '30027'  legal_entity_desc = 'TRACTEBEL ENGINEERING S.A. (CL)'   lastchangedat = zv_tsl )
( client ='200' legal_entity = '41187'  legal_entity_desc = 'TRACTEBEL ENGINEERING MONACO S.A.R.L.' lastchangedat = zv_tsl )
( client ='200' legal_entity = '41249'  legal_entity_desc = 'TRACTEBEL ENGINEERING LTD (TH)'    lastchangedat = zv_tsl )
( client ='200' legal_entity = '43105'  legal_entity_desc = 'TRACTEBEL ENGINEERING S.A., DUBAI BRANCH'  lastchangedat = zv_tsl )
( client ='200' legal_entity = '43112'  legal_entity_desc = 'TRACTEBEL ENGINEERING S.A., SAUDI ARABIA BRANCH'   lastchangedat = zv_tsl )
( client ='200' legal_entity = '43188'  legal_entity_desc = 'TRACTEBEL ENGINEERING GMBH'    lastchangedat = zv_tsl )
( client ='200' legal_entity = '43356'  legal_entity_desc = 'COYNE ET BELLIER EL DJAZAIR'   lastchangedat = zv_tsl )
( client ='200' legal_entity = '43707'  legal_entity_desc = 'LAHMEYER INTERNATIONAL QATAR LLC'  lastchangedat = zv_tsl )
( client ='200' legal_entity = '43708'  legal_entity_desc = 'TRACTEBEL GKW GMBH'    lastchangedat = zv_tsl )
( client ='200' legal_entity = '43797'  legal_entity_desc = 'RED ENGINEERING DESIGN LIMITED'    lastchangedat = zv_tsl )
( client ='200' legal_entity = '43802'  legal_entity_desc = 'ENGIE Impact Pte. Ltd.'    lastchangedat = zv_tsl )
( client ='200' legal_entity = '44099'  legal_entity_desc = 'TRACTEBEL ENGINEERING CONSULTANCY LLC' lastchangedat = zv_tsl )
( client ='200' legal_entity = '44222'  legal_entity_desc = 'TRACTEBEL ENGINEERING GMBH NEPAL BRANCH'   lastchangedat = zv_tsl )
( client ='200' legal_entity = '44223'  legal_entity_desc = 'TRACTEBEL ENGINEERING GMBH EGYPT BRANCH'   lastchangedat = zv_tsl )
( client ='200' legal_entity = '44280'  legal_entity_desc = 'TRACTEBEL ENGINEERING GMBH BRANCH GREECE'  lastchangedat = zv_tsl )
( client ='200' legal_entity = '44306'  legal_entity_desc = 'GKW CONSULT SUCURSAL COLOMBIA' lastchangedat = zv_tsl )
( client ='200' legal_entity = '44339'  legal_entity_desc = 'LAHMEYER SAUDI ARABIA BRANCH'  lastchangedat = zv_tsl )
( client ='200' legal_entity = '44341'  legal_entity_desc = 'TRACTEBEL ENGINEERING GMBH QATAR BRANCH'   lastchangedat = zv_tsl )
( client ='200' legal_entity = '44342'  legal_entity_desc = 'TRACTEBEL ENGINEERING GMBH SUDAN BRANCH'   lastchangedat = zv_tsl )
( client ='200' legal_entity = '44344'  legal_entity_desc = 'TRACTEBEL ENGINEERING GMBH KENYA BRANCH'   lastchangedat = zv_tsl )
( client ='200' legal_entity = '44415'  legal_entity_desc = 'TRACTEBEL ENGINEERING LTDA., BOLIVIA BRANCH'   lastchangedat = zv_tsl )
( client ='200' legal_entity = '44419'  legal_entity_desc = 'TRACTEBEL ENGINEERING LTDA., MEXICO BRANCH'    lastchangedat = zv_tsl )
( client ='200' legal_entity = '44456'  legal_entity_desc = 'TRACTEBEL ENGINEERING GMBH PAKISTAN BRANCH'    lastchangedat = zv_tsl )
( client ='200' legal_entity = '44524'  legal_entity_desc = 'TRACTEBEL GKW TUNISIE' lastchangedat = zv_tsl )
( client ='200' legal_entity = '44525'  legal_entity_desc = 'TRACTEBEL GKW GMBH INDIA BRANCH OFFICE'    lastchangedat = zv_tsl )
( client ='200' legal_entity = '44526'  legal_entity_desc = 'TRACTEBEL GKW MAROC BRANCH'    lastchangedat = zv_tsl )
( client ='200' legal_entity = '45010'  legal_entity_desc = 'TRACTEBEL ENGINEERING GMBH SRI LANKA BRANCH'   lastchangedat = zv_tsl )
( client ='200' legal_entity = '45453'  legal_entity_desc = 'TRACTEBEL ENGINEERING S.A.R.L.'    lastchangedat = zv_tsl )
( client ='200' legal_entity = '45494'  legal_entity_desc = 'TRACTEBEL ENGINEERING GMBH ETHIOPIA BRANCH'    lastchangedat = zv_tsl )
( client ='200' legal_entity = '45562'  legal_entity_desc = 'ENGIE IMPACT BELGIUM SA'   lastchangedat = zv_tsl )
( client ='200' legal_entity = '45571'  legal_entity_desc = 'TRACTEBEL ENGINEERING GMBH JAKARTA'    lastchangedat = zv_tsl )
( client ='200' legal_entity = '46172'  legal_entity_desc = 'GKW CONSULT, TRADE REPRESENTATIVE BULGARIA'    lastchangedat = zv_tsl )
( client ='200' legal_entity = '46190'  legal_entity_desc = 'TRACTEBEL ENGINEERING GMBH KOREA OFFICE'   lastchangedat = zv_tsl )
( client ='200' legal_entity = '46197'  legal_entity_desc = 'Tractebel Engineering branch Guinée (TEG)' lastchangedat = zv_tsl )
( client ='200' legal_entity = '46199'  legal_entity_desc = 'TRACTEBEL ENGINEERING GMBH INDIA PE'   lastchangedat = zv_tsl )
( client ='200' legal_entity = '46212'  legal_entity_desc = 'TRACTEBEL ENGINEERING AUSTRALIA BRANCH'    lastchangedat = zv_tsl )
( client ='200' legal_entity = '46213'  legal_entity_desc = 'TRACTEBEL ENGINEERING ETHIOPIE BRANCH' lastchangedat = zv_tsl )
( client ='200' legal_entity = '46214'  legal_entity_desc = 'Etablissement stable TE France Royaume-Uni'    lastchangedat = zv_tsl )
( client ='200' legal_entity = '46222'  legal_entity_desc = 'TRACTEBEL ENGINEERING S.A., permanent establishment SOUTH AF'  lastchangedat = zv_tsl )
( client ='200' legal_entity = '46348'  legal_entity_desc = 'TRACTEBEL ENGINEERING GMBH UZBEKISTAN PE'  lastchangedat = zv_tsl )
( client ='200' legal_entity = '46691'  legal_entity_desc = 'RED Group Services DWC LLC'    lastchangedat = zv_tsl )
( client ='200' legal_entity = '99910'  legal_entity_desc = '99910-Delimited on 31.12.2020' lastchangedat = zv_tsl )
( client ='200' legal_entity = '99911'  legal_entity_desc = '99911-Delimited on 31.12.2020' lastchangedat = zv_tsl )
( client ='200' legal_entity = '99912'  legal_entity_desc = '99912-Delimited on 31.12.2020' lastchangedat = zv_tsl )
( client ='200' legal_entity = '99913'  legal_entity_desc = '99913-Delimited on 31.12.2020' lastchangedat = zv_tsl )
( client ='200' legal_entity = '99914'  legal_entity_desc = '99914-Delimited on 31.12.2020' lastchangedat = zv_tsl )
( client ='200' legal_entity = '99915'  legal_entity_desc = '99915-Delimited on 31.12.2020' lastchangedat = zv_tsl )
( client ='200' legal_entity = '99916'  legal_entity_desc = '99916-Delimited on 31.12.2020' lastchangedat = zv_tsl )

).

"Delete possible entries; insert new entries
DELETE FROM zsez_legalentity.

INSERT zsez_legalentity from table @lt_legal_entity.

"Check result in console
out->write( sy-dbcnt ).
out->write(  'DONE!' ).

  ENDMETHOD.

ENDCLASS.
