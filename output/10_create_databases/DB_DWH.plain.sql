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


/**
 * ARRANGE
 **/
-- Made available in the Premium version

/**
 * ACT - Create database
 **/
USE    ROLE                     IDENTIFIER('ACCOUNT_SYS_ADMIN');
CREATE DATABASE IF NOT EXISTS   IDENTIFIER('DB_DWH_T');
GRANT ALL ON DATABASE           IDENTIFIER('DB_DWH_T') TO ROLE IDENTIFIER('RL_DWH_T_ADMIN');

/**
 * ASSERT
 **/
-- Made available in the Premium version

