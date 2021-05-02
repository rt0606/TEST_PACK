-- ====================================================================
--
--  NAME                              : CREATE_EMP_PROC.sql
--  PROGRAM TYPE                      : Procedure  
--
--  PURPOSE                           : Procedure to create a employee
--
--  Date                         Author                 Activity
-- =====================================================================
-- 28-APR-2021                   ***					Initial Creation
-- =====================================================================

CREATE OR REPLACE PROCEDURE CREATE_EMP
(	 errbuf 			OUT 	VARCHAR2
	,retcode			OUT		VARCHAR2
	,p_employee_id 		IN		EMPLOYEE_TAB.EMPLOYEE_ID%TYPE
	,p_employee_name    IN 		EMPLOYEE_TAB.EMPLOYEE_NAME%TYPE		
	,p_jon_tittle		IN		EMPLOYEE_TAB.JOB_TITTLE%TYPE		
	,p_manager_id		IN		EMPLOYEE_TAB.MANAGER_ID%TYPE         
	,p_date_hired		IN		EMPLOYEE_TAB.DATE_HIRED%TYPE			
	,p_salary			IN		EMPLOYEE_TAB.SALARY%TYPE				
	,p_department_id	IN		EMPLOYEE_TAB.DEPARTMENT_ID%TYPE
)
IS
BEGIN
	INSERT INTO DEAPRTMENT_TAB (EMPLOYEE_ID, EMPLOYEE_NAME, JOB_TITTLE, MANAGER_ID, DATE_HIRED, SALARY, DEPARTMENT_ID )
		   VALUES (  p_employee_id 	
					,p_employee_name
					,p_jon_tittle		
					,p_manager_id		
					,p_date_hired		
					,p_salary			
					,p_department_id	
				  );
	COMMIT;
EXCEPTION 
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE( ' Error Inserting Data ' || SQLERRM );
END;		

