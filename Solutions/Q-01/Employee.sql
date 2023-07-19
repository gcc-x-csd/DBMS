-- By - Kaustav Purkayastha ( Gurucharan University, Silchar - @ Department of Computer Science )

/* 1. Create a table Employee (empid, empname, sex, dept, salary). 'empid' as primary key.
    (a) Make at least 6 entries in the table.
    (b) Display the names of the employees whose salary are more than 20000 but less than 30000.
	(c) Count the number of employees who are working in the 'Maths' department.		*/


-- Create table Employee with the specified columns
CREATE TABLE Employee (
    empid INT PRIMARY KEY,
    empname VARCHAR(50),
    sex CHAR(1),
    dept VARCHAR(20),
    salary INT
);


-- Insert 6 sample records into the Employee table
INSERT INTO Employee (empid, empname, sex, dept, salary)
VALUES
    (1, 'John Doe', 'M', 'Maths', 25000),
    (2, 'Jane Smith', 'F', 'Physics', 35000),
    (3, 'Bob Johnson', 'M', 'Maths', 28000),
    (4, 'Samantha Lee', 'F', 'Chemistry', 21000),
    (5, 'Tommy Nguyen', 'M', 'Computer Science', 40000),
    (6, 'Karen Kim', 'F', 'Maths', 22000);


-- Display the names of employees with salary between 20000 and 30000
SELECT empname
FROM Employee
WHERE salary > 20000 AND salary < 30000;


-- Count the number of employees in the Maths department
SELECT COUNT(*) AS math_dept_count
FROM Employee
WHERE dept = 'Maths';
