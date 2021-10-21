/**
 * Derived from template: sf_create_role_only.sql.j2
 *
 * Creates only a role
 *
 * Jinja variables to set:
 *  - var_rl: STRING e.g. ACCOUNT_ROLE_ADMIN
 **/
SET var_rl_user         = 'USERADMIN';
SET var_rl_new          = 'ACCOUNT_SYS_ADMIN';
SET var_rl_par          = 'SYSADMIN';

/**
 * ARRANGE
 */
-- Made available in the Premium edition

/**
 * ACT - Create the role and assign it to the SYSADMIN user
 */
USE ROLE IDENTIFIER($var_rl_user);
  CREATE ROLE IF NOT EXISTS IDENTIFIER($var_rl_new);
  GRANT  ROLE               IDENTIFIER($var_rl_new) TO ROLE IDENTIFIER($var_rl_par);