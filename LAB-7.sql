--Lab 7 Perform SQL queries for Aggerate function and group by (without having)  
-- Part – A: 
--Create table and inset records as per below.

CREATE TABLE EMP
(
EID INT,
ENAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT,
JOININGDATE DATETIME,
CITY VARCHAR(25)
)

INSERT INTO EMP
VALUES 
(101,'RAHUL','ADMIN',56000,'1990-01-01','RAJKOT'),
(102,'HARDIK','IT',18000,'1990-09-25','AHEMDABAD'),
(103,'BHAVIN','HR',14000,'1991-05-14','BARODA'),
(104,'BHOOMI','ADMIN',39000,'1991-02-08','RAJKOT'),
(105,'ROHIT','IT',17000,'1990-06-23','JAMNAGAR'),
(106,'PRIYA','IT',9000,'1990-08-18','AHEMDABAD'),
(107,'BHOOMI','HR',34000,'1991-12-25','RAJKOT')
SELECT * FROM EMP

--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively. 
SELECT MAX(SALARY) AS MAX_SAL,MIN(SALARY) AS MIN_SAL FROM EMP
--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal, 
--respectively. 
SELECT SUM(SALARY) AS TOTAL_SAL,AVG(SALARY) AS AVG_SAL FROM EMP
--3. Find total number of employees of EMPLOYEE table. 
SELECT COUNT(EID) AS TOTAL_NUM_EMP FROM EMP
--4. Find highest salary from Rajkot city. 
SELECT MAX(SALARY) AS MAX_SAL FROM EMP
WHERE CITY = 'RAJKOT'
--5. Give maximum salary from IT department.
SELECT MAX(SALARY) AS MAX_SAL_DEP FROM EMP
WHERE DEPARTMENT = 'IT'
--6. Count employee whose joining date is after 8-feb-91.
SELECT MAX(EID) AS JOIN_DATE FROM EMP
WHERE JOININGDATE > '1991-02-08'
--7. Display average salary of Admin department.
SELECT AVG(SALARY) AS AVG_SAL FROM EMP
WHERE DEPARTMENT = 'ADMIN'
--8. Display total salary of HR department. 
SELECT SUM(SALARY) AS SUM_SAL FROM EMP
WHERE DEPARTMENT = 'HR'
--9. Count total number of cities of employee without duplication. 
SELECT COUNT(DISTINCT CITY) AS COUNT_CITY FROM EMP
--10. Count unique departments. 
SELECT COUNT(DISTINCT DEPARTMENT) AS COUNT_DEP FROM EMP
--11. Give minimum salary of employee who belongs to Ahmedabad.
SELECT MIN(SALARY) AS MIN_SAL FROM EMP
WHERE CITY = 'AHEMDABAD'
--12. Find city wise highest salary.
SELECT CITY,MAX(SALARY) AS MAX_SAL_CITY FROM EMP
GROUP BY CITY
--13. Find department wise lowest salary.
SELECT DEPARTMENT,MIN(SALARY) AS MIN_SAL_DEPA FROM EMP
GROUP BY DEPARTMENT
--14. Display city with the total number of employees belonging to each city. 
SELECT CITY,COUNT(EID) AS COUNT_EMP FROM EMP
GROUP BY CITY
--15. Give total salary of each department of EMP table.
SELECT DEPARTMENT,SUM(SALARY) AS TOTAL_SAL_CITY FROM EMP
GROUP BY DEPARTMENT

--16. Give average salary of each department of EMP table without displaying the respective department
SELECT AVG(SALARY) AS AVG FROM EMP
GROUP BY DEPARTMENT

--Part – B: 
--1. Count the number of employees living in Rajkot. 
SELECT COUNT(EID) AS LIVING FROM EMP
WHERE CITY = 'RAJKOT'
--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE. 
SELECT (MAX(SALARY)-MIN(SALARY)) AS DIFF FROM EMP
--3. Display the total number of employees hired before 1st January, 1991.
SELECT MAX(EID) AS JOIN_DATE FROM EMP
WHERE JOININGDATE < '1991-01-01'

--Part – C: 
--1. Count the number of employees living in Rajkot or Baroda.
SELECT MIN(SALARY) AS MIN_SAL FROM EMP
WHERE CITY =  'RAJKOT'OR CITY='BARODA'
--2. Display the total number of employees hired before 1st January, 1991 in IT department.
SELECT COUNT(EID) AS JOIN_DATE FROM EMP
WHERE JOININGDATE < '1991-01-01' AND DEPARTMENT='ID'
--3. Find the Joining Date wise Total Salaries. 
SELECT JOININGDATE,SUM(SALARY) AS SUM_SAL_DATE FROM EMP
GROUP BY JOININGDATE
--4. Find the Maximum salary department & city wise in which city name starts with ‘R’. 
SELECT DEPARTMENT,CITY,MAX(SALARY) AS MAX_SAL_DEP  FROM EMP
WHERE CITY = 'R%'
GROUP BY DEPARTMENT,CITY