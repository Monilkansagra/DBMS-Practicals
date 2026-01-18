CREATE TABLE STU_INFO (
    Rno INT PRIMARY KEY,
    Name VARCHAR(50),
    Branch VARCHAR(10)
);

INSERT INTO STU_INFO (Rno, Name, Branch) VALUES
(101, 'Raju',  'CE'),
(102, 'Amit',  'CE'),
(103, 'Sanjay','ME'),
(104, 'Neha',  'EC'),
(105, 'Meera', 'EE'),
(106, 'Mahesh','ME');

CREATE TABLE RESULT (
    Rno INT,
    SPI DECIMAL(3,1)
);

INSERT INTO RESULT (Rno, SPI) VALUES
(101, 8.8),
(102, 9.2),
(103, 7.6),
(104, 8.2),
(105, 7.0),
(107, 8.9);

CREATE TABLE EMPLOYEE_MASTER (
    EmployeeNo VARCHAR(5) PRIMARY KEY,
    Name VARCHAR(50),
    ManagerNo VARCHAR(5)
);

INSERT INTO EMPLOYEE_MASTER (EmployeeNo, Name, ManagerNo) VALUES
('E01', 'Tarun',  NULL),
('E02', 'Rohan',  'E02'),
('E03', 'Priya',  'E01'),
('E04', 'Milan',  'E03'),
('E05', 'Jay',    'E01'),
('E06', 'Anjana', 'E04');

--Part – A: 
--1. Combine information from student and result table using cross join or Cartesian product. 
select * from STU_INFO CROSS join RESULT
--2. Perform inner join on Student and Result tables. 
SELECT * FROM STU_INFO S JOIN RESULT R
ON S.Rno = R.Rno
--3. Perform the left outer join on Student and Result tables. 
SELECT * FROM STU_INFO S left JOIN RESULT R
ON S.Rno = R.Rno
--4. Perform the right outer join on Student and Result tables. 
SELECT * FROM STU_INFO S RIGHT JOIN RESULT R
ON S.Rno = R.Rno

--5. Perform the full outer join on Student and Result tables.  
SELECT * FROM STU_INFO S FULL OUTER JOIN RESULT R
ON S.Rno = R.Rno
--6. Display Rno, Name, Branch and SPI of all students. 
SELECT S.Rno,S.Branch,S.Name,R.SPI FROM STU_INFO S
JOIN RESULT R
ON S.Rno = R.Rno
--7. Display Rno, Name, Branch and SPI of CE branch’s student only. 
SELECT S.Rno,S.Branch,S.Name,R.SPI FROM STU_INFO S
JOIN RESULT R
ON S.Rno = R.Rno
WHERE S.Branch = 'CE'
--8. Display Rno, Name, Branch and SPI of other than EC branch’s student only. 
SELECT S.Rno,S.Branch,S.Name,R.SPI FROM STU_INFO S
JOIN RESULT R
ON S.Rno = R.Rno
WHERE S.Branch = 'EC'
--9. Display average result of each branch. 
SELECT S.Branch,AVG(R.SPI) AS AVG FROM STU_INFO S
JOIN RESULT R
ON S.Rno = R.Rno
GROUP BY S.Branch
--10. Display average result of CE and ME branch
SELECT S.Branch, AVG(R.SPI) AS AVG FROM STU_INFO S
JOIN RESULT R
ON S.Rno = R.Rno
WHERE S.Branch = 'CE' OR S.Branch = 'ME'
GROUP BY S.Branch

--Part – B: 
--1. Display average result of each branch and sort them in ascending order by SPI. 
SELECT S.Branch,AVG(R.SPI) AS AVG FROM STU_INFO S
JOIN RESULT R
ON S.Rno = R.Rno
GROUP BY S.Branch
ORDER BY AVG 
--2. Display highest SPI from each branch and sort them in descending order.
SELECT S.Branch,MAX(R.SPI) AS MAX_SPI FROM STU_INFO S
JOIN RESULT R
ON S.Rno = R.Rno
GROUP BY S.Branch
ORDER BY MAX_SPI DESC
--Part – C: 
--1. Retrieve the names of employee along with their manager’s name from the Employee table.
SELECT EMPLOYEE_MASTER.Name,EMPLOYEE_MASTER.ManagerNo FROM EMPLOYEE
JOIN EMPLOYEE_MASTER
ON EMPLOYEE_MASTER.EmployeeNo = EMPLOYEE_MASTER.EmployeeNo