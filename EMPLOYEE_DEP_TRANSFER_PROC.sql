-- ====================================================================
--
--  NAME                              : EMPLOYEE_DEP_TRANSFER_PROC.sql
--  PROGRAM TYPE                      : Procedure  
--
--  PURPOSE                           : Procedure to perform employee transfer 
--
--  Date                         Author                 Activity
-- =====================================================================
-- 28-APR-2021                   ***					Initial Creation
-- =====================================================================

CREATE OR REPLACE PROCEDURE EMP_DEP_TRANSFER
(	 errbuf 			OUT 	VARCHAR2
	,retcode			OUT		VARCHAR2
	,p_employee_name    IN 		EMPLOYEE_TAB.EMPLOYEE_NAME%TYPE		
	,p_department_name  IN  	DEAPRTMENT_TAB.DEPARTMENT_NAME%TYPE -- DEPARTMENT FOR CHANGE
		
)
IS
	l_employee_id 		EMPLOYEE_TAB.EMPLOYEE_ID%TYPE;
	l_department_name	DEAPRTMENT_TAB.DEPARTMENT_NAME%TYPE
	l_department_id 	DEAPRTMENT_TAB.DEPARTMENT_ID%TYPE
	l_current_dep_id	EMPLOYEE_TAB.DEPARTMENT_ID%TYPE
		
BEGIN
	 	 	 
	 BEGIN
			SELECT	employee_id,
			        department_id 
			INTO	l_employee_id,
					l_current_dep_id
			FROM   EMPLOYEE_TAB et
			WHERE  employee_name = p_employee_name;
	 EXCEPTION
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE ('Error Retrieving employee idand current department id from Employee Table' || SQLERRM);
	 END;
	 
	 BEGIN
			SELECT department_id
			INTO   l_department_id
			FROM   DEPARTMENT_TAB
			WHERE  department_name = :p_department_name;
	 EXCEPTION
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE ('Error Retrieving department id from Department Table ' || SQLERRM);
	 END;
	 
	 IF l_department_id != l_current_department_id THEN
		BEGIN
			UPDATE	EMPLOYEE_TAB
			SET 	department_id = l_department_id
			WHERE	employee_id = l_employee_id;
		EXCEPTION 
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE('Error updating the department for the employee' || SQLERRM);
		END;
	 ELSIF l_department_id = l_current_department_id THEN
		DBMS_OUTPUT.PUT_LINE('Department ID matches with the existing department id ' || SQLERRM);
	 END IF;
	 COMMIT;
EXCEPTION
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE ('Error executing the department update program' || SQLERRM);
END;			
				
			
	 