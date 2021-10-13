SET var_rl_sys          = 'SYSADMIN';
SET var_rl_pub          = 'PUBLIC';
SET var_wh_global       = 'COMPUTE_WH';
SET var_db              = 'UTIL_DB';
SET var_sch             = 'PUBLIC';

-- Prerequisites
USE    ROLE                     IDENTIFIER($var_rl_sys);
  USE    DATABASE                 IDENTIFIER($var_db);
  USE    SCHEMA                   IDENTIFIER($var_sch);
  USE    WAREHOUSE                IDENTIFIER($var_wh_global);
USE    ROLE                     IDENTIFIER($var_rl_pub);
  USE    DATABASE                 IDENTIFIER($var_db);
  USE    SCHEMA                   IDENTIFIER($var_sch);
-- Create procedure
USE    ROLE                     IDENTIFIER($var_rl_sys);
  USE    DATABASE                 IDENTIFIER($var_db);
  USE    SCHEMA                   IDENTIFIER($var_sch);
    -- https://support.snowflake.net/s/question/0D50Z00008EJXEISA5/how-do-i-raise-and-error-in-snowflake
  CREATE OR REPLACE FUNCTION ASSERT(VALUE STRING, TEST STRING)
    RETURNS STRING
    LANGUAGE JAVASCRIPT
  AS
  $$
    if (VALUE === TEST) {
      return `True ('${VALUE}' = '${TEST}')`;
    } else {
      throw `Assertion failed: '${VALUE}' != '${TEST}'`
    }
  $$
  ;
-- Validation
USE    ROLE                     IDENTIFIER($var_rl_pub);
  USE    DATABASE                 IDENTIFIER($var_db);
  USE    SCHEMA                   IDENTIFIER($var_sch);
  DESC   FUNCTION                 ASSERT(STRING, STRING);
USE    ROLE                     IDENTIFIER($var_rl_sys);
  USE    WAREHOUSE                IDENTIFIER($var_wh_global);
  USE    DATABASE                 IDENTIFIER($var_db);
  USE    SCHEMA                   IDENTIFIER($var_sch);
  DESC   FUNCTION                 ASSERT(STRING, STRING);
  /* Tests should all return true */
  SELECT assert(true, true);
  SELECT assert('string', 'string');
  SELECT assert(123, 123);
  /* Possible improvements */
  SELECT assert('123', 123);
  SELECT assert(true, 'true');
  /* Tests should all fail and throw exceptions
   * We don't execute, otherwise the script breaks
   */
  -- SELECT assert(true, false);
  -- SELECT assert('string1', 'string2');
  -- SELECT assert(12345, 54321);
