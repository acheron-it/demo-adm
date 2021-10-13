USE ROLE      IDENTIFIER('RL_DWH_T_ELT');
  USE WAREHOUSE IDENTIFIER('WH_DWH_T_ELT');
  USE DATABASE  IDENTIFIER('DB_DWH_T');

TRUNCATE TABLE "DB_DWH_T"."DWH_1_RAW"."RAW_JIRA_SPRINTS";
INSERT INTO "DB_DWH_T"."DWH_1_RAW"."RAW_JIRA_SPRINTS" (META_BESTANDSNAAM, META_RIJNUMMER, C001, C002, C003) 
VALUES ('JIRA_SPRINTS__20210509.csv', '1', 'SPRINTS_ID', 'SPRINTS_KEY', 'SPRINTS_TYPE');
