-- Step 1: Create a new Employee table
CREATE TABLE IF NOT EXISTS Employee (
    Emp_Id INT PRIMARY KEY,
    First_Name CHAR(25),
    Last_Name CHAR(25),
    Salary INT(10),
    Joining_Date DATETIME,
    Department CHAR(25)
);

-- Step 2: Insert sample data into Employee
INSERT INTO Employee VALUES 
(101, 'Ravi', 'Kumar', 45000, '2019-01-10 09:00:00', 'HR'),
(102, 'Neha', 'Singh', 52000, '2020-06-22 10:15:00', 'Finance'),
(103, 'Arjun', 'Verma', 48000, '2021-03-14 11:30:00', 'IT'),
(104, 'Meera', 'Nair', 51000, '2018-11-03 08:45:00', 'Finance'),
(105, 'Zara', 'Shaikh', 47000, '2022-09-19 12:00:00', 'IT');

-- Step 3: Procedure to insert a new employee
DROP PROCEDURE IF EXISTS InsertEmployee;
DELIMITER $$

CREATE PROCEDURE InsertEmployee (
    IN p_Emp_Id INT,
    IN p_First_Name CHAR(25),
    IN p_Last_Name CHAR(25),
    IN p_Salary INT,
    IN p_Joining_Date DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Employee (Emp_Id, First_Name, Last_Name, Salary, Joining_Date, Department)
    VALUES (p_Emp_Id, p_First_Name, p_Last_Name, p_Salary, p_Joining_Date, p_Department);
END$$

DELIMITER ;

-- Call InsertEmployee procedure
CALL InsertEmployee(106, 'Ayaan', 'Khan', 50000, '2023-04-05 09:30:00', 'HR');


-- Step 4: Procedure to get salary by employee ID
DROP PROCEDURE IF EXISTS GetEmployeeSalary;
DELIMITER $$

CREATE PROCEDURE GetEmployeeSalary (
    IN p_Emp_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM Employee
    WHERE Emp_Id = p_Emp_Id;
END$$

DELIMITER ;

-- Call GetEmployeeSalary procedure
SET @emp_salary = 0;
CALL GetEmployeeSalary(103, @emp_salary);
SELECT @emp_salary AS 'Employee Salary';


-- Step 5: Procedure to update department
DROP PROCEDURE IF EXISTS UpdateEmployeeDepartment;
DELIMITER $$

CREATE PROCEDURE UpdateEmployeeDepartment (
    IN p_Emp_Id INT,
    IN p_New_Dept CHAR(25)
)
BEGIN
    UPDATE Employee
    SET Department = p_New_Dept
    WHERE Emp_Id = p_Emp_Id;
END$$

DELIMITER ;

-- Call UpdateEmployeeDepartment procedure
CALL UpdateEmployeeDepartment(104, 'Operations');


-- Step 6: Procedure to count employees in a department
DROP PROCEDURE IF EXISTS CountEmployeesInDept;
DELIMITER $$

CREATE PROCEDURE CountEmployeesInDept (
    IN p_Dept CHAR(25),
    OUT p_Count INT
)
BEGIN
    SELECT COUNT(*) INTO p_Count
    FROM Employee
    WHERE Department = p_Dept;
END$$

DELIMITER ;

-- Call CountEmployeesInDept procedure
SET @dept_count = 0;
CALL CountEmployeesInDept('IT', @dept_count);
SELECT @dept_count AS 'Number of Employees in IT';


-- Step 7: Procedure to calculate average salary in a department
DROP PROCEDURE IF EXISTS AvgSalaryByDept;
DELIMITER $$

CREATE PROCEDURE AvgSalaryByDept (
    IN p_Dept CHAR(25),
    OUT p_AvgSalary DECIMAL(10,2)
)
BEGIN
    SELECT AVG(Salary) INTO p_AvgSalary
    FROM Employee
    WHERE Department = p_Dept;
END$$

DELIMITER ;

-- Call AvgSalaryByDept procedure
SET @avg_salary = 0;
CALL AvgSalaryByDept('Finance', @avg_salary);
SELECT @avg_salary AS 'Average Salary in Finance';
