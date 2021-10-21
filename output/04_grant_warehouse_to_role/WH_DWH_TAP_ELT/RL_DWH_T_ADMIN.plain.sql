/**
 * Derived from template: sf_grant_wh_to_role.sql.j2
 *
 * This script solely creates a role and adds users
 *
 * Jinja variables to set:
 *  - var_env: STRING e.g. "T"
 *  - var_context: STRING e.g. "DWH" so, without the DB_ prefix
 *  - var_wh_usecase: STRING e.g. "ETL"
 *  - var_rl_type: STRING e.g. ELT
 **/



/**
 * ARRANGE
 **/
-- Made available in the Premium version

/**
 * ACT - Grant usage on warehouse to role
 **/
USE    ROLE               IDENTIFIER('SYSADMIN');

GRANT USAGE, OPERATE ON WAREHOUSE  IDENTIFIER('WH_DWH_T_ELT') TO ROLE IDENTIFIER('RL_DWH_T_ADMIN');

/**
 * ASSERT
 **/
-- Made available in the Premium version

