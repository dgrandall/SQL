--Retrieve all employees whose address is in Elgin,IL.

SELECT F_NAME , L_NAME
	FROM EMPLOYEES
	WHERE ADDRESS LIKE '%Elgin,IL%';

--Retrieve all employees who were born during the 1970’s.
SELECT F_NAME , L_NAME 
	FROM EMPLOYEES 
	WHERE B_DATE LIKE '%-197%';



--Retrieve all employees in department 5 whose salary is between 60000 and 70000.
SELECT *
	FROM EMPLOYEES 
	WHERE DEP_ID = 5 
	GROUP BY F_NAME
	HAVING SALARY BETWEEN 60000 AND 70000
;


SELECT *
	FROM EMPLOYEES
	WHERE (SALARY BETWEEN 60000 AND 70000) AND DEP_ID = 5;

--Retrieve a list of employees ordered by department ID.
SELECT *
	FROM EMPLOYEES
	ORDER BY DEP_ID;

--Retrieve a list of employees ordered in descending order by department ID and within each department ordered alphabetically in descending order by last name.

SELECT *
	FROM EMPLOYEES
	ORDER BY DEP_ID DESC 
	AND 
	ORDER BY L_NAME;

SELECT F_NAME, L_NAME, DEP_ID 
	FROM EMPLOYEES
	ORDER BY DEP_ID DESC, L_NAME DESC;

--In SQL problem 2 (Exercise 2 Problem 2), use department name instead of department ID. Retrieve a list of employees ordered by department name, and within each department ordered alphabetically in descending order by last name.I WILL NEED TO DO A JOIN ON DEP_ID COLUMN

SELECT F_NAME, L_NAME, DEP_NAME  
	FROM EMPLOYEES
	INNER JOIN DEPARTMENTS 
	  ON  EMPLOYEES.DEP_ID = DEPARTMENTS.DEPT_ID_DEP
	ORDER BY DEP_NAME, L_NAME DESC;

	--BETTER SOLUTION
SELECT D.DEP_NAME , E.F_NAME, E.L_NAME
	FROM EMPLOYEES as E, DEPARTMENTS as D
	WHERE E.DEP_ID = D.DEPT_ID_DEP
	ORDER BY D.DEP_NAME, E.L_NAME DESC;

--Exercise 3: Grouping
--For each department ID retrieve the number of employees in the department.
SELECT DEP_ID, COUNT(*) AS DEP_ID_COUNT
	FROM EMPLOYEES
	GROUP BY DEP_ID
		--the last line is optional
	ORDER BY DEP_ID;


--For each department retrieve the number of employees in the department, and the average employee salary in the department..
SELECT DEP_ID, COUNT(*) AS DEP_ID_COUNT, AVG(SALARY) AS Average_Salary
	FROM EMPLOYEES
	GROUP BY DEP_ID
		--the last line is optional
	ORDER BY DEP_ID;

--Label the computed columns in the result set of SQL problem 2 (Exercise 3 Problem 2) as NUM_EMPLOYEES and AVG_SALARY.
SELECT DEP_ID, COUNT(*) AS NUM_EMPLOYEES, AVG(SALARY) AS AVG_SALARY
	FROM EMPLOYEES
	GROUP BY DEP_ID
		--the last line is optional
	ORDER BY DEP_ID;

--In SQL problem 3 (Exercise 3 Problem 3), order the result set by Average Salary..
SELECT DEP_ID, COUNT(*) AS NUM_EMPLOYEES, AVG(SALARY) AS AVG_SALARY
	FROM EMPLOYEES
	GROUP BY DEP_ID
	ORDER BY AVG_SALARY;

--In SQL problem 4 (Exercise 3 Problem 4), limit the result to departments with fewer than 4 employees
SELECT DEP_ID, COUNT(*) AS NUM_EMPLOYEES, AVG(SALARY) AS AVG_SALARY
	FROM EMPLOYEES
	GROUP BY DEP_ID
	HAVING NUM_EMPLOYEES < 4
	ORDER BY AVG_SALARY;



CREATE TABLE INSTRUCTOR (
	ins_id INT PRIMARY KEY NOT NULL, 
	lastname VARCHAR NOT NULL, 
	firstname VARCHAR NOT NULL, 
	city VARCHAR, 
	country CHAR(2)
	); 
	
	
INSERT INTO INSTRUCTOR (ins_id, lastname, firstname, city, country) 
	VALUES 	(1, 'Ahuja', 'Rav', 'Toronto', 'CA');
		

INSERT INTO INSTRUCTOR (ins_id, lastname, firstname, city, country) 
	VALUES 	(2, 'Chong', 'Raul', 'Toronto', 'CA'), 
		(3, 'Vasudevan', 'Hima', 'Chicago', 'US');
		
SELECT * FROM INSTRUCTOR; 

SELECT firstname,lastname,country 
	FROM INSTRUCTOR 
		WHERE city = 'Toronto' ;
		
UPDATE INSTRUCTOR
	SET city = 'Markham' 
		WHERE ins_id = 1 ; 
		
DELETE FROM INSTRUCTOR
	WHERE ins_id = 2; 
			
SELECT * FROM INSTRUCTOR; 


---Select the names and job start dates of all employees who work for the department number 5.
SELECT F_NAME, L_NAME, START_DATE
	FROM EMPLOYEES E 
	INNER JOIN JOB_HISTORY J 
	ON E.EMP_ID= J.EMPL_ID 
	WHERE DEP_ID = 5 

SELECT E.F_NAME,E.L_NAME, JH.START_DATE 
	FROM EMPLOYEES AS E 
	INNER JOIN JOB_HISTORY AS JH ON E.EMP_ID=JH.EMPL_ID 
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
SELECT E.F_NAME, E.L_NAME, E.SEX, D.DEPT_ID_DEP, D.DEP_NAME   
	FROM EMPLOYEES E 
	LEFT OUTER JOIN DEPARTMENTS D --FULL OUTER AND RIGHT JOINS ARE NOT SUPPORTED IN SQLLITE 
	ON E.DEP_ID = D.DEPT_ID_DEP 
	AND E.SEX = 'M'
	ORDER BY E.SEX DESC


--Query 1.1--

SELECT F_NAME , L_NAME
	FROM EMPLOYEES
	WHERE ADDRESS LIKE '%Elgin,IL%';

--Query 1.2--

SELECT F_NAME , L_NAME
	FROM EMPLOYEES
	WHERE B_DATE LIKE '197%';

--Query 1.3--

SELECT *
	FROM EMPLOYEES
	WHERE (SALARY BETWEEN 60000 AND 70000) AND DEP_ID = 5;

--Query 2.1--

SELECT F_NAME, L_NAME, DEP_ID 
	FROM EMPLOYEES
	ORDER BY DEP_ID;

--Query 2.2--

SELECT F_NAME, L_NAME, DEP_ID 
	FROM EMPLOYEES
	ORDER BY DEP_ID DESC, L_NAME DESC;

--Optional Query 2.3--

SELECT D.DEP_NAME , E.F_NAME, E.L_NAME
	FROM EMPLOYEES as E, DEPARTMENTS as D
	WHERE E.DEP_ID = D.DEPT_ID_DEP
	ORDER BY D.DEP_NAME, E.L_NAME DESC;

--Query 3.1--

SELECT DEP_ID, COUNT(*)
	FROM EMPLOYEES
	GROUP BY DEP_ID;

--Query 3.2--

SELECT DEP_ID, COUNT(*), AVG(SALARY)
	FROM EMPLOYEES
	GROUP BY DEP_ID;

--Query 3.3--

SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
	FROM EMPLOYEES
	GROUP BY DEP_ID;

--Query 3.4--

SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
	FROM EMPLOYEES
	GROUP BY DEP_ID
	ORDER BY AVG_SALARY;

--Query 3.5--

SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
	FROM EMPLOYEES
	GROUP BY DEP_ID
	HAVING count(*) < 4
	ORDER BY AVG_SALARY;



