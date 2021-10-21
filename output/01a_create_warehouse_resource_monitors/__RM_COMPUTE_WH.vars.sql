/**
 * Derived from template: sf_create_warehouse_resource_monitor.sql.j2
 *
 * This script solely creates a default-sized warehouse per environment
 *
 * Jinja variables to set:
 **/
SET var_rl_god             = 'ACCOUNTADMIN';
SET var_rl_sys             = 'SYSADMIN';
SET var_wh                 = 'COMPUTE_WH';
SET var_rm                 = 'RM_COMPUTE_WH';
SET var_db_util            = 'UTIL_DB';
SET var_sch                = 'PUBLIC';
SET var_wh_global          = 'COMPUTE_WH';

/**
 * ARRANGE
 **/
-- Made available in the Premium version

/**
 * ACT
 */
USE    ROLE                     IDENTIFIER($var_rl_god);
  CREATE OR REPLACE RESOURCE MONITOR IDENTIFIER($var_rm)
  WITH CREDIT_QUOTA = 2,
  FREQUENCY = 'DAILY',
  START_TIMESTAMP = 'IMMEDIATELY',
  END_TIMESTAMP = null
    TRIGGERS
    ON 5 PERCENT DO NOTIFY
    ON 10 PERCENT DO NOTIFY
    ON 10 PERCENT DO NOTIFY
    ON 90 PERCENT DO SUSPEND
    ON 100 PERCENT DO SUSPEND_IMMEDIATE
    
  ;
  ALTER WAREHOUSE IDENTIFIER($var_wh) SET RESOURCE_MONITOR = $var_rm;

/**
 * ASSERT
 * Only the ACCOUNTADMIN has by default access to see this resource monitor
 */
-- Made available in the Premium version
