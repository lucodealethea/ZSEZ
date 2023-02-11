CLASS zcl_sez_fill_zsez_map_le DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   interfaces if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sez_fill_zsez_map_le IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: lt_map_legal_entity type table of ZSEZ_MAP_LE.

"read current timestamp
GET TIME STAMP FIELD DATA(zv_tsl).
"fill internal table
lt_map_legal_entity = VALUE #(

 ( client ='100' comp_code ='BE74' pers_area ='S75N' pers_sarea ='CPHT' legal_entity ='99916' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='RO94' pers_area ='S094' pers_sarea ='94BU' legal_entity ='13838' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='CZ77' pers_area ='S077' pers_sarea ='77PR' legal_entity ='13897' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE74' pers_area ='S74U' pers_sarea ='74AD' legal_entity ='14533' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE97' pers_area ='S097' pers_sarea ='CPHT' legal_entity ='14714' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='FRWA' pers_area ='S080' pers_sarea ='FRPA' legal_entity ='15268' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE74' pers_area ='S59B' pers_sarea ='CPSF' legal_entity ='15320' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE74' pers_area ='S074' pers_sarea ='EXPS' legal_entity ='15320' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE74' pers_area ='S075' pers_sarea ='CPEM' legal_entity ='15320' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE74' pers_area ='S074' pers_sarea ='CPEM' legal_entity ='15320' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE74' pers_area ='S75T' pers_sarea ='CPSF' legal_entity ='15320' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE74' pers_area ='S59A' pers_sarea ='CPHT' legal_entity ='15320' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE74' pers_area ='S59B' pers_sarea ='CPEM' legal_entity ='15320' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE74' pers_area ='S75N' pers_sarea ='CPSF' legal_entity ='15320' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE74' pers_area ='S59A' pers_sarea ='CPEM' legal_entity ='15320' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE74' pers_area ='S59A' pers_sarea ='CPSF' legal_entity ='15320' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE74' pers_area ='S075' pers_sarea ='CPSF' legal_entity ='15320' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE74' pers_area ='S75N' pers_sarea ='CPEM' legal_entity ='15320' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE74' pers_area ='S074' pers_sarea ='CPSF' legal_entity ='15320' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE74' pers_area ='S074' pers_sarea ='CPET' legal_entity ='15320' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE74' pers_area ='S074' pers_sarea ='CPHT' legal_entity ='15320' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE74' pers_area ='S74M' pers_sarea ='CPSF' legal_entity ='15320' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE76' pers_area ='SY76' pers_sarea ='CPEM' legal_entity ='15321' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE76' pers_area ='SY76' pers_sarea ='CPET' legal_entity ='15321' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE76' pers_area ='SY76' pers_sarea ='EXPS' legal_entity ='15321' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE76' pers_area ='SY76' pers_sarea ='CPSF' legal_entity ='15321' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE76' pers_area ='SY76' pers_sarea ='CPHT' legal_entity ='15321' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='IN93' pers_area ='S93J' pers_sarea ='93CH' legal_entity ='15618' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='IN93' pers_area ='S93J' pers_sarea ='93NM' legal_entity ='15618' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='IN93' pers_area ='S93J' pers_sarea ='93PG' legal_entity ='15618' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='IN93' pers_area ='S93J' pers_sarea ='93KO' legal_entity ='15618' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='IN93' pers_area ='S93J' pers_sarea ='93KL' legal_entity ='15618' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='IN93' pers_area ='S93J' pers_sarea ='93BM' legal_entity ='15618' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='IN93' pers_area ='S93J' pers_sarea ='93BE' legal_entity ='15618' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='IN93' pers_area ='S93J' pers_sarea ='93NP' legal_entity ='15618' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='IN93' pers_area ='S93J' pers_sarea ='93GO' legal_entity ='15618' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='IN93' pers_area ='S93J' pers_sarea ='93AS' legal_entity ='15618' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='IN93' pers_area ='S93J' pers_sarea ='93NC' legal_entity ='15618' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='IN93' pers_area ='S93J' pers_sarea ='93GU' legal_entity ='15618' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BR02' pers_area ='S92H' pers_sarea ='02JI' legal_entity ='15619' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BR02' pers_area ='S92H' pers_sarea ='02BA' legal_entity ='15619' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BR02' pers_area ='S92H' pers_sarea ='02BE' legal_entity ='15619' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BR02' pers_area ='S92H' pers_sarea ='02RJ' legal_entity ='15619' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BR02' pers_area ='S92H' pers_sarea ='02BH' legal_entity ='15619' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BR02' pers_area ='S92H' pers_sarea ='02FL' legal_entity ='15619' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='FRWA' pers_area ='S08N' pers_sarea ='FRAJ' legal_entity ='17313' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='IT96' pers_area ='S096' pers_sarea ='96MI' legal_entity ='30026' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='IT96' pers_area ='S096' pers_sarea ='96RO' legal_entity ='30026' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='CL65' pers_area ='S065' pers_sarea ='65SC' legal_entity ='30027' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='FRWA' pers_area ='S08M' pers_sarea ='FRMO' legal_entity ='41187' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='TH59' pers_area ='S59T' pers_sarea ='59BK' legal_entity ='41249' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE74' pers_area ='S74U' pers_sarea ='74DU' legal_entity ='43105' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE74' pers_area ='S74S' pers_sarea ='74RH' legal_entity ='43112' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='DE90' pers_area ='2000' pers_sarea ='006W' legal_entity ='43188' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='FRWA' pers_area ='S08A' pers_sarea ='FRAL' legal_entity ='43356' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE74' pers_area ='S74Q' pers_sarea ='74DO' legal_entity ='43707' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='DE91' pers_area ='2300' pers_sarea ='08BW' legal_entity ='43708' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='GB41' pers_area ='S41A' pers_sarea ='4101' legal_entity ='43797' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='SG43' pers_area ='S43A' pers_sarea ='4301' legal_entity ='43802' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE74' pers_area ='S74O' pers_sarea ='74MU' legal_entity ='44099' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='DE90' pers_area ='2008' pers_sarea ='200V' legal_entity ='44222' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='DE90' pers_area ='2008' pers_sarea ='200K' legal_entity ='44223' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='DE90' pers_area ='2008' pers_sarea ='200D' legal_entity ='44280' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='DE91' pers_area ='2308' pers_sarea ='230D' legal_entity ='44306' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='DE90' pers_area ='2008' pers_sarea ='200G' legal_entity ='44339' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='DE90' pers_area ='2008' pers_sarea ='200E' legal_entity ='44341' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='DE90' pers_area ='2008' pers_sarea ='200F' legal_entity ='44342' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='DE90' pers_area ='2008' pers_sarea ='200S' legal_entity ='44344' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BR02' pers_area ='S92B' pers_sarea ='02LA' legal_entity ='44415' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BR02' pers_area ='S92M' pers_sarea ='02ME' legal_entity ='44419' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='DE90' pers_area ='2008' pers_sarea ='200O' legal_entity ='44456' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='DE91' pers_area ='2308' pers_sarea ='230C' legal_entity ='44524' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='DE91' pers_area ='2308' pers_sarea ='230I' legal_entity ='44525' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='DE91' pers_area ='2308' pers_sarea ='230E' legal_entity ='44526' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='DE90' pers_area ='2008' pers_sarea ='200N' legal_entity ='45010' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='FRWA' pers_area ='S08I' pers_sarea ='FRAB' legal_entity ='45453' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='DE90' pers_area ='2008' pers_sarea ='200X' legal_entity ='45494' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE95' pers_area ='S95A' pers_sarea ='CPEM' legal_entity ='45562' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE95' pers_area ='S95A' pers_sarea ='CPHT' legal_entity ='45562' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE95' pers_area ='S95A' pers_sarea ='CPSF' legal_entity ='45562' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='DE90' pers_area ='2008' pers_sarea ='200H' legal_entity ='45571' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='DE91' pers_area ='2308' pers_sarea ='230A' legal_entity ='46172' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='DE90' pers_area ='2008' pers_sarea ='200T' legal_entity ='46190' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='FRWA' pers_area ='S08G' pers_sarea ='FRCO' legal_entity ='46197' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='DE90' pers_area ='2008' pers_sarea ='200L' legal_entity ='46199' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='FRWA' pers_area ='S08C' pers_sarea ='FRCA' legal_entity ='46212' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='FRWA' pers_area ='S08E' pers_sarea ='FRAA' legal_entity ='46213' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='FRWA' pers_area ='S08U' pers_sarea ='FRLO' legal_entity ='46214' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='BE74' pers_area ='S74Z' pers_sarea ='74CT' legal_entity ='46222' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='DE90' pers_area ='2008' pers_sarea ='200Y' legal_entity ='46348' lastchangedat =  zv_tsl  )
 ( client ='100' comp_code ='AE42' pers_area ='S42A' pers_sarea ='4201' legal_entity ='46691' lastchangedat =  zv_tsl  )

).
"Delete possible entries; insert new entries
DELETE FROM zsez_map_le.

INSERT zsez_map_le from table @lt_map_legal_entity.

"Check result in console
out->write( sy-dbcnt ).
out->write(  'DONE!' ).
  ENDMETHOD.

ENDCLASS.
