/**
 * Derived from template: create_func_user_for_application.sql.j2
 * 
 * This script solely creates functional users
 * 
 * Jinja variables to set:
 *  - var_env_list: ARRAY e.g. ["T", "A", "P"]
 *  - var_context: STRING e.g. "DWH"
 *  - var_app: STRING e.g. "WEB-APP"
 *  - var_func_descr: STRING e.g. "SHOW-CUSTOMERS"
 *  - var_sf_user_email: STRING e.g. "info@acheron.cloud"
 **/


/** 
 * Prerequiresites
 **/
USE ROLE                    IDENTIFIER('SECURITYADMIN');

/** 
 * Create user
 **/
BEGIN;
  -- DEFAULT_WAREHOUSE is set where the default role is initiated
  -- DEFAULT_ROLE is set where the default role is initiated
  USE ROLE                  IDENTIFIER('SECURITYADMIN');
  CREATE USER IF NOT EXISTS IDENTIFIER('SF_ACHERON_AUTO_EXECUTER')
    PASSWORD             = '****************'
    MUST_CHANGE_PASSWORD = FALSE
    DEFAULT_ROLE         = 'PUBLIC'
    DEFAULT_WAREHOUSE    = NULL
  ;
  ALTER USER IDENTIFIER('SF_ACHERON_AUTO_EXECUTER') SET COMMENT              = 'Snowflake-user SF_ACHERON_AUTO_EXECUTER';
  ALTER USER IDENTIFIER('SF_ACHERON_AUTO_EXECUTER') SET LOGIN_NAME           = 'SF_ACHERON_AUTO_EXECUTER';
  ALTER USER IDENTIFIER('SF_ACHERON_AUTO_EXECUTER') SET DISPLAY_NAME         = 'SF_ACHERON_AUTO_EXECUTER';
  ALTER USER IDENTIFIER('SF_ACHERON_AUTO_EXECUTER') SET FIRST_NAME           = 'SF_ACHERON_AUTO_EXECUTER';
  ALTER USER IDENTIFIER('SF_ACHERON_AUTO_EXECUTER') SET EMAIL                = 'info@acheron.cloud';
-- ALTER USER IDENTIFIER('SF_ACHERON_AUTO_EXECUTER') RESET PASSWORD; <-- place password in the Secret Manager
COMMIT;

/**
 * Validation
 **/
USE ROLE               IDENTIFIER('SECURITYADMIN');
  DESCRIBE USER          IDENTIFIER('SF_ACHERON_AUTO_EXECUTER');
  

