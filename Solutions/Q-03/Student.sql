-- By - Kaustav Purkayastha ( Gurucharan University, Silchar - @ Department of Computer Science )

/* 3. Create a table Student (roll, name, address, dept). 'roll' as primary key.
	(a) Store at least 5 records.
	(b) Add an attribute named 'contact' in the table.
	(c) Update all the records.		*/


-- Create the Student table with the specified columns
CREATE TABLE Student (
    roll INT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(100),
    dept VARCHAR(50)
);


-- Insert five records into the Student table
INSERT INTO Student (roll, name, address, dept)
VALUES 
    (101, 'John', '123 Main St, Anytown', 'Computer Science'),
    (102, 'Jane', '456 Broadway, Somecity', 'Physics'),
    (103, 'Mary', '789 5th Ave, Othercity', 'Biology'),
    (104, 'Bob', '321 Elm St, Theirtown', 'Mathematics'),
    (105, 'Alice', '654 Park Ave, Mycity', 'Chemistry');


-- Add a contact column to the Student table
ALTER TABLE Student
ADD contact VARCHAR(20);


-- Update each record in the Student table with a different value for the contact column
UPDATE Student
SET contact = 
    CASE roll
        WHEN 101 THEN '1111111111'
        WHEN 102 THEN '2222222222'
        WHEN 103 THEN '3333333333'
        WHEN 104 THEN '4444444444'
        WHEN 105 THEN '5555555555'
    END;
