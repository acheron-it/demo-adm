/**
 * Derived from template: sf_create_warehouse_resource_monitor.sql.j2
 *
 * This script solely creates a default-sized warehouse per environment
 *
 * Jinja variables to set:
 **/

/**
 * ARRANGE
 **/
-- Made available in the Premium version

/**
 * ACT
 */
USE    ROLE                     IDENTIFIER('ACCOUNTADMIN');
  CREATE OR REPLACE RESOURCE MONITOR IDENTIFIER('RM_COMPUTE_WH')
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
  ALTER WAREHOUSE IDENTIFIER('COMPUTE_WH') SET RESOURCE_MONITOR = 'RM_COMPUTE_WH';

/**
 * ASSERT
 * Only the ACCOUNTADMIN has by default access to see this resource monitor
 */
-- Made available in the Premium version

