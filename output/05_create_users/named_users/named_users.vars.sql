/**
 * Derived from template: sf_create_named_user.sql.j2
 *
 * The default role will be set where the role is created
 *
 * Jinja variables to set:
 *  - var_user_name: STRING e.g. "userA"
 *  - var_display_name: STRING e.g. "User A"
 *  - var_user_email: STRING e.g. "userA@acheron.cloud"
 **/

UNSET (var_user_name, var_user_email);
SET var_user_name       = 'SNOWFLAKE_DEMO_USER1';
SET var_display_name    = 'Snowflake demo user';
SET var_user_email      = 'info@acheron.cloud';
SET var_rl_sec          = 'SECURITYADMIN';

/**
 * ARRANGE
 */
-- Made available in the Premium edition

/**
 * ACT - Create named user
 **/
USE ROLE IDENTIFIER($var_rl_sec);
  CREATE USER IF NOT EXISTS IDENTIFIER($var_user_name)
    PASSWORD = '****************'
    MUST_CHANGE_PASSWORD = TRUE
    DEFAULT_ROLE = 'PUBLIC'
    DEFAULT_NAMESPACE = ''
    EMAIL = $var_user_email
    DISPLAY_NAME = $var_display_name
  ;

/**
 * ASSERT
 **/
-- Made available in the Premium edition
UNSET (var_user_name, var_user_email);
SET var_user_name       = 'SNOWFLAKE_DEMO_USER2';
SET var_display_name    = 'Snowflake demo user';
SET var_user_email      = 'info@acheron.cloud';
SET var_rl_sec          = 'SECURITYADMIN';

/**
 * ARRANGE
 */
-- Made available in the Premium edition

/**
 * ACT - Create named user
 **/
USE ROLE IDENTIFIER($var_rl_sec);
  CREATE USER IF NOT EXISTS IDENTIFIER($var_user_name)
    PASSWORD = '****************'
    MUST_CHANGE_PASSWORD = TRUE
    DEFAULT_ROLE = 'PUBLIC'
    DEFAULT_NAMESPACE = ''
    EMAIL = $var_user_email
    DISPLAY_NAME = $var_display_name
  ;

/**
 * ASSERT
 **/
-- Made available in the Premium edition