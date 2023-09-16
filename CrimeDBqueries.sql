--data source https://author-ide.skills.network/render?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtZF9pbnN0cnVjdGlvbnNfdXJsIjoiaHR0cHM6Ly9jZi1jb3Vyc2VzLWRhdGEuczMudXMuY2xvdWQtb2JqZWN0LXN0b3JhZ2UuYXBwZG9tYWluLmNsb3VkL0lCTURldmVsb3BlclNraWxsc05ldHdvcmstREIwMjAxRU4tU2tpbGxzTmV0d29yay9sYWJzL015U1FML3dlZWs1L0ZpbmFscGVlcmdyYWRlZF9xdWVzdGlvbnMubWQiLCJ0b29sX3R5cGUiOiJ0aGVpYSIsImFkbWluIjpmYWxzZSwiaWF0IjoxNjcyNzQ4NzExfQ.yupuzCRbl6MI6NwPUYnTDvUAC8MQ7JvBik9JAnB3sd4


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

--average school Safety Score
/*round the figure to 2 decimals.*/
SELECT ROUND(AVG(SafetyScore),2) 
	AS avg_safety_score
		FROM Chicago_Public_Schools_Progress_Report_Cards__2011_2012_;


--List the top 5 Community Areas by average College Enrollment [number of students]
SELECT CommunityAreaName, AVG(CollegeEnrollment) 
	AS Avg_Enrollment 
		FROM Chicago_Public_Schools_Progress_Report_Cards__2011_2012_
			GROUP BY CommunityAreaName 
				ORDER BY Avg_Enrollment DESC
					LIMIT 5

--sub-query to determine which Community Area has the least value for school Safety Score
SELECT DISTINCT SafetyScore 
	FROM Chicago_Public_Schools_Progress_Report_Cards__2011_2012_ 
		ORDER BY SafetyScore;


--query to see show schools with the worst safety scores   
SELECT SafetyScore, NameofSchool 
	FROM Chicago_Public_Schools_Progress_Report_Cards__2011_2012_ 
		ORDER BY SafetyScore ASC; 

--nested/sub query that is extra 
SELECT CommunityAreaName, SafetyScore
	FROM (
		SELECT CommunityAreaName, SafetyScore
			FROM Chicago_Public_Schools_Progress_Report_Cards__2011_2012_ 
				WHERE SafetyScore = 1 
				)
--the following does the same thing 
SELECT CommunityAreaName, SafetyScore
	FROM Chicago_Public_Schools_Progress_Report_Cards__2011_2012_ 
		WHERE SafetyScore = 1 

--using an INNER JOIN FIND Find the Per Capita Income of the Community Area which has a school Safety Score of 1
SELECT Cen.CommunityAreaName, Cen.CommunityAreaNumber, PERCAPITAINCOME 
	FROM Census_Data_Selected_socioeconomic_indicators_in_Chicago__2008_2012 AS Cen 
		INNER JOIN Chicago_Public_Schools_Progress_Report_Cards__2011_2012_ as Chic 
			ON Cen.CommunityAreaNumber = Chic.CommunityAreaNumber 
				AND SafetyScore = 1 ;


--Without using an explicit JOIN operator] Find the Per Capita Income of the Community Area which has a school Safety Score of 1
SELECT Cen.CommunityAreaName, Cen.CommunityAreaNumber, PERCAPITAINCOME 
	FROM Census_Data_Selected_socioeconomic_indicators_in_Chicago__2008_2012 AS Cen , Chicago_Public_Schools_Progress_Report_Cards__2011_2012_ as Chic 
		ON Cen.CommunityAreaNumber = Chic.CommunityAreaNumber 
			AND SafetyScore = 1 ;
