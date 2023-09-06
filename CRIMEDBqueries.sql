--Find the total number of crimes recorded in the CRIME table.
--Each case number is for a particular crime so count the distinct case numbers 
SELECT COUNT(DISTINCT CaseNumber) 
AS total_crime 
FROM Crimes_2001_to_Present; 
--output is 7880476

--Retrieve first 10 rows from the CRIME table.
SELECT * 
FROM Crimes_2001_to_Present
LIMIT 10;


--Find how many crimes involved an arrest
--Arrest column is a boolean type either TRUE or FALSE
SELECT COUNT(*) AS crimes_with_arrest
FROM Crimes_2001_to_Present
WHERE Arrest = 'true';

--output is 2046102



--Which unique types of crimes have been recorded at GAS STATION locations?
--Crime type is in PRIMARY_TYPE field and location is in LOCATION DESCRIPTION field.
SELECT DISTINCT PrimaryType, LocationDescription
FROM Crimes_2001_to_Present 
WHERE LocationDescription
LIKE '%Gas station%';

--Which schools in Community Areas 10 to 15 are healthy school certified?
SELECT NameofSchool 
FROM Chicago_Public_Schools_Progress_Report_Cards__2011_2012_
WHERE HealthySchoolsCertified = 'Yes'
AND CommunityAreaNumber
BETWEEN 10 AND 15;
