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


/**
 * ARRANGE
 */
-- Made available in the Premium edition

/**
 * ACT - Create named user
 **/
USE ROLE IDENTIFIER('SECURITYADMIN');
  CREATE USER IF NOT EXISTS IDENTIFIER('SNOWFLAKE_DEMO_USER1')
    PASSWORD = '****************'
    MUST_CHANGE_PASSWORD = TRUE
    DEFAULT_ROLE = 'PUBLIC'
    DEFAULT_NAMESPACE = ''
    EMAIL = 'info@acheron.cloud'
    DISPLAY_NAME = 'Snowflake demo user'
  ;

/**
 * ASSERT
 **/
-- Made available in the Premium edition

/**
 * ARRANGE
 */
-- Made available in the Premium edition

/**
 * ACT - Create named user
 **/
USE ROLE IDENTIFIER('SECURITYADMIN');
  CREATE USER IF NOT EXISTS IDENTIFIER('SNOWFLAKE_DEMO_USER2')
    PASSWORD = '****************'
    MUST_CHANGE_PASSWORD = TRUE
    DEFAULT_ROLE = 'PUBLIC'
    DEFAULT_NAMESPACE = ''
    EMAIL = 'info@acheron.cloud'
    DISPLAY_NAME = 'Snowflake demo user'
  ;

/**
 * ASSERT
 **/
-- Made available in the Premium edition
