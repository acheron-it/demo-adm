/**
 * Derived from template: sf_create_warehouse.sql.j2
 *
 * This script solely creates a default-sized warehouse per environment
 *
 * Jinja variables to set:
 *  - var_env: ARRAY e.g. ["T", "A", "P"]
 *  - var_sys: STRING e.g. "SYSADMIN"
 *  - var_wh: STRING e.g. "WH_DWH_ETL"
 *  - var_default_warehouse_size e.g. "XSMALL"
 **/

SET var_env             = 'T';
SET var_rl_sys          = 'SYSADMIN';
SET var_wh              = 'WH_DWH_T_ELT';

/**
 * ARRANGE
 **/
-- Made available in the Premium version

/**
 * ACT - Create warehouse
 **/
USE    ROLE                     IDENTIFIER($var_rl_sys);
  CREATE WAREHOUSE IF NOT EXISTS  IDENTIFIER($var_wh) WITH WAREHOUSE_SIZE = 'XSMALL';
  ALTER WAREHOUSE IDENTIFIER($var_wh) SET WAREHOUSE_TYPE = 'STANDARD';

/**
 * ASSERT
 **/
-- Made available in the Premium version

