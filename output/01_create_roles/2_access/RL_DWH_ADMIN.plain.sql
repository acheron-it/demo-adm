/**
 * Derived from template: sf_create_role_only.sql.j2
 *
 * Creates only a role
 *
 * Jinja variables to set:
 *  - var_rl: STRING e.g. ACCOUNT_ROLE_ADMIN
 **/


/**
 * ARRANGE
 */
-- Made available in the Premium edition

/**
 * ACT - Create the role and assign it to the SYSADMIN user
 */
USE ROLE IDENTIFIER('USERADMIN');
  CREATE ROLE IF NOT EXISTS IDENTIFIER('RL_DWH_T_ADMIN');
  GRANT  ROLE               IDENTIFIER('RL_DWH_T_ADMIN') TO ROLE IDENTIFIER('ACCOUNT_SYS_ADMIN');

