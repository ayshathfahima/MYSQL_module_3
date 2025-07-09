CREATE database CompanyDB;
USE CompanyDB;
-- Step 1: Create the Managers Table
CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    DOB DATE,
    Age INT CHECK (Age >= 18),
    Last_update DATE,
    Gender VARCHAR(10),
    Department VARCHAR(50),
    Salary DECIMAL(10,2) NOT NULL
);

-- Step 2: Insert 10 Rows
INSERT INTO Managers 
(Manager_Id, First_name, Last_name, DOB, Age, Last_update, Gender, Department, Salary)
VALUES 
(1, 'Jazlan', 'Muhammed', '1985-05-15', 40, '2025-07-01', 'Male', 'HR', 30000),
(2, 'Aaliya', 'Khan', '1990-04-20', 35, '2025-07-01', 'Female', 'Finance', 28000),
(3, 'Dora', 'Buji', '1988-02-12', 37, '2025-07-01', 'Male', 'IT', 32000),
(4, 'Nihla', 'Patel', '1992-10-09', 32, '2025-07-01', 'Female', 'IT', 27000),
(5, 'Ali', 'Shaikh', '1980-11-30', 44, '2025-07-01', 'Male', 'Admin', 22000),
(6, 'Sana', 'fathima', '1986-01-05', 39, '2025-07-01', 'Female', 'HR', 31000),
(7, 'Liaqat', 'Ali', '1991-08-15', 33, '2025-07-01', 'Male', 'IT', 26000),
(8, 'Emma', 'Watson', '1993-03-25', 32, '2025-07-01', 'Female', 'Marketing', 29000),
(9, 'Robert', 'Taylor', '1987-12-12', 37, '2025-07-01', 'Male', 'Finance', 34000),
(10, 'Sara', 'Ali', '1995-06-18', 30, '2025-07-01', 'Female', 'IT', 15000);

-- Step 3: Retrieve Name and DOB of Manager with Manager_Id = 1
SELECT First_name, Last_name, DOB
FROM Managers
WHERE Manager_Id = 1;

-- Step 4: Display Annual Income (Salary * 12) of All Managers
SELECT Manager_Id, First_name, Last_name, (Salary * 12) AS Annual_Income
FROM Managers;

-- Step 5: Display Records of All Managers Except 'Aaliya'
SELECT *
FROM Managers
WHERE First_name <> 'Aaliya';

-- Step 6: Display Managers from IT Department Earning More Than 25000
SELECT *
FROM Managers
WHERE Department = 'IT' AND Salary > 25000;

-- Step 7: Display Managers with Salary Between 10000 and 35000
SELECT *
FROM Managers
WHERE Salary BETWEEN 10000 AND 35000;
