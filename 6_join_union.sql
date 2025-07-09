
CREATE DATABASE IF NOT EXISTS JoinUnion;

-- Use the database
USE JoinUnion;

-- Create Country table
CREATE TABLE IF NOT EXISTS Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100),
    Population INT,
    Area FLOAT
);

-- Create Persons table
CREATE TABLE IF NOT EXISTS Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating FLOAT,
    Country_Id INT,
    Country_name VARCHAR(100)
);

-- Insert sample data into Country table
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

-- Insert sample data into Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'Alice', 'Smith', 10000, 4.5, 1, 'USA'),
(2, 'Bob', 'Johnson', 12000, 4.1, 2, 'Canada'),
(3, 'Charlie', 'Williams', 8000, 3.9, 3, 'India'),
(4, 'David', 'Brown', 15000, 4.7, 4, 'UK'),
(5, 'Eve', 'Jones', 9000, 3.5, 5, 'Australia'),
(6, 'Frank', 'Garcia', 7000, 4.9, 6, 'Germany'),
(7, 'Grace', 'Miller', 11000, 4.2, 7, 'France'),
(8, 'Heidi', 'Davis', 9500, 5.0, 8, 'Brazil'),
(9, 'Ivan', 'Martinez', 6000, 2.8, 9, 'Japan'),
(10, 'Judy', 'Lopez', 8500, 4.6, NULL, NULL);

-- ---------------------------------------------
-- (1) INNER JOIN: Persons with matching Country_Id
SELECT 
    p.Id AS Person_ID,
    p.Fname,
    p.Lname,
    p.Country_name AS Person_Country,
    c.Country_name AS Country_Country,
    c.Population AS Country_Population
FROM Persons p
INNER JOIN Country c ON p.Country_Id = c.Id;

-- LEFT JOIN: All persons, match country if possible
SELECT 
    p.Id AS Person_ID,
    p.Fname,
    p.Lname,
    p.Country_name AS Person_Country,
    c.Country_name AS Country_Country,
    c.Population AS Country_Population
FROM Persons p
LEFT JOIN Country c ON p.Country_Id = c.Id;

-- RIGHT JOIN: All countries, match persons if available
-- (Note: RIGHT JOIN not supported in SQLite)
SELECT 
    p.Id AS Person_ID,
    p.Fname,
    p.Lname,
    p.Country_name AS Person_Country,
    c.Country_name AS Country_Country,
    c.Population AS Country_Population
FROM Persons p
RIGHT JOIN Country c ON p.Country_Id = c.Id;

-- ---------------------------------------------
-- (2) DISTINCT country names from both tables
SELECT DISTINCT Country_name FROM Country
UNION
SELECT DISTINCT Country_name FROM Persons;

-- ---------------------------------------------
-- (3) ALL country names including duplicates
SELECT Country_name FROM Country
UNION ALL
SELECT Country_name FROM Persons;

-- ---------------------------------------------
-- (4) ROUND all person ratings to nearest integer
SELECT 
    Id,
    Fname,
    Lname,
    Rating,
    ROUND(Rating) AS Rounded_Rating
FROM Persons;
