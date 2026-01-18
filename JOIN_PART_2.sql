CREATE TABLE DEPT (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE,
    DepartmentCode VARCHAR(50) NOT NULL UNIQUE,
    Location VARCHAR(50) NOT NULL
);
INSERT INTO DEPT (DepartmentID, DepartmentName, DepartmentCode, Location) VALUES
(1, 'Admin',      'Adm', 'A-Block'),
(2, 'Computer',   'CE',  'C-Block'),
(3, 'Civil',      'CI',  'G-Block'),
(4, 'Electrical', 'EE',  'E-Block'),
(5, 'Mechanical', 'ME',  'B-Block');

CREATE TABLE PERSON (
    PersonID INT PRIMARY KEY,
    PersonName VARCHAR(100) NOT NULL,
    DepartmentID INT NULL,
    Salary DECIMAL(8,2) NOT NULL,
    JoiningDate DATETIME NOT NULL,
    City VARCHAR(100) NOT NULL,
    CONSTRAINT FK_Person_Department
    FOREIGN KEY (DepartmentID) REFERENCES DEPT(DepartmentID)
);
INSERT INTO PERSON (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City) VALUES
(101, 'Rahul Tripathi', 2, 56000, '2000-01-01', 'Rajkot'),
(102, 'Hardik Pandya',  3, 18000, '2001-09-25', 'Ahmedabad'),
(103, 'Bhavin Kanani',  4, 25000, '2000-05-14', 'Baroda'),
(104, 'Bhoomi Vaishnav',1, 39000, '2005-02-08', 'Rajkot'),
(105, 'Rohit Topiya',   2, 17000, '2001-07-23', 'Jamnagar'),
(106, 'Priya Menpara',  NULL, 9000, '2000-10-18', 'Ahmedabad'),
(107, 'Neha Sharma',    2, 34000, '2002-12-25', 'Rajkot'),
(108, 'Nayan Goswami',  3, 25000, '2001-07-01', 'Rajkot'),
(109, 'Mehul Bhundiya', 4, 13500, '2005-01-09', 'Baroda'),
(110, 'Mohit Maru',     5, 14000, '2000-05-25', 'Jamnagar');

--Part – A: 
--1. Find all persons with their department name & code. 
SELECT P.PersonName,D.DepartmentName,D.DepartmentCode FROM PERSON P 
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
--2. Find the person's name whose department is in C-Block. 
SELECT P.PersonName,D.DepartmentName FROM PERSON P 
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
WHERE D.Location = 'C-BLOCK'
--3. Retrieve person name, salary & department name who belongs to Jamnagar city.
SELECT P.PersonName,D.DepartmentName,P.Salary FROM PERSON P 
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
WHERE P.City = 'JAMNAGAR'
--4. Retrieve person name, salary & department name who does not belong to Rajkot city. 
SELECT P.PersonName,D.DepartmentName,P.Salary FROM PERSON P 
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
WHERE P.City <> 'RAJKOT'
--5. Retrieve person’s name of the person who joined the Civil department after 1-Aug-2001. 
SELECT P.PersonName,D.DepartmentName,P.Salary FROM PERSON P 
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'CIVIL' AND P.JoiningDate > '2001-08-01'
--6. Find details of all persons who belong to the computer department. 
SELECT * FROM PERSON P 
JOIN DEPT D 
ON P.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'COMPUTER'

--7. Display all the person's name with the department whose joining date difference with the current date 
--is more than 365 days.
SELECT P.PersonName,D.DepartmentName FROM PERSON P 
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
WHERE DATEDIFF(DAY,JoiningDate,GETDATE()) > 365
--8. Find department wise person counts.
SELECT D.DepartmentName,COUNT(P.PERSONID) AS PERSON_COUNT FROM PERSON P 
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName
--9. Give department wise maximum & minimum salary with department name. 
SELECT D.DepartmentName,
		MAX(P.Salary) AS MAX_SALARY,
		MIN(P.SALARY) AS MIN_SALARY
FROM PERSON P 
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName
--10. Find city wise total, average, maximum and minimum salary. 
SELECT P.City,
		AVG(P.SALARY) AS AVG_SALARY,
		MAX(P.Salary) AS MAX_SALARY,
		MIN(P.SALARY) AS MIN_SALARY
FROM PERSON P 
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
GROUP BY P.City
--11. Find the average salary of a person who belongs to Ahmedabad city. 
SELECT 
    AVG(P.Salary) AS AVG_SALARY
FROM PERSON P
WHERE P.City = 'Ahmedabad';

--12. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In 
--single column) 
SELECT 
    P.PersonName + ' lives in ' + P.City + 
    ' and works in ' + D.DepartmentName + ' Department.' AS Description
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID;

--Part – B: SELECT 
    P.PersonName + ' earns ' + 
    CAST(P.Salary AS VARCHAR(20)) + 
    ' from ' + D.DepartmentName + 
    ' department monthly.' AS Description
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID;

--2. Find city & department wise total, average & maximum salaries. 
SELECT P.City,D.DepartmentName,
		AVG(P.SALARY) AS AVG_SALARY,
		MAX(P.Salary) AS MAX_SALARY,
		MIN(P.SALARY) AS MIN_SALARY
FROM PERSON P 
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
GROUP BY P.City,D.DepartmentName
--3. Find all persons who do not belong to any department. 
SELECT P.PersonName FROM PERSON P 
LEFT JOIN DEPT D 
ON P.DepartmentID = D.DepartmentID
WHERE D.DepartmentID IS NULL
--4. Find all departments whose total salary is exceeding 100000. 
SELECT 
    D.DepartmentName,
    SUM(P.Salary) AS Total_Salary
FROM DEPT D
JOIN PERSON P
ON D.DepartmentID = P.DepartmentID
GROUP BY D.DepartmentName
HAVING SUM(P.Salary) > 100000;

--Part – C: 
SELECT 
    D.DepartmentName
FROM DEPT D
LEFT JOIN PERSON P
ON D.DepartmentID = P.DepartmentID
WHERE P.PersonID IS NULL;
--2. List out department names in which more than two persons are working. 
SELECT 
    D.DepartmentName
FROM DEPT D
JOIN PERSON P
ON D.DepartmentID = P.DepartmentID
GROUP BY D.DepartmentName
HAVING COUNT(P.PersonID) > 2;

--3. Give a 10% increment in the computer department employee’s salary. (Use Update) 
UPDATE P
SET P.Salary = P.Salary + (P.Salary * 0.10)
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Computer';

