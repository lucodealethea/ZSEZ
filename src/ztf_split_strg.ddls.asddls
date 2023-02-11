@EndUserText.label: 'Split Comma Separated String max 1333'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.type: #CLIENT_INDEPENDENT
// H2_11,H2_31
// SQLSCRIPT_STRING:SPLIT_TO_TABLE and BACK to STRING comma separated
//with cte_column as
//( SELECT BASE_MEMBER FROM "ZTF_SPLIT_STRG"('H2_11,H2_31'))
//select STRING_AGG(BASE_MEMBER, ',' ORDER BY BASE_MEMBER) as string_list
//FROM cte_column;
define table function ZTF_SPLIT_STRG
with parameters
p_nodename : rsdm4nodename
returns {
  base_member : uj_dim_member;
  }
  implemented by method zcl_amdp_split_strg=>strg_to_table;
