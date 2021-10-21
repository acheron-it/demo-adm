/**
 * Derived from template: sf_create_db.sql.j2
 *
 * This script solely creates database
 *
 * Creates a database, and give ADMIN user all the rights to it.
 * Sysadmin is still the owner
 *
 * Jinja variables to set:
 *  - var_env: ARRAY e.g. ["T", "A", "P"]
 *  - var_db_context: STRING e.g. "DWH" OR "MASKING_POC" so, without the DB_ prefix
 **/

SET var_rl_sys          = 'ACCOUNT_SYS_ADMIN';
SET var_db              = 'DB_DWH_T';
SET var_rl_adm          = 'RL_DWH_T_ADMIN';

/**
 * ARRANGE
 **/
-- Made available in the Premium version

/**
 * ACT - Create database
 **/
USE    ROLE                     IDENTIFIER($var_rl_sys);
CREATE DATABASE IF NOT EXISTS   IDENTIFIER($var_db);
GRANT ALL ON DATABASE           IDENTIFIER($var_db) TO ROLE IDENTIFIER($var_rl_adm);

/**
 * ASSERT
 **/
-- Made available in the Premium version
