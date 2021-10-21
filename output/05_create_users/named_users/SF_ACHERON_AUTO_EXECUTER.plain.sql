/**
 * Derived from template: sf_create_func_user_for_application.sql.j2
 *
 * This script solely creates functional users
 *
 * Jinja variables to set:
 *  - var_env_list (OPTIONAL): ARRAY e.g. ["T", "A", "P"]
 *  - var_preferred_db (OPTIONAL): STRING e.g. "DB_DWH_T"
 *  - var_sf_user_name: STRING e.g. "SF_MATILLION_T"
 *  - var_sf_user_email: STRING e.g. "info@acheron.cloud"
 *  - var_public_key (OPTIONAL): STRING e.g. "public key", used for authentication
 **/
-- TODO: Assignment to 'VAR_PUBLIC_KEY' not done because value exceeds size limit for variables. Its size is 392; the limit is 256 (internal storage size in bytes).
/**
 * ARRANGE
 **/
-- Made available in the Premium edition

/**
 * ACT - Create user
 **/
BEGIN;
  -- DEFAULT_WAREHOUSE is set where the default role is initiated
  -- DEFAULT_ROLE is set where the default role is initiated
  USE ROLE                  IDENTIFIER('SECURITYADMIN');
  CREATE USER IF NOT EXISTS IDENTIFIER('SF_ACHERON_AUTO_EXECUTER')
    PASSWORD             = '****************'
    MUST_CHANGE_PASSWORD = FALSE
    DEFAULT_ROLE         = 'PUBLIC'
    DEFAULT_WAREHOUSE    = NULL
  ;
  ALTER USER IDENTIFIER('SF_ACHERON_AUTO_EXECUTER') SET COMMENT              = 'Snowflake-user SF_ACHERON_AUTO_EXECUTER';
  ALTER USER IDENTIFIER('SF_ACHERON_AUTO_EXECUTER') SET LOGIN_NAME           = 'SF_ACHERON_AUTO_EXECUTER';
  ALTER USER IDENTIFIER('SF_ACHERON_AUTO_EXECUTER') SET DISPLAY_NAME         = 'SF_ACHERON_AUTO_EXECUTER';
  ALTER USER IDENTIFIER('SF_ACHERON_AUTO_EXECUTER') SET FIRST_NAME           = 'SF_ACHERON_AUTO_EXECUTER';
  ALTER USER IDENTIFIER('SF_ACHERON_AUTO_EXECUTER') SET DEFAULT_NAMESPACE    = 'UTIL_DB';
  ALTER USER IDENTIFIER('SF_ACHERON_AUTO_EXECUTER') SET RSA_PUBLIC_KEY       = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAymfJioOxd0DwFgCwoxx80EmBvBbnx7cekoakZAiO1juKsdbkjDczXRfB5ddJEHXtKEwSnAgXaPBsLrwFOSxvMpsZE4bn2wCSY9OqVz17oLy+eVw6cWWVYcRKuq0Jo5mUh1C1bS3AoqmODhk3fA/cC/XR2AxKlQJbLoiJB9L/GdcAdCQvwdl/RaOVqTQStAHdTHqiJI+NFiq/9uBSkvTKNqgD8Gt9mhtU3xGARGJMFv1KP3xv2ubYAs/n5DkgsHcSUlExZRz+Nirn874IzDj2EMl/89GrDCrZQM72Zyp4htw+HmnoGmjR6Xv2PoKy5JUgPnWhxS59dQtllWQio8qC8wIDAQAB';
  ALTER USER IDENTIFIER('SF_ACHERON_AUTO_EXECUTER') SET EMAIL                = 'info@acheron.cloud';
-- ALTER USER IDENTIFIER('SF_ACHERON_AUTO_EXECUTER') RESET PASSWORD; <-- place password in the Secret Manager
COMMIT;

/**
 * ASSERT
 **/
-- Made available in the Premium edition


