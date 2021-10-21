/**
 * Derived from template: sf_grant_role_to_user.sql.j2
 *
 * This script solely assigns data scientists, analists and PBI-users to a role that has schema access.
 *
 * Jinja variables to set:
 *  - var_rl: STRING e.g. SECURITYADMIN
 *  - var_users: ARRAY e.g. ["userA", "userB"]
 **/

/**
 * ARRANGE
 **/
-- Made available in the Premium version

/**
 * ACT - Grant user to role
 **/
USE ROLE IDENTIFIER('SECURITYADMIN');
  GRANT ROLE IDENTIFIER('ACCOUNT_SYS_ADMIN') TO USER ADM_DEMO_USER;
  GRANT ROLE IDENTIFIER('ACCOUNT_SYS_ADMIN') TO USER SF_ACHERON_DBT_USER;
  
