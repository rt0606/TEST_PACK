-- ====================================================================
--
--  NAME                              : DEPARTMENT_TAB.sql
--  PROGRAM TYPE                      : Table 
--
--  PURPOSE                           : Script to create custom table
--
--  Date                         Author                 Activity
-- =====================================================================
-- 28-APR-2021                   ***					Initial Creation
-- =====================================================================

CREATE TABLE DEAPRTMENT_TAB
(
	 DEPARTMENT_ID 						NUMBER				NOT NULL	PRIMARY KEY
	,DEPARTMENT_NAME					VARCHAR2(50)     	NOT NULL	UNIQUE
	,LOCATION							VARCHAR2(50)
);


-- ====================================================================
-- Inserting data into the table DEPARTMENT_TAB.
-- =====================================================================

INSERT INTO DEAPRTMENT_TAB (DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION)
	   VALUES (1,'Management', 'London');

INSERT INTO DEAPRTMENT_TAB (DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION)
	   VALUES (2,'Engineering', 'Cardiff');	   
	   
INSERT INTO DEAPRTMENT_TAB (DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION)
	   VALUES (3,'Research & Developemnt', 'Edinburgh');	

INSERT INTO DEAPRTMENT_TAB (DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION)
	   VALUES (4,'Sales', 'Belfast');	   
	   
	   