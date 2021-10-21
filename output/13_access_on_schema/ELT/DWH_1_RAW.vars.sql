/**
 * Derived from template: sf_grant_permissions_on_schema.sql.j2
 *
 * This script solely creates schemas for data that is classified as being non-secure
 *
 * Jinja variables to set:
 **/


/**
 * ENVIRONMENT: T
 */
SET var_rl_sec               = 'SECURITYADMIN';
SET var_rl_sys               = 'SYSADMIN';
SET var_rl_adm               = 'RL_DWH_T_ADMIN';
SET var_db                   = 'DB_DWH_T';
SET var_sch                  = 'DWH_1_RAW';
SET var_rl_curr              = 'RL_DWH_T_ELT';

/**
* ARRANGE
**/
-- Made available in the Premium version

/**
 * ACT
 *
 * Use the following query to see what future grants apply to this schema
 * SHOW FUTURE GRANTS IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_1_RAW');
 */
USE    ROLE                     IDENTIFIER($var_rl_adm);
  GRANT USAGE                                   ON SCHEMA IDENTIFIER('DB_DWH_T.DWH_1_RAW')       TO   ROLE IDENTIFIER($var_rl_curr);
  GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE,REFERENCES ON ALL TABLES                IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_1_RAW')       TO   ROLE IDENTIFIER($var_rl_curr);
  GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE,REFERENCES ON FUTURE TABLES             IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_1_RAW')       TO   ROLE IDENTIFIER($var_rl_curr);
  GRANT SELECT     ON ALL EXTERNAL TABLES       IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_1_RAW')       TO   ROLE IDENTIFIER($var_rl_curr);
  GRANT SELECT     ON FUTURE EXTERNAL TABLES    IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_1_RAW')       TO   ROLE IDENTIFIER($var_rl_curr);
  GRANT SELECT,REFERENCES ON ALL VIEWS                 IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_1_RAW')       TO   ROLE IDENTIFIER($var_rl_curr);
  GRANT SELECT,REFERENCES ON FUTURE VIEWS              IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_1_RAW')       TO   ROLE IDENTIFIER($var_rl_curr);
  GRANT SELECT     ON ALL MATERIALIZED VIEWS    IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_1_RAW')       TO   ROLE IDENTIFIER($var_rl_curr);
  GRANT SELECT     ON FUTURE MATERIALIZED VIEWS IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_1_RAW')       TO   ROLE IDENTIFIER($var_rl_curr);
  GRANT SELECT     ON ALL STREAMS               IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_1_RAW')       TO   ROLE IDENTIFIER($var_rl_curr);
  GRANT SELECT     ON FUTURE STREAMS            IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_1_RAW')       TO   ROLE IDENTIFIER($var_rl_curr);
  GRANT USAGE      ON ALL SEQUENCES             IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_1_RAW')       TO   ROLE IDENTIFIER($var_rl_curr);
  GRANT USAGE      ON FUTURE SEQUENCES          IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_1_RAW')       TO   ROLE IDENTIFIER($var_rl_curr);
  GRANT USAGE      ON ALL STAGES                IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_1_RAW')       TO   ROLE IDENTIFIER($var_rl_curr);
  GRANT USAGE      ON FUTURE STAGES             IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_1_RAW')       TO   ROLE IDENTIFIER($var_rl_curr);
  GRANT USAGE      ON ALL FILE FORMATS          IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_1_RAW')       TO   ROLE IDENTIFIER($var_rl_curr);
  GRANT USAGE      ON FUTURE FILE FORMATS       IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_1_RAW')       TO   ROLE IDENTIFIER($var_rl_curr);
  

/**
 * VALIDATION
 */
-- Made available in the Premium version