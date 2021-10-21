/**
 * Derived from template: sf_create_adm_user.sql.j2
 *
 * This script solely creates admin user
 *
 * The default role will be set where the role is created
 *
 * Jinja variables to set:
 *  - var_user_name: STRING e.g. "adm_user"
 *  - var_user_email: STRING e.g. "info@acheron.cloud"
 *  - var_wh_default: STRING e.g. "WH_DEMO"
 **/


/**
 * ARRANGE
 **/
-- Made available in the Premium version

/**
 * ACT - Create user
 **/
USE ROLE IDENTIFIER('SECURITYADMIN');
  CREATE USER IF NOT EXISTS IDENTIFIER('ADM_DEMO_USER')
    PASSWORD             = '*****'
    COMMENT              = 'ADM account'
    LOGIN_NAME           = 'ADM_DEMO_USER'
    DISPLAY_NAME         = 'ADM_DEMO_USER'
    MUST_CHANGE_PASSWORD = FALSE
    DEFAULT_ROLE         = 'SECURITYADMIN'
    DEFAULT_WAREHOUSE    = 'NULL'
    EMAIL                = 'info@acheron.cloud'
  ;
GRANT ROLE IDENTIFIER('SECURITYADMIN') TO USER IDENTIFIER('ADM_DEMO_USER');

/**
 * ASSERT
 **/
-- Made available in the Premium version
