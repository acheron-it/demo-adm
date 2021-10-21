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

/**
* ARRANGE
**/
-- Made available in the Premium edition

/**
 * ACT - Create schemas
 */
USE    ROLE                     IDENTIFIER('RL_DWH_T_ADMIN');
USE    DATABASE                 IDENTIFIER('DB_DWH_T');
CREATE SCHEMA IF NOT EXISTS     IDENTIFIER('DWH_4_PUBLISH') WITH MANAGED ACCESS;

/**
 * ASSERT
 */
-- Made available in the Premium edition
