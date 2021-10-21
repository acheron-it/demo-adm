/**
 * Derived from template: sf_grant_permissions_on_database.sql.j2
 *
 * This script solely creates schemas for data that is classified as being non-secure
 *
 * Jinja variables to set:
 **/


/**
 * ENVIRONMENT: T
 */
SET var_rl_sec               = 'SECURITYADMIN';
SET var_rl_sys               = 'ACCOUNT_SYS_ADMIN';
SET var_db                   = 'DB_DWH_T';
SET var_rl_curr              = 'RL_DWH_T_ELT';

/**
* ARRANGE
**/
-- Made available in the Premium version

/**
 * ACT
 *
 * Use the following query to see what future grants apply to this schema
 */
USE    ROLE                     IDENTIFIER($var_rl_sys);
  GRANT USAGE                                   ON DATABASE IDENTIFIER($var_db)                  TO   ROLE IDENTIFIER($var_rl_curr);

/**
 * VALIDATION
 */
-- Made available in the Premium version