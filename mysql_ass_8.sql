
USE JoinUnionPractice;

-- 1. Number of persons in each country
SELECT Country_name, COUNT(*) AS Person_Count
FROM Persons
GROUP BY Country_name;

-- 2. Number of persons in each country sorted from high to low
SELECT Country_name, COUNT(*) AS Person_Count
FROM Persons
GROUP BY Country_name
ORDER BY Person_Count DESC;

-- 3. Average rating of persons in each country if avg > 3.0
SELECT Country_name, AVG(Rating) AS Avg_Rating
FROM Persons
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;

-- 4. Countries with same average rating as USA (using subquery)
SELECT Country_name
FROM Persons
GROUP BY Country_name
HAVING ROUND(AVG(Rating), 1) = (
    SELECT ROUND(AVG(Rating), 1)
    FROM Persons
    WHERE Country_name = 'USA'
);

-- 5. Countries with population greater than average (using subquery)
SELECT Country_name, Population
FROM Country
WHERE Population > (
    SELECT AVG(Population) FROM Country
);


--  Create database and use it
CREATE DATABASE IF NOT EXISTS Product;
USE Product;

-- 1. Create Customer table
CREATE TABLE IF NOT EXISTS Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(100),
    Last_name VARCHAR(100),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    Zip_code VARCHAR(10),
    Country VARCHAR(100)
);

-- 2. Insert sample data
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
(1, 'Ali', 'Brown', 'ali@example.com', '1234567890', '123 Apple St', 'San Francisco', 'California', '94101', 'USA'),
(2, 'Bipin', 'Smith', 'bipin@example.com', '1234567891', '456 Orange Ave', 'Los Angeles', 'California', '90001', 'USA'),
(3, 'Aysha', 'Doe', 'aysha@example.com', '1234567892', '789 Peach Blvd', 'New York', 'New York', '10001', 'USA'),
(4, 'Jasei', 'Davis', 'jaser@example.com', '1234567893', '321 Grape St', 'Austin', 'Texas', '73301', 'USA'),
(5, 'Twaha', 'Wilson', 'twaham@example.com', '1234567894', '987 Pine St', 'Seattle', 'Washington', '98101', 'USA'),
(6, 'Liya', 'Jones', 'liya@example.com', '1234567895', '654 Oak St', 'Boston', 'Massachusetts', '02101', 'USA'),
(7, 'Ebrahim', 'White', 'ebrahim@example.com', '1234567896', '963 Elm St', 'San Jose', 'California', '95101', 'USA'),
(8, 'Mariam', 'Jannat', 'mariyam@example.com', '1234567897', '147 Maple St', 'San Diego', 'California', '92101', 'USA'),
(9, 'Sara', 'Black', 'sara@example.com', '1234567898', '258 Palm St', 'Miami', 'Florida', '33101', 'USA'),
(10, 'Lahiq', 'Gray', 'lahiq@example.com', '1234567899', '369 Cedar St', 'Dallas', 'Texas', '75201', 'USA');

-- 3. Create view: customer_info (full name & email)
CREATE VIEW customer_info AS
SELECT 
    CONCAT(First_name, ' ', Last_name) AS Full_Name,
    Email
FROM Customer;

-- Select from customer_info view
SELECT * FROM customer_info;

-- 4. Create view: US_Customers
CREATE VIEW US_Customers AS
SELECT *
FROM Customer
WHERE Country = 'USA';

-- 5. Create view: Customer_details
CREATE VIEW Customer_details AS
SELECT 
    CONCAT(First_name, ' ', Last_name) AS Full_Name,
    Email,
    Phone_no,
    State
FROM Customer;

-- 6. Update phone numbers of customers in California
UPDATE Customer
SET Phone_no = '9999999999'
WHERE State = 'California';

-- 7. Count customers in each state with more than 5 customers
SELECT State, COUNT(*) AS Customer_Count
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

-- 8. Count customers per state using Customer_details view
SELECT State, COUNT(*) AS Total_Customers
FROM Customer_details
GROUP BY State;

-- 9. Select all columns from Customer_details view ordered by state ASC
SELECT *
FROM Customer_details
ORDER BY State ASC;
