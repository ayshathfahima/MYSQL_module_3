CREATE DATABASE QueryPractice;
USE QueryPractice;
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100),
    Population INT,
    Area FLOAT
);

CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating FLOAT,
    Country_Id INT,
    Country_name VARCHAR(100)
);

INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331000000, 9834000),
(2, 'Canada', 38000000, 9985000),
(3, 'India', 1380000000, 3287000),
(4, 'UK', 67000000, 243610),
(5, 'Australia', 25000000, 7692000),
(6, 'Germany', 83000000, 357400),
(7, 'France', 67000000, 643800),
(8, 'Brazil', 212000000, 8516000),
(9, 'Japan', 126000000, 377975),
(10, 'Mexico', 128000000, 1964000);

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'Ali', 'Smith', 100000, 4.5, 1, 'USA'),
(2, 'Bibin', 'Johnson', 120000, 4.1, 2, 'Canada'),
(3, 'Cindrella', 'Williams', 80000, 3.9, 3, 'India'),
(4, 'Das', 'Brown', 150000, 4.7, 4, 'UK'),
(5, 'Emma', 'Jones', 90000, 3.5, 5, 'Australia'),
(6, 'Franklin', 'Garcia', 70000, 4.9, 6, 'Germany'),
(7, 'George', 'Miller', 110000, 4.2, 7, 'France'),
(8, 'Hamd', 'Davis', 95000, 5.0, 8, 'Brazil'),
(9, 'Ijaz', 'Martinez', 60000, 2.8, 9, 'Japan'),
(10, 'Jerin', 'Lopez', 85000, 4.6, NULL, NULL);

-- 1. List distinct country names from the Persons table
SELECT DISTINCT Country_name FROM Persons;

SELECT Fname AS First_Name, Lname AS Last_Name FROM Persons;
SELECT * FROM Persons WHERE Rating > 4.0;
SELECT * FROM Country WHERE Population > 1000000;
SELECT * FROM Persons
WHERE Country_name = 'USA' OR Rating > 4.5;
SELECT * FROM Persons WHERE Country_name IS NULL;
SELECT * FROM Persons
WHERE Country_name IN ('USA', 'Canada', 'UK');
SELECT * FROM Persons
WHERE Country_name NOT IN ('India', 'Australia');
SELECT * FROM Country
WHERE Population BETWEEN 500000 AND 2000000;
SELECT * FROM Country
WHERE Country_name NOT LIKE 'C%';
