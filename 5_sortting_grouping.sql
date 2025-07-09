CREATE DATABASE SortGroupPractice;
USE SortGroupPractice;
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
(10, 'Jerin', 'Lopez', 85000, 4.6, 6,'India');

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(11, 'lahiq', NULL, 4000, 3.9, 1, 'USA'),
(12, 'Niyas', NULL, 5000, 4.0, 2, 'Canada');

SELECT LEFT(Country_name, 3) AS ShortName FROM Country;

SELECT CONCAT(Fname, ' ', Lname) AS FullName FROM Persons;

SELECT COUNT(DISTINCT Country_name) AS UniqueCountryCount FROM Persons;

SELECT MAX(Population) AS MaxPopulation FROM Country;

SELECT MIN(Population) AS MinPopulation FROM Persons;

SELECT COUNT(Lname) AS NonNullLnameCount FROM Persons;

SELECT COUNT(*) AS TotalPersons FROM Persons;

SELECT Country_name, Population FROM Country
LIMIT 3;

SELECT * FROM Country
ORDER BY RAND()
LIMIT 3;

SELECT * FROM Persons
ORDER BY Rating DESC;

SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_name;

SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_name
HAVING SUM(Population) > 50000;

SELECT Country_name, COUNT(*) AS Person_Count, AVG(Rating) AS Avg_Rating
FROM Persons
GROUP BY Country_name
HAVING COUNT(*) > 2
ORDER BY Avg_Rating ASC;
