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

/**
* ARRANGE
**/
-- Made available in the Premium version

/**
 * ACT
 *
 * Use the following query to see what future grants apply to this schema
 */
USE    ROLE                     IDENTIFIER('ACCOUNT_SYS_ADMIN');
  GRANT USAGE                                   ON DATABASE IDENTIFIER('DB_DWH_T')                  TO   ROLE IDENTIFIER('RL_DWH_T_ELT');

/**
 * VALIDATION
 */
-- Made available in the Premium version
