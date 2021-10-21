/**
 * An example of how a unit test could be build
 **/

SET var_rl =          'RL_DWH_T_ELT';
SET var_wh =          'WH_DWH_T_ELT';
SET var_db =          'DB_DWH_T';
SET var_sch_raw =     'DWH_1_RAW';
SET var_sch_dd =      'DWH_2_DD';
SET var_sch_da =      'DWH_3_DA';
SET var_sch_meta =    'DWH_0_META';
SET var_assert_db =   'UTIL_DB';
SET var_assert_sch =  'PUBLIC';
SET var_meta_tabel =  'JIRA_SPRINTS';
SET var_tab_max =     'META_TABLE_FOR_MAX_VALUES';

show variables;

USE ROLE IDENTIFIER($var_rl);
USE WAREHOUSE IDENTIFIER($var_wh);

/**
 * We expect that "META_DATA_PER_SOURCE" contains records for the table we are testing.
 *
 * In case this check fails, perform the following steps:
 * - Configure ETL-job X
 * - Next, run ETL-job X
 */
USE DATABASE IDENTIFIER($var_db);
USE SCHEMA IDENTIFIER($var_sch_meta);
SELECT * FROM "META_DATA_PER_SOURCE"
WHERE META_SOURCE = $var_meta_tabel
;
  -- Expected result: the above query should return one record
  SET var_actual = (SELECT count(*) FROM table(result_scan(last_query_id())));
  SELECT UTIL_DB.PUBLIC.assert($var_actual, 1);


SET var_raw_tabel = (SELECT TABLE_NAME_RAW FROM "DWH_0_META"."META_DATA_PER_SOURCE" WHERE META_SOURCE = $var_meta_tabel);
show variables like 'var_raw_tabel';
  -- Expected result: the above query should return one record
  SET var_actual = (SELECT count(*) FROM table(result_scan(last_query_id())));
  SELECT UTIL_DB.PUBLIC.assert($var_actual, 1);

SET var_raw_tabel = (SELECT TABLE_NAME_RAW FROM "DWH_0_META"."META_DATA_PER_SOURCE" WHERE META_SOURCE = $var_meta_tabel);
show variables like 'var_raw_tabel';
  -- Expected result: the above query should return one record
  SET var_actual = (SELECT count(*) FROM table(result_scan(last_query_id())));
  SELECT UTIL_DB.PUBLIC.assert($var_actual, 1);


SET var_dd_tabel = (SELECT TABLE_NAME_REFINED FROM "DWH_0_META"."META_DATA_PER_SOURCE" WHERE META_SOURCE = $var_meta_tabel);
show variables like 'var_dd_tabel';
  -- Expected result: the above query should return one record
  SET var_actual = (SELECT count(*) FROM table(result_scan(last_query_id())));
  SELECT UTIL_DB.PUBLIC.assert($var_actual, 1);

/****************************************************************************
 * STEP 1: VALIDATE THE RAW LAYER
 ****************************************************************************/

/**
 * We expect files to be loaded that match a predefined regular expression
 *
 * BACKGROUND
 * Only files that match the regular expression will be loaded
 */
USE DATABASE IDENTIFIER($var_db);
USE SCHEMA IDENTIFIER($var_sch_meta);
SELECT INPUT_REGULAR_EXPR
FROM "META_DATA_PER_SOURCE"
WHERE META_SOURCE = $var_meta_tabel;
  -- Expected result: the above query should return one record
  SET var_actual = (SELECT count(*) FROM table(result_scan(last_query_id())));
  SELECT UTIL_DB.PUBLIC.assert($var_actual, 1);

/**
 * Validate that the table holds at least one record
 */
USE DATABASE IDENTIFIER($var_db);
USE SCHEMA IDENTIFIER($var_sch_raw);
show variables like 'var_raw_tabel';
SELECT * FROM IDENTIFIER($var_raw_tabel) LIMIT 1;
  -- Expected result: we expect one row to be returned
  SET var_actual = (SELECT count(*) FROM table(result_scan(last_query_id())));
  SELECT UTIL_DB.PUBLIC.assert($var_actual, 1);

/**
 * Validate that the table holds 500 columns
 */
show columns like 'C%' in table IDENTIFIER($var_raw_tabel);
  -- Expected result: we expect 500 records to be returned with the prefix C000
  SET var_actual = (SELECT count(*) FROM table(result_scan(last_query_id())));
  SELECT UTIL_DB.PUBLIC.assert($var_actual, 500);

/**
 * If there are files ready to be loaded,
 * Run the ELT-job Y
 * Don't forget to SET a load-job!!
 */