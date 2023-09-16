CREATE TABLE INSTRUCTOR (
	ins_id INT PRIMARY KEY NOT NULL, 
	lastname VAR CHAR NOT NULL, 
	firstname VAR CHAR NOT NULL, 
	city VAR CHAR, 
	country CHAR(2)
	);


INSERT INTO DEPARTMENTS (DEPT_ID_DEP,DEP_NAME,MANAGER_ID,LOC_ID)
	VALUES
	(2,"Architect Group","30001","L0001"),
	(5,"Software Group","30002","L0002"),
	(7,"Design Team","30003","L0003");

INSERT INTO EMPLOYEES (EMP_ID,F_NAME,L_NAME,SSN,B_DATE,SEX,ADDRESS,JOB_ID,SALARY,MANAGER_ID,DEP_ID)
VALUES
	 ("E1001","John","Thomas",123456,"01-09-1976","M","5631 Rice, OakPark,IL",100,100000,30001,2), 
	 ("E1002","Alice","James",123457,"31-07-1972","F","980 Berry ln, Elgin,IL",200,80000,30002,5), 
	 ("E1003","Steve","Wells",123458,"08-10-1980","M","291 Springs, Gary,IL",300,50000,30002,5), 
	 ("E1004","Santosh","Kumar",123459,"20-07-1985","M","511 Aurora Av, Aurora,IL",400,60000,30002,5), 
	 ("E1005","Ahmed","Hussain",123410,"01-04-1981","M","216 Oak Tree, Geneva,IL",500,70000,30001,2), 
	 ("E1006","Nancy","Allen",123411,"02-06-1978","F","111 Green Pl, Elgin,IL",600,90000,30001,2), 
	 ("E1007","Mary","Thomas",123412,"05-05-1975","F","100 Rose Pl, Gary,IL",650,65000,30003,7), 
	 ("E1008","Bharath","Gupta",123413,"05-06-1985","M","145 Berry Ln, Naperville,IL",660,65000,30003,7), 
	 ("E1009","Andrea","Jones",123414,"07-09-1990","F","120 Fall Creek, Gary,IL",234,70000,30003,7), 
	 ("E1010","Ann","Jacob",123415,"30-03-1982","F","111 Britany Springs,Elgin,IL",220,70000,30002,5); 

INSERT INTO INSTRUCTOR (ins_id, lastname, firstname, city, country) 
	VALUES 	(1, 'Ahuja', 'Rav', 'Toronto', 'CA');
	
INSERT INTO INSTRUCTOR (ins_id, lastname, firstname, city, country) 
	VALUES 	(2, 'Chong', 'Raul', 'Toronto', 'CA'), 
		(3, 'Vasudevan', 'Hima', 'Chicago', 'US');

INSERT INTO JOB_HISTORY (EMPL_ID,START_DATE,JOBS_ID,DEPT_ID)
VALUES
	("E1001","08/01/2000",100,2),
	("E1002","08/01/2001",200,5),
	("E1003","08/16/2001",300,5),
	("E1004","08/16/2000",400,5),
	("E1005","05/30/2000",500,2),
	("E1006","08/16/2001",600,2),
	("E1007","05/30/2002",650,7),
	("E1008","05/06/2010",660,7),
	("E1009","08/16/2016",234,7),
	("E1010","08/16/2016",220,5);
	
INSERT INTO JOBS (JOB_IDENT,JOB_TITLE,MIN_SALARY,MAX_SALARY)
VALUES
	(100,"Sr. Architect",60000,100000),
	(200,"Sr.Software Developer",60000,80000),
	(300,"Jr.Software Developer",40000,60000),
	(400,"Jr.Software Developer",40000,60000),
	(500,"Jr. Architect",50000,70000),
	(600,"Lead Architect",70000,100000),
	(650,"Jr. Designer",60000,70000),
	(660,"Jr. Designer",60000,70000),
	(234,"Sr. Designer",70000,90000),
	(220,"Sr. Designer",70000,90000);

INSERT INTO LOCATIONS ("LOCT_ID",DEP_ID_LOC)
VALUES
	("L0001",2),
	("L0002",5),
	("L0003",7);
	
	
UPDATE INSTRUCTOR
	SET city = 'Markham' 
	WHERE ins_id = 1 ; 

