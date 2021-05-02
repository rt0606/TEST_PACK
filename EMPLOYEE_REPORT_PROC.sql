-- ====================================================================
--
--  NAME                              : EMPLOYEE_REPORT_PROC.sql
--  PROGRAM TYPE                      : Procedure  
--
--  PURPOSE                           : Procedure to retrieve employee data based on department
--
--  Date                         Author                 Activity
-- =====================================================================
-- 30-APR-2021                   ***					Initial Creation
-- =====================================================================

CREATE OR REPLACE PROCEDURE EMP_REPORT
(	 errbuf 			OUT 	VARCHAR2
	,retcode			OUT		VARCHAR2
	,p_department_name  IN  	DEAPRTMENT_TAB.DEPARTMENT_NAME%TYPE -- Parameter to derive employee data based on the department name
		
)
IS
	l_department_id 	DEAPRTMENT_TAB.DEPARTMENT_ID%TYPE;
	
BEGIN
	BEGIN
		SELECT  department_id
		INTO	l_department_id
		FROM	DEPARTMENT_TAB
		WHERE	department_name = p_department_name;
	EXCPETION WHEN OTHERS THEN 
		DBMS_OUTPUT.PUT_LINE(' Error deriving the department_id : '|| SQLERRM);
	END;
	
	CURSOR cRep (p_department_id 	EMPLOYEE_TAB.DEPARTMENT_ID%TYPE)
		IS
			SELECT	 employee_id
					,employee_name		
					,job_tittle			
					,manager_id         
					,date_hired			
					,salary				
					,department_id		
			FROM	EMPLOYEE_TAB
			WHERE	 1 = 1
			AND 	department_id = p_department_id;
			
	BEGIN
		DBMS_OUTPUT.PUT_LINE (' Employee extract for department :' || p_department_name);
		DBMS_OUTPUT.PUT_LINE ('==================================================');
		DBMS_OUTPUT.PUT_LINE ('	' ||'Employee ID'					||'	'||','||
							  '	' ||'Employee Name'					||'	'||','||
							  '	' ||'Manager ID'					||'	'||','||
							  '	' ||'Date Hired'					||'	'||','||
							  '	' ||'Salary'						||'	'||','||
							  '	' ||'Depatment ID'					||'	'
							  );
		FOR i IN cRep (l_department_id)
			LOOP
			DBMS_OUTPUT.PUT_LINE( '	' || i.employee_id				||'	'||','||
								  '	' || i.employee_name			||'	'||','||
								  '	' || i.manager_id				||'	'||','||
								  '	' || i.date_hired				||'	'||','||
								  '	' || i.salary 					||'	'||','||
								  '	' || i.department_id			||'	'||
								);
			END LOOP;
	EXCEPTION 
		WHEN OTHERS THEN
			DBMS_OUPUT.PUT_LINE( 'Error ptinting the report : '||SQLERRM);
	END;
END;
