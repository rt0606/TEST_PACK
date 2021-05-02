-- ====================================================================
--
--  NAME                              : EMPLOYEE_SAL_PROC.sql
--  PROGRAM TYPE                      : Procedure  
--
--  PURPOSE                           : Procedure to increase/decrease salary 
--
--  Date                         Author                 Activity
-- =====================================================================
-- 28-APR-2021                   ***					Initial Creation
-- =====================================================================

CREATE OR REPLACE PROCEDURE EMP_SAL_CHANGE
(	 errbuf 			OUT 	VARCHAR2
	,retcode			OUT		VARCHAR2
	,p_employee_name    IN 		EMPLOYEE_TAB.EMPLOYEE_NAME%TYPE		
	,p_mode 			IN		VARCHAR2 /*INC - Increase , DEC - Decrease */
	,p_percentage       IN      NUMBER
	
)
IS
	l_employee_id EMPLOYEE_TAB.EMPLOYEE_ID%TYPE;
	l_percentage	NUMBER;
	l_mode          VARCHAR2(5);
	
BEGIN
	 
	 l_percentage	:= p_percentage;
	 l_mode			:= p_mode
	 
	 BEGIN
			SELECT employee_id
			INTO   l_employee_id
			FROM   EMPLOYEE_TAB
			WHERE  employee_name = p_employee_name;
	 EXCEPTION
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE ('Error Retrieving employee id from Employee Table' || SQLERRM);
	 END;
	 
	 IF l_mode = 'INC' THEN
		BEGIN
			UPDATE	EMPLOYEE_TAB
			SET 	salary		= salary + (l_percentage/100)
			WHERE	employee_id = l_employee_id;
		EXCEPTION 
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE('Error updateing the increased salary' || SQLERRM);
		END;
	 ELSIF l_mode = 'DEC' THEN
		
		BEGIN
			UPDATE	EMPLOYEE_TAB
			SET 	salary		= salary - (l_percentage/100)
			WHERE	employee_id = l_employee_id;
		EXCEPTION 
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE('Error updateing the decreased salary' || SQLERRM);
		END;
	 END IF;
	 COMMIT;
EXCEPTION
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE ('Error executing the salary update program' || SQLERRM);
END;				
				
			
		
			
	 