-- 1. Create a new database
CREATE DATABASE IF NOT EXISTS SchoolDB;

-- 2. Use the new database
USE SchoolDB;

-- 3. Create the teachers table
CREATE TABLE IF NOT EXISTS teachers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    subject VARCHAR(50),
    experience INT,
    salary DECIMAL(10,2)
);

-- 4. Create the teacher_log table
CREATE TABLE IF NOT EXISTS teacher_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT,
    action VARCHAR(20),
    action_timestamp DATETIME
);

-- 5. Insert 8 rows into teachers
INSERT INTO teachers (id, name, subject, experience, salary) VALUES
(1, 'Ali', 'Math', 12, 50000),
(2, 'Ihsan', 'Physics', 8, 48000),
(3, 'Jannat', 'Chemistry', 15, 52000),
(4, 'Jazlan', 'Biology', 5, 47000),
(5, 'Eva', 'English', 9, 45000),
(6, 'Fahima', 'History', 11, 49000),
(7, 'Aysha', 'Geography', 7, 46000),
(8, 'Hannah', 'Art', 3, 43000);

-- 6. BEFORE INSERT trigger: prevent negative salary
DELIMITER $$

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'salary cannot be negative';
    END IF;
END$$

DELIMITER ;

-- 7. AFTER INSERT trigger: log insert actions
DELIMITER $$

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, action_timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END$$

DELIMITER ;

-- 8. BEFORE DELETE trigger: block delete if experience > 10
DELIMITER $$

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete teacher with experience > 10 years';
    END IF;
END$$

DELIMITER ;

-- 9. AFTER DELETE trigger: log delete actions
DELIMITER $$

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, action_timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END$$

DELIMITER ;


