-- ====================================================================
--
--  NAME                              : SALARY_EMP_FUNC.sql
--  PROGRAM TYPE                      : Function  
--
--  PURPOSE                           : Procedure to perform employee transfer 
--
--  Date                         Author                 Activity
-- =====================================================================
-- 28-APR-2021                   ***					Initial Creation
-- =====================================================================

CREATE OR REPLACE FUNCTION SALARY_EMP_FUNC
( p_employee_name    IN 		EMPLOYEE_TAB.EMPLOYEE_NAME%TYPE)
RETURN NUMBER
IS
	l_salary	 		EMPLOYEE_TAB.SALARY%TYPE;
BEGIN
	 BEGIN
			SELECT	salary
			INTO	l_salary
			FROM    EMPLOYEE_TAB et
			WHERE   employee_name = p_employee_name;
	 EXCEPTION
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE ('Error Retrieving salary from Employee Table' || SQLERRM);
	 END;
	 RETURN ('Employee	:	'|| p_employee_name||'	'||'Salary	:' ||  l_salary);
END;			
				
			
	 