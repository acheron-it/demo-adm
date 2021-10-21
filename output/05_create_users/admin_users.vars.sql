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

UNSET (var_rl_sec, var_user_name, var_user_email, var_wh_default);
SET var_rl_sec          = 'SECURITYADMIN';
SET var_user_name       = 'ADM_DEMO_USER';
SET var_user_email      = 'info@acheron.cloud';
SET var_wh_default      = 'NULL';

/**
 * ARRANGE
 **/
-- Made available in the Premium version

/**
 * ACT - Create user
 **/
USE ROLE IDENTIFIER($var_rl_sec);
  CREATE USER IF NOT EXISTS IDENTIFIER($var_user_name)
    PASSWORD             = '*****'
    COMMENT              = 'ADM account'
    LOGIN_NAME           = $var_user_name
    DISPLAY_NAME         = $var_user_name
    MUST_CHANGE_PASSWORD = FALSE
    DEFAULT_ROLE         = $var_rl_sec
    DEFAULT_WAREHOUSE    = $var_wh_default
    EMAIL                = $var_user_email
  ;
GRANT ROLE IDENTIFIER($var_rl_sec) TO USER IDENTIFIER($var_user_name);

/**
 * ASSERT
 **/
-- Made available in the Premium version