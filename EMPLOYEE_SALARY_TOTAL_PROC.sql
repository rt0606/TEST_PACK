-- ====================================================================
--
--  NAME                              : EMPLOYEE_SALARY_TOTAL_PROC.sql
--  PROGRAM TYPE                      : Procedure  
--
--  PURPOSE                           : Procedure to retrieve employee data based on department
--
--  Date                         Author                 Activity
-- =====================================================================
-- 30-APR-2021                   ***					Initial Creation
-- =====================================================================

CREATE OR REPLACE PROCEDURE EMP_SALARY_TOT
(	 errbuf 			OUT 	VARCHAR2
	,retcode			OUT		VARCHAR2
	,p_department_name  IN  	DEAPRTMENT_TAB.DEPARTMENT_NAME%TYPE -- Parameter to derive employee data based on the department name
		
)
IS
	l_salary	EMPLOYEE_TAB.SALARY%TYPE;
	
BEGIN
	BEGIN
		
		SELECT SUM(salary)
		INTO   l_salary
		FROM   EMPLOYEE_TAB
		WHERE  1=1
		AND    department_id = (SELECT  department_id
								FROM	DEPARTMENT_TAB
								WHERE	department_name = p_department_name);
	EXCPETION WHEN OTHERS THEN 
		DBMS_OUTPUT.PUT_LINE(' Error deriving the salary : '|| SQLERRM);
	END;
	
	DBMS_OUTPUT.PUT_LINE ('==================================================');
	DBMS_OUTPUT.PUT_LINE (' Salary total for department :' || p_department_name	||'		'||l_salary);
	DBMS_OUTPUT.PUT_LINE ('==================================================');
END;
