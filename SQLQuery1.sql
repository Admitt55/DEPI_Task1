create database task

USE task

CREATE SCHEMA HR

CREATE TABLE department (
    DNum int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	DName varchar(50) NOT NULL,
    locations varchar(100) NULL,
);
--------------------------------------
CREATE TABLE Employee (
    SSN int PRIMARY KEY IDENTITY(100,1),
    FName varchar(50) NOT NULL,
    LName varchar(50) NOT NULL,
    birth_date int NULL,
    gender varchar(1) NOT NULL,
    MangerSSN int NOT NULL,
	Dept_ID int default 1,
	foreign key(DeptID) references department(DNum)
	on DELETE set DEFAULT
	on UPDATE cascade,
);
--------------------------------------
CREATE TABLE project (
    PNum int PRIMARY KEY NOT NULL,
    PName varchar(50) NOT NULL,
    location_city varchar(50) NULL,
	Project_DNum int default 1,
	Emp_projrct_SSN int default 101,
	FOREIGN KEY (Project_DNum) REFERENCES department(DNum)
	ON DELETE CASCADE,
	FOREIGN KEY (Emp_projrct_SSN) REFERENCES Employee(SSN),
);
--------------------------------------
CREATE TABLE dependent(
    DependentName varchar(50) PRIMARY KEY NOT NULL,
    Gender varchar(6) NOT NULL,
    Birth_Date Date NULL,
);
--------------------------------------
INSERT INTO EMPLOYEE(SSN ,FName ,LName ,birth_date ,gender ,MangerSSN) VALUES
(101, 'Youssef' ,'Hisham','14-12-2005' ,'M', 2),
(102, 'Yara' ,'Ahmed','1-1-1995' , 'F',  1),
(103, 'Omar' ,'Hossam','5-7-1999' , 'M',  1),
(104, 'Adham' ,'Mohamed','24-6-2002' , 'M',  2),
(105, 'Ahmed' ,'Hossam', '2-1-2000' ,'M', 3);
--------------------------------------
INSERT INTO department(DNum,DName,locations) VALUES
(1, 'IT', 'Cairo'),
(2, 'HR', 'Giza'),
(3, 'Finance', 'Alexandria');
--------------------------------------
UPDATE Employee
SET DNum = 1
WHERE SSN = 105;
--------------------------------------
SELECT *FROM Employee WHERE gender NOT IN ('M', 'F');

