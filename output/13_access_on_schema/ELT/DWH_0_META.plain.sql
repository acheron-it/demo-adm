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

/**
* ARRANGE
**/
-- Made available in the Premium version

/**
 * ACT
 *
 * Use the following query to see what future grants apply to this schema
 * SHOW FUTURE GRANTS IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_0_META');
 */
USE    ROLE                     IDENTIFIER('RL_DWH_T_ADMIN');
  GRANT USAGE                                   ON SCHEMA IDENTIFIER('DB_DWH_T.DWH_0_META')      TO   ROLE IDENTIFIER('RL_DWH_T_ELT');
  GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE,REFERENCES ON ALL TABLES                IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_0_META')      TO   ROLE IDENTIFIER('RL_DWH_T_ELT');
  GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE,REFERENCES ON FUTURE TABLES             IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_0_META')      TO   ROLE IDENTIFIER('RL_DWH_T_ELT');
  GRANT SELECT     ON ALL EXTERNAL TABLES       IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_0_META')      TO   ROLE IDENTIFIER('RL_DWH_T_ELT');
  GRANT SELECT     ON FUTURE EXTERNAL TABLES    IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_0_META')      TO   ROLE IDENTIFIER('RL_DWH_T_ELT');
  GRANT SELECT,REFERENCES ON ALL VIEWS                 IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_0_META')      TO   ROLE IDENTIFIER('RL_DWH_T_ELT');
  GRANT SELECT,REFERENCES ON FUTURE VIEWS              IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_0_META')      TO   ROLE IDENTIFIER('RL_DWH_T_ELT');
  GRANT SELECT     ON ALL MATERIALIZED VIEWS    IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_0_META')      TO   ROLE IDENTIFIER('RL_DWH_T_ELT');
  GRANT SELECT     ON FUTURE MATERIALIZED VIEWS IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_0_META')      TO   ROLE IDENTIFIER('RL_DWH_T_ELT');
  GRANT SELECT     ON ALL STREAMS               IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_0_META')      TO   ROLE IDENTIFIER('RL_DWH_T_ELT');
  GRANT SELECT     ON FUTURE STREAMS            IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_0_META')      TO   ROLE IDENTIFIER('RL_DWH_T_ELT');
  GRANT USAGE      ON ALL SEQUENCES             IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_0_META')      TO   ROLE IDENTIFIER('RL_DWH_T_ELT');
  GRANT USAGE      ON FUTURE SEQUENCES          IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_0_META')      TO   ROLE IDENTIFIER('RL_DWH_T_ELT');
  GRANT USAGE      ON ALL STAGES                IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_0_META')      TO   ROLE IDENTIFIER('RL_DWH_T_ELT');
  GRANT USAGE      ON FUTURE STAGES             IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_0_META')      TO   ROLE IDENTIFIER('RL_DWH_T_ELT');
  GRANT USAGE      ON ALL FILE FORMATS          IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_0_META')      TO   ROLE IDENTIFIER('RL_DWH_T_ELT');
  GRANT USAGE      ON FUTURE FILE FORMATS       IN SCHEMA IDENTIFIER('DB_DWH_T.DWH_0_META')      TO   ROLE IDENTIFIER('RL_DWH_T_ELT');
  

/**
 * VALIDATION
 */
-- Made available in the Premium version
