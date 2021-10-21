/**
 * Derived from template: sf_grant_role_to_user.sql.j2
 *
 * This script solely assigns data scientists, analists and PBI-users to a role that has schema access.
 *
 * Jinja variables to set:
 *  - var_rl: STRING e.g. SECURITYADMIN
 *  - var_users: ARRAY e.g. ["userA", "userB"]
 **/
UNSET (var_rl_sec, var_rl_sec, var_rl);
SET var_rl_sec          = 'SECURITYADMIN';
SET var_rl              = 'RL_DWH_T_ADMIN';

/**
 * ARRANGE
 **/
-- Made available in the Premium version

/**
 * ACT - Grant user to role
 **/
USE ROLE IDENTIFIER($var_rl_sec);
  GRANT ROLE IDENTIFIER($var_rl) TO USER ADM_DEMO_USER;
  