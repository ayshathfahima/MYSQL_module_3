
USE JoinUnionPractice;
ALTER TABLE Persons
ADD DOB DATE;

UPDATE Persons SET DOB = '2000-01-01' WHERE Id = 1;
UPDATE Persons SET DOB = '1990-02-15' WHERE Id = 2;
UPDATE Persons SET DOB = '1985-12-20' WHERE Id = 3;
UPDATE Persons SET DOB = '1995-08-05' WHERE Id = 4;
UPDATE Persons SET DOB = '2001-11-11' WHERE Id = 5;
UPDATE Persons SET DOB = '1999-06-30' WHERE Id = 6;
UPDATE Persons SET DOB = '1988-09-19' WHERE Id = 7;
UPDATE Persons SET DOB = '1992-03-25' WHERE Id = 8;
UPDATE Persons SET DOB = '1996-07-10' WHERE Id = 9;
UPDATE Persons SET DOB = '2003-04-14' WHERE Id = 10;

-- (2) Create a user-defined function to calculate age
DELIMITER //

CREATE FUNCTION CalculateAge(dob DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, dob, CURDATE());
    RETURN age;
END //

DELIMITER ;

-- (3) Use the function to select age of all persons
SELECT 
    Id,
    Fname,
    Lname,
    DOB,
    CalculateAge(DOB) AS Age
FROM Persons;

-- (4) Find the length of each country name in the Country table
SELECT 
    Country_name,
    LENGTH(Country_name) AS Name_Length
FROM Country;

-- (5) Extract first three characters of each country name
SELECT 
    Country_name,
    LEFT(Country_name, 3) AS First_3_Chars
FROM Country;

-- (6) Convert all country names to uppercase and lowercase
SELECT 
    Country_name,
    UPPER(Country_name) AS Country_Upper,
    LOWER(Country_name) AS Country_Lower
FROM Country;

