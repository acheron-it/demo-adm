/**
 * Derived from template: sf_create_schema.sql.j2
 *
 * This script solely creates schemas for data that is classified as being non-secure
 *
 * Jinja variables to set:
 *  - var_env_list: ARRAY e.g. ["T", "A", "P"]
 *  - var_context: STRING e.g. "DWH" (used in the Database Name)
 *  - var_sch: STRING e.g. "generic" (schema to give access to)
 *  - var_data_retention_days INTEGER e.g. "14"
 **/


/**
 * ENVIRONMENT: T
 */
SET var_rl_sec               = 'SECURITYADMIN';
SET var_rl_sys               = 'SYSADMIN';
SET var_rl_adm               = 'RL_DWH_T_ADMIN';
SET var_db                   = 'DB_DWH_T';
SET var_sch                  = 'DWH_5_TEMP';
SET var_data_retention_days  = '14';

/**
* ARRANGE
**/
-- Made available in the Premium edition

/**
 * ACT - Create schemas
 */
USE    ROLE                     IDENTIFIER($var_rl_adm);
USE    DATABASE                 IDENTIFIER($var_db);
CREATE SCHEMA IF NOT EXISTS     IDENTIFIER($var_sch) WITH MANAGED ACCESS;

/**
 * ASSERT
 */
-- Made available in the Premium edition