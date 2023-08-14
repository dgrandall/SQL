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

