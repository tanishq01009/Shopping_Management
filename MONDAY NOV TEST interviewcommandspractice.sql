-- 1. Safely recreate the database for clean practice runs
DROP DATABASE IF EXISTS interview_commands_practice;
CREATE DATABASE interview_commands_practice;
USE interview_commands_practice;

SET autocommit = 1;

-- 2. Create table with proper constraints
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(60) NOT NULL,
    department VARCHAR(30) NOT NULL,
    city VARCHAR(40),
    salary DECIMAL(10, 2) CHECK (salary > 0),
    employment_status ENUM('Active', 'Inactive') DEFAULT 'Active',
    phone VARCHAR(15) UNIQUE
) ENGINE = InnoDB;

-- 3. Insert sample records
INSERT INTO employees
    (employee_id, employee_name, department, city, salary, employment_status, phone)
VALUES
    (1, 'Rahul Sharma', 'IT', 'Delhi', 45000.00, 'Active', '9000000001'),
    (2, 'Priya Verma', 'HR', 'Mumbai', 42000.00, 'Active', '9000000002'),
    (3, 'Amit Patel', 'Sales', 'Ahmedabad', 38000.00, 'Inactive', '9000000003'),
    (4, 'Anjali Singh', 'IT', 'Kolkata', 50000.00, 'Active', '9000000004'),
    (5, 'Vijay Kumar', 'Finance', 'Bangalore', 55000.00, 'Active', '9000000005'),
    (6, 'Sanjay Reddy', 'Sales', 'Hyderabad', 36000.00, 'Active', '9000000006'),
    (7, 'Megha Iyer', 'IT', 'Chennai', 48000.00, 'Active', '9000000007'),
    (8, 'Neha Gupta', 'HR', 'Delhi', 32000.00, 'Inactive', '9000000008'),
    (9, 'Arjun Mehta', 'Finance', 'Pune', 52000.00, 'Active', '9000000009'),
    (10, 'Pooja Shah', 'Sales', 'Mumbai', 40000.00, 'Active', '9000000010');
    SELECT * FROM  EMPLOYEES;
    INSERT INTO employees
    (employee_id, employee_name, department, city, salary, employment_status, phone)
VALUES
    (11, 'Karan Malhotra', 'IT', 'Noida', 41000.00, 'Active', '9000000011');
    INSERT INTO employees
    (employee_id, employee_name, department, city, salary, employment_status, phone)
VALUES
    (12, 'Simran Kaur', 'HR', 'Delhi', 35000.00, 'Active', '9000000012'),
    (13, 'Rohan Das', 'Sales', 'Pune', 33000.00, 'Inactive', '9000000013');
    UPDATE employees
SET city = 'Gurgaon',
    salary = 46000.00
WHERE employee_id = 11;
UPDATE employees
SET salary = salary * 1.10
WHERE employee_id IN (1, 4, 7);
DELETE FROM employees
WHERE employee_id IN (3, 8, 13);
ALTER TABLE employees
ADD COLUMN email VARCHAR(100) NULL;
ALTER TABLE employees
MODIFY COLUMN phone VARCHAR(20) NULL;
ALTER TABLE employees
RENAME COLUMN city TO work_city;
ALTER TABLE employees
DROP COLUMN email;
RENAME TABLE employees TO staff;
START TRANSACTION;

INSERT INTO staff
    (employee_id, employee_name, department, work_city, salary, employment_status, phone)
VALUES
    (14, 'Nisha Rao', 'IT', 'Noida', 44000.00, 'Active', '9000000014');

UPDATE staff
SET salary = 45000.00
WHERE employee_id = 2;

COMMIT;
ROLLBACK;
START TRANSACTION;

UPDATE staff
SET salary = 60000.00
WHERE employee_id = 5;

DELETE FROM staff
WHERE employee_id = 6;

ROLLBACK;
START TRANSACTION;

UPDATE staff SET salary = 47000.00 WHERE employee_id = 14;
SAVEPOINT salary_saved;

UPDATE staff SET work_city = 'Jaipur' WHERE employee_id = 14;
SAVEPOINT city_saved;

DELETE FROM staff WHERE employee_id = 14;
ROLLBACK TO SAVEPOINT city_saved;

ROLLBACK TO SAVEPOINT salary_saved;
COMMIT;
START TRANSACTION;
TRUNCATE TABLE staff;
ROLLBACK;
DROP TABLE staff;
DROP DATABASE interview_commands_practice;
    
