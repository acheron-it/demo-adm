
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
  CREATE OR REPLACE PROCEDURE GRANT_REVOKE_PROC_V1(I_DATABASE VARCHAR, I_SCHEMA VARCHAR, I_ROLE VARCHAR, I_ACTION VARCHAR, I_TYPE VARCHAR)
    RETURNS VARCHAR
    LANGUAGE javascript
    EXECUTE AS CALLER
    AS
    $$
    // I_DATABASE = Naam van de database
    // I_SCHEMA = Naam van het schema 
    // I_ROLE = Naam van de rol waar rechten aan worden toegekend
    // I_ACTION = GRANT of een REVOKE
    // I_TYPE = R(ead), W(rite), C(ontrol/Modify/Create), T(runcate)
    try {
        if(I_ACTION == 'GRANT' ) {
          var V_DIRECTION = 'TO'
        }
        if(I_ACTION == 'REVOKE') {
          var V_DIRECTION = 'FROM'
        }  
        rs = snowflake.execute( { sqlText: `USE ROLE SECURITYADMIN;` } );
        if (I_TYPE == 'R' || I_TYPE == 'W' || I_TYPE == 'C' || I_TYPE == 'T') {
          if(I_ACTION == 'GRANT') {
            rs = snowflake.execute( { sqlText: "" + I_ACTION + "  USAGE  ON DATABASE " + I_DATABASE + " " + V_DIRECTION + " ROLE " + I_ROLE + ";" } );
          }
          rs = snowflake.execute( { sqlText: "" + I_ACTION + "  USAGE   ON SCHEMA " + I_DATABASE + "." + I_SCHEMA + " " + V_DIRECTION + " ROLE " + I_ROLE + ";" } );
          rs = snowflake.execute( { sqlText: "" + I_ACTION + "  SELECT  ON ALL TABLES             IN SCHEMA " + I_DATABASE + "." + I_SCHEMA + " " + V_DIRECTION + " ROLE " + I_ROLE + ";" } );
          rs = snowflake.execute( { sqlText: "" + I_ACTION + "  SELECT  ON FUTURE TABLES          IN SCHEMA " + I_DATABASE + "." + I_SCHEMA + " " + V_DIRECTION + " ROLE " + I_ROLE + ";" } );
          rs = snowflake.execute( { sqlText: "" + I_ACTION + "  SELECT  ON ALL VIEWS              IN SCHEMA " + I_DATABASE + "." + I_SCHEMA + " " + V_DIRECTION + " ROLE " + I_ROLE + ";" } );
          rs = snowflake.execute( { sqlText: "" + I_ACTION + "  SELECT  ON FUTURE VIEWS           IN SCHEMA " + I_DATABASE + "." + I_SCHEMA + " " + V_DIRECTION + " ROLE " + I_ROLE + ";" } );
          rs = snowflake.execute( { sqlText: "" + I_ACTION + "  USAGE   ON ALL STAGES             IN SCHEMA " + I_DATABASE + "." + I_SCHEMA + " " + V_DIRECTION + " ROLE " + I_ROLE + ";" } );
          rs = snowflake.execute( { sqlText: "" + I_ACTION + "  USAGE   ON FUTURE STAGES          IN SCHEMA " + I_DATABASE + "." + I_SCHEMA + " " + V_DIRECTION + " ROLE " + I_ROLE + ";" } );
          rs = snowflake.execute( { sqlText: "" + I_ACTION + "  USAGE   ON ALL FILE FORMATS       IN SCHEMA " + I_DATABASE + "." + I_SCHEMA + " " + V_DIRECTION + " ROLE " + I_ROLE + ";" } );
          rs = snowflake.execute( { sqlText: "" + I_ACTION + "  USAGE   ON FUTURE FILE FORMATS    IN SCHEMA " + I_DATABASE + "." + I_SCHEMA + " " + V_DIRECTION + " ROLE " + I_ROLE + ";" } );
          rs = snowflake.execute( { sqlText: "" + I_ACTION + "  USAGE   ON ALL FUNCTIONS          IN SCHEMA " + I_DATABASE + "." + I_SCHEMA + " " + V_DIRECTION + " ROLE " + I_ROLE + ";" } );
          rs = snowflake.execute( { sqlText: "" + I_ACTION + "  USAGE   ON FUTURE FUNCTIONS       IN SCHEMA " + I_DATABASE + "." + I_SCHEMA + " " + V_DIRECTION + " ROLE " + I_ROLE + ";" } );
          rs = snowflake.execute( { sqlText: "" + I_ACTION + "  USAGE   ON ALL SEQUENCES          IN SCHEMA " + I_DATABASE + "." + I_SCHEMA + " " + V_DIRECTION + " ROLE " + I_ROLE + ";" } );
          rs = snowflake.execute( { sqlText: "" + I_ACTION + "  USAGE   ON FUTURE SEQUENCES       IN SCHEMA " + I_DATABASE + "." + I_SCHEMA + " " + V_DIRECTION + " ROLE " + I_ROLE + ";" } );
          rs = snowflake.execute( { sqlText: "" + I_ACTION + "  SELECT  ON ALL EXTERNAL TABLES    IN SCHEMA " + I_DATABASE + "." + I_SCHEMA + " " + V_DIRECTION + " ROLE " + I_ROLE + ";" } );
          rs = snowflake.execute( { sqlText: "" + I_ACTION + "  SELECT  ON FUTURE EXTERNAL TABLES IN SCHEMA " + I_DATABASE + "." + I_SCHEMA + " " + V_DIRECTION + " ROLE " + I_ROLE + ";" } ); 
      }
      if (I_TYPE == 'W' || I_TYPE == 'C') {
        rs = snowflake.execute( { sqlText: "" + I_ACTION + "  INSERT,UPDATE,DELETE,TRUNCATE ON ALL TABLES    IN SCHEMA " + I_DATABASE + "." + I_SCHEMA + " " + V_DIRECTION + " ROLE " + I_ROLE + ";" } );
        rs = snowflake.execute( { sqlText: "" + I_ACTION + "  INSERT,UPDATE,DELETE,TRUNCATE ON FUTURE TABLES IN SCHEMA " + I_DATABASE + "." + I_SCHEMA + " " + V_DIRECTION + " ROLE " + I_ROLE + ";" } );
      }
      if (I_TYPE == 'T' ) {
        rs = snowflake.execute( { sqlText: "" + I_ACTION + "  TRUNCATE ON ALL TABLES    IN SCHEMA " + I_DATABASE + "." + I_SCHEMA + " " + V_DIRECTION + " ROLE " + I_ROLE + ";" } );
        rs = snowflake.execute( { sqlText: "" + I_ACTION + "  TRUNCATE ON FUTURE TABLES IN SCHEMA " + I_DATABASE + "." + I_SCHEMA + " " + V_DIRECTION + " ROLE " + I_ROLE + ";" } );
      }
      if (I_TYPE=='C') {
        rs = snowflake.execute( { sqlText: "" + I_ACTION + "  USAGE, CREATE EXTERNAL TABLE, CREATE FILE FORMAT, CREATE FUNCTION, CREATE MATERIALIZED VIEW, CREATE PIPE, CREATE PROCEDURE, CREATE SEQUENCE, CREATE STAGE, CREATE STREAM, CREATE TABLE, CREATE TASK, CREATE VIEW, MODIFY, MONITOR ON SCHEMA " + I_DATABASE + "." + I_SCHEMA + " " + V_DIRECTION + " ROLE " + I_ROLE + ";" } );
      } 
      // return to the admin role of the database (cause securityadmin cannot run the procedure)
      V_ENV = I_DATABASE.substring((I_DATABASE.length-1),I_DATABASE.length)
      V_TYPE = I_DATABASE.substring(3,(I_DATABASE.length - 2))
      V_RETURN_TO_ROLE =  "RL_" + V_TYPE + "_" + V_ENV + "_ADMIN";
      rs = snowflake.execute( { sqlText: "USE ROLE "+ V_RETURN_TO_ROLE + ";" } ); // Terug naar database admin
      return "Succeeded for database " + I_DATABASE + " on schema " + I_SCHEMA + " " + V_DIRECTION + " role " + I_ROLE;   // Return a success/error indicator.
    } catch(err) {
        return "Failed: " + V_RETURN_TO_ROLE;   // Return a success/error indicator.
    }
    $$
  ;
-- Validation
USE    ROLE                     IDENTIFIER('PUBLIC');
  USE    DATABASE                 IDENTIFIER('UTIL_DB');
  USE    SCHEMA                   IDENTIFIER('PUBLIC');
  DESC   PROCEDURE                GRANT_REVOKE_PROC_V1(VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR);
USE    ROLE                     IDENTIFIER('SYSADMIN');
  USE    WAREHOUSE                IDENTIFIER('COMPUTE_WH');
  USE    DATABASE                 IDENTIFIER('UTIL_DB');
  USE    SCHEMA                   IDENTIFIER('PUBLIC');
  DESC   PROCEDURE                GRANT_REVOKE_PROC_V1(VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR);
