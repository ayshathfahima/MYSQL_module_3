-- Step 1: Create the School database
CREATE DATABASE School;
USE School;

CREATE TABLE STUDENT (
    Roll_No INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT,
    Grade CHAR(1)
);

-- Step 4: Insert sample data into STUDENT
INSERT INTO STUDENT (Roll_No, Name, Marks, Grade) VALUES
(1, 'Alice', 85, 'A'),
(2, 'Bob', 76, 'B'),
(3, 'Charlie', 92, 'A'),
(4, 'Diana', 64, 'C');

-- Step 5: Display the contents of the STUDENT table
SELECT * FROM STUDENT;

-- Step 6: Add a c
