
-- Prerequisites
USE    ROLE                     IDENTIFIER('SYSADMIN');
  USE    DATABASE                 IDENTIFIER('UTIL_DB');
  USE    SCHEMA                   IDENTIFIER('PUBLIC');
  USE    WAREHOUSE                IDENTIFIER('COMPUTE_WH');
USE    ROLE                     IDENTIFIER('PUBLIC');
  USE    DATABASE                 IDENTIFIER('UTIL_DB');
  USE    SCHEMA                   IDENTIFIER('PUBLIC');
-- Create procedure
USE    ROLE                     IDENTIFIER('SYSADMIN');
  USE    DATABASE                 IDENTIFIER('UTIL_DB');
  USE    SCHEMA                   IDENTIFIER('PUBLIC');
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
USE    ROLE                     IDENTIFIER('PUBLIC');
  USE    DATABASE                 IDENTIFIER('UTIL_DB');
  USE    SCHEMA                   IDENTIFIER('PUBLIC');
  DESC   FUNCTION                 ASSERT(STRING, STRING);
USE    ROLE                     IDENTIFIER('SYSADMIN');
  USE    WAREHOUSE                IDENTIFIER('COMPUTE_WH');
  USE    DATABASE                 IDENTIFIER('UTIL_DB');
  USE    SCHEMA                   IDENTIFIER('PUBLIC');
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

