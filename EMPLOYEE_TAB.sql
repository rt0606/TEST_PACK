-- ====================================================================
--
--  NAME                              : EMPLOYEE_TAB.sql
--  PROGRAM TYPE                      : Table 
--
--  PURPOSE                           : Script to create custom table
--
--  Date                         Author                 Activity
-- =====================================================================
-- 28-APR-2021                   ***					Initial Creation
-- =====================================================================

CREATE TABLE EMPLOYEE_TAB
(
	 EMPLOYEE_ID 		NUMBER			NOT NULL	PRIMARY KEY
	,EMPLOYEE_NAME		VARCHAR2(50)   	NOT NULL	
	,JOB_TITTLE			VARCHAR2(50)    NOT NULL
	,MANAGER_ID         NUMBER          NULL
	,DATE_HIRED			DATE			NOT NULL
	,SALARY				NUMBER			NOT NULL
	,DEPARTMENT_ID		NUMBER			NOT NULL
	--,DEPARTMENT_ID 		NUMBER 			FOREIGN KEY REFERENCES DEPARTMENT_TAB(DEPARTMENT_ID) /* Can use this if we want parent child relation with department table*/
);


-- ====================================================================
-- Inserting data into the table EMPLOYEE_TAB.
-- =====================================================================

INSERT ALL
	   INTO DEAPRTMENT_TAB (EMPLOYEE_ID, EMPLOYEE_NAME, JOB_TITTLE, MANAGER_ID, DATE_HIRED, SALARY, DEPARTMENT_ID )
	   VALUES (90001,'John Smith', 'CEO', ,'01/01/95', 100000,1)
	   INTO DEAPRTMENT_TAB (EMPLOYEE_ID, EMPLOYEE_NAME, JOB_TITTLE, MANAGER_ID, DATE_HIRED, SALARY, DEPARTMENT_ID )
	   VALUES (90002,'Jimmy Wills', 'Manager',90001, '23/09/03', 52500,4)
	   INTO DEAPRTMENT_TAB (EMPLOYEE_ID, EMPLOYEE_NAME, JOB_TITTLE, MANAGER_ID, DATE_HIRED, SALARY, DEPARTMENT_ID )
	   VALUES (90003,'Roxy Jones', 'Salesperson',90002, '11/02/17', 35000,4)
	   INTO DEAPRTMENT_TAB (EMPLOYEE_ID, EMPLOYEE_NAME, JOB_TITTLE, MANAGER_ID, DATE_HIRED, SALARY, DEPARTMENT_ID )
	   VALUES (90004,'Selwyn Field', 'Salesperson',90003, '20/05/15', 32000,4)
	   INTO DEAPRTMENT_TAB (EMPLOYEE_ID, EMPLOYEE_NAME, JOB_TITTLE, MANAGER_ID, DATE_HIRED, SALARY, DEPARTMENT_ID )
	   VALUES (90005,'David Hallet', 'Engineer',90006, '17/04/18', 40000,2)
	   INTO DEAPRTMENT_TAB (EMPLOYEE_ID, EMPLOYEE_NAME, JOB_TITTLE, MANAGER_ID, DATE_HIRED, SALARY, DEPARTMENT_ID )
	   VALUES (90006,'Sarah Phelps', 'Manager',90001, '21/03/15', 45000,2)
	   INTO DEAPRTMENT_TAB (EMPLOYEE_ID, EMPLOYEE_NAME, JOB_TITTLE, MANAGER_ID, DATE_HIRED, SALARY, DEPARTMENT_ID )
	   VALUES (90007,'Louise Harper', 'Engineer',90006, '01/01/13', 47000,2)
	   INTO DEAPRTMENT_TAB (EMPLOYEE_ID, EMPLOYEE_NAME, JOB_TITTLE, MANAGER_ID, DATE_HIRED, SALARY, DEPARTMENT_ID )
	   VALUES (90008,'Tina Hart', 'Engineer',90009, '28/07/14', 45000,3)
	   INTO DEAPRTMENT_TAB (EMPLOYEE_ID, EMPLOYEE_NAME, JOB_TITTLE, MANAGER_ID, DATE_HIRED, SALARY, DEPARTMENT_ID )
	   VALUES (90009,'Gus Jones', 'Manager',90001, '15/05/18', 50000,3)
	   INTO DEAPRTMENT_TAB (EMPLOYEE_ID, EMPLOYEE_NAME, JOB_TITTLE, MANAGER_ID, DATE_HIRED, SALARY, DEPARTMENT_ID )
	   VALUES (90010,'Mildred Hall', 'Secretary',90001, '12/10/96', 35000,1)
SELECT * FROM dual;	  
	   
	   	   