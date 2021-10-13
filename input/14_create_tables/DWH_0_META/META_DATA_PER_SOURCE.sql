/**
 * Derived from template: sf_create_table.sql.j2
 *
 * This script solely creates an external table
 *
 * Jinja variables to set:
 *  - var_env_list: ARRAY e.g. ["T"], ["T","A"], ["T","A","P"]
 *  - var_context: STRING e.g. "DWH"
 *  - var_sch: STRING e.g. "INF_CUSTOMER"
 *  - var_tab: STRING e.g. "TAB_ORDER"
 *  - var_seq (optional): STRING e.g. "TAB_ORDER_SEQ"
 *  - var_col_list: LIST<col>
 *     - <col>: object with attributes
 *              - "col_type",
 *              - "col_not_null" (optional),
 *              - "col_default" (optional),
 *              - "col_comment" (optional)
 **/



/**
 * ARRANGE
 */
-- Made available in the Premium edition

/**
 * ACT - Create table
 */
USE ROLE      IDENTIFIER('RL_DWH_T_ADMIN');
  USE DATABASE  IDENTIFIER('DB_DWH_T');
  USE SCHEMA    IDENTIFIER('DWH_0_META');
  CREATE TABLE IF NOT EXISTS IDENTIFIER('META_DATA_PER_SOURCE') (
    META_SOURCE         VARCHAR NOT NULL,
    TABLE_NAME_RAW      VARCHAR NOT NULL,
    TABLE_NAME_REFINED  VARCHAR NOT NULL,
    INPUT_REGULAR_EXPR  VARCHAR NOT NULL
    );

/**
 * ASSERT
 */
-- Made available in the Premium edition

