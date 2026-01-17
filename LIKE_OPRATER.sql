CREATE TABLE STUDENT
(
    StudID INT,
    FirstName VARCHAR(25),
    LastName VARCHAR(25),
    Website VARCHAR(50),
    City VARCHAR(25),
    Address VARCHAR(100)
);
INSERT INTO STUDENT (StudID, FirstName, LastName, Website, City, Address)
VALUES
(1011, 'Keyur',  'Patel',  'technet.com',        'Rajkot',     'A-303 ''Vasant Kunj'', Rajkot'),

(1022, 'Hardik', 'Shah',   'digminecraft.com',   'Ahmedabad',  'Ram Krupa, Raiya Road'),

(1033, 'Kajal',  'Trivedi','bigactivities.com', 'Baroda',     'Raj bhavan plot, near garden'),

(1044, 'Bhoomi', 'Gajera', 'checkyourmath.com',  'Ahmedabad',  'Jig''s Home, Narol'),

(1055, 'Harmit', 'Mitel',  '@me.darshan.com',    'Rajkot',     'B-55, Raj Residency'),

(1066, 'Ashok',  'Jani',   NULL,                 'Baroda',     'A502, Club House Building');


--From the above given tables perform the following queries (LIKE Operation): 
--1. Display the name of students whose name starts with ‘k’.
select FirstName from STUDENT
where FirstName like 'k%'
--2. Display the name of students whose name consists of five characters.
select FirstName from STUDENT
where FirstName like '_____'
--3. Retrieve the first name & last name of students whose city name ends with a & contains six characters. 
SELECT FirstName,LASTNAME FROM STUDENT
WHERE CITY LIKE '_____a'
--4. Display all the students whose last name ends with ‘tel’. 
SELECT LASTNAME FROM STUDENT
WHERE LastName LIKE '%tel'
--5. Display all the students whose first name starts with ‘ha’ & ends with‘t’. 
SELECT FIRSTNAME FROM STUDENT
WHERE FirstName LIKE 'ha%t'
--6. Display all the students whose first name starts with ‘k’ and third character is ‘y’.
SELECT FIRSTNAME FROM STUDENT
WHERE FirstName LIKE 'k_y%'
--7. Display the name of students having no website and name consists of five characters. 
SELECT * FROM STUDENT
WHERE FirstName LIKE '_____' and Website IS NULL
--8. Display all the students whose last name consist of ‘jer’. 
SELECT LastName FROM STUDENT
WHERE LastName LIKE '%jer%'
--9. Display all the students whose city name starts with either ‘r’ or ‘b’. 
select * from STUDENT
where city like 'r%' or city like 'b%'
--10. Display all the name students having websites.
select * from STUDENT
where Website IS NOT null
--11. Display all the students whose name starts from alphabet A to H.
select * from STUDENT
where FirstName LIKE '[A-H]%'
--12. Display all the students whose name’s second character is vowel.
SELECT * FROM STUDENT
WHERE FirstName LIKE '_[AEIOUaeiou]%'
--13. Display the name of students having no website and name consists of minimum five characters. 
select * from STUDENT
where Website IS null and FirstName like '_____'
--14. Display all the students whose last name starts with ‘Pat’.   
select * from STUDENT
where LastName like 'pat%'
--15. Display all the students whose city name does not starts with ‘b’. 
select * from STUDENT
where FirstName not like 'b%'


--Part – B: 
--1. Display all the students whose name starts from alphabet A or H.
SELECT * FROM STUDENT
WHERE FirstName LIKE '[AH]%'
--2. Display all the students whose name’s second character is vowel and of and start with H. 
SELECT * FROM STUDENT
WHERE FirstName LIKE 'H[AEIOUaeiou]%'
--3. Display all the students whose last name does not ends with ‘a’. 
select * from STUDENT
where LastName not like '%a'
--4. Display all the students whose first name starts with consonant. 
select * from STUDENT
where FirstName  like '[AEIOUaeiou]%'
--5. Display all the students whose website contains .net 
select * from Student
where Website like '%net%'
--Part – C: 
--1. Display all the students whose address consist of -.
select * from Student
where Address like '%-%'
--2. Display all the students whose address contains single quote or double quote. 
SELECT *
FROM STUDENT
WHERE Address LIKE '%''%'
   OR Address LIKE '%"%';
--3. Display all the students whose website contains @.
select * from Student
where Website like '%@%'
--4. Display all the names those are either four or five characters.
select * from Student
where FirstName like '____' or FirstName like '_____'
