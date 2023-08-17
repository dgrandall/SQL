---Select the names and job start dates of all employees who work for the department number 5.
SELECT F_NAME, L_NAME, START_DATE
FROM EMPLOYEES E 
INNER JOIN JOB_HISTORY J 
ON E.EMP_ID= J.EMPL_ID 
WHERE DEP_ID = 5 

select E.F_NAME,E.L_NAME, JH.START_DATE 
from EMPLOYEES as E 
INNER JOIN JOB_HISTORY as JH on E.EMP_ID=JH.EMPL_ID 
where E.DEP_ID ='5';	

--Select the names, job start dates, and job titles of all employees who work for the department number 5.
SELECT E.F_NAME, E.L_NAME, J.START_DATE, S.JOB_TITLE
FROM EMPLOYEES E 
INNER JOIN JOB_HISTORY J 
ON E.EMP_ID= J.EMPL_ID 
INNER JOIN JOBS S 
ON J.JOBS_ID= S.JOB_IDENT 
WHERE DEP_ID = 5 

--Perform a Left Outer Join on the EMPLOYEES and DEPARTMENT tables and select employee id, last name, department id and department name for all employees.

SELECT E.EMP_ID, E.L_NAME, E.DEP_ID, D.DEP_NAME 
FROM EMPLOYEES E 
LEFT OUTER JOIN DEPARTMENTS D 
ON E.DEP_ID = D.DEPT_ID_DEP 

--Re-write the previous query but limit the result set to include only the rows for employees born before 1980.
SELECT E.EMP_ID, E.L_NAME, E.DEP_ID, E.B_DATE   --added birthdate to see results better 
FROM EMPLOYEES E 
LEFT OUTER JOIN DEPARTMENTS D 
ON E.DEP_ID = D.DEPT_ID_DEP 
WHERE E.B_DATE LIKE '%-197%'

--Re-write the previous query but have the result set include all the employees but department names for only the employees who were born before 1980.
SELECT E.EMP_ID, E.L_NAME, E.DEP_ID, E.B_DATE, D.DEP_NAME    --added birthdate to see results better 
FROM EMPLOYEES E 
LEFT OUTER JOIN DEPARTMENTS D 
ON E.DEP_ID = D.DEPT_ID_DEP 
AND E.B_DATE LIKE '%-197%'

--Perform a Full Join on the EMPLOYEES and DEPARTMENT tables and select the First name, Last name and Department name of all employees. 
SELECT E.F_NAME, E.L_NAME, D.DEP_NAME   
FROM EMPLOYEES E 
LEFT OUTER JOIN DEPARTMENTS D --FULL OUTER AND RIGHT JOINS ARE NOT SUPPORTED IN SQLLITE 
ON E.DEP_ID = D.DEPT_ID_DEP 

--Re-write the previous query but have the result set include all employee names but department id and department names only for male employees.
SELECT E.F_NAME, E.L_NAME, E.SEX, E.DEP_ID, D.DEP_NAME   
FROM EMPLOYEES E 
LEFT OUTER JOIN DEPARTMENTS D --FULL OUTER AND RIGHT JOINS ARE NOT SUPPORTED IN SQLLITE 
ON E.DEP_ID = D.DEPT_ID_DEP 
AND SEX = 'M'






