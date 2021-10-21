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


UNSET (var_rl_sec, var_rl_sys, var_rl, var_wh, var_sf_user);
SET var_env             = 'T';
SET var_rl_sec          = 'SECURITYADMIN';
SET var_rl_sys          = 'SYSADMIN';
SET var_rl              = 'RL_DWH_T_ADMIN';
SET var_wh              = 'WH_DWH_T_ELT';

/**
 * ARRANGE
 **/
-- Made available in the Premium version

/**
 * ACT - Grant usage on warehouse to role
 **/
USE    ROLE               IDENTIFIER($var_rl_sys);

GRANT USAGE, OPERATE ON WAREHOUSE  IDENTIFIER($var_wh) TO ROLE IDENTIFIER($var_rl);

/**
 * ASSERT
 **/
-- Made available in the Premium version
