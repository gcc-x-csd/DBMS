-- By - Kaustav Purkayastha ( Gurucharan University, Silchar - @ Department of Computer Science )

/* 4. Create a table Client (clno, name, address, city, state).
	(a) Display the distinct city in the table.
	(b) List the name and city of clients in the state 'Assam'.
	(c) Count the number of clients in the state 'Bihar'.		*/


-- Create the Client table with clno, name, address, city, and state columns
CREATE TABLE Client (
    clno INT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50)
);


-- Insert some sample data into the Client table
INSERT INTO Client (clno, name, address, city, state)
VALUES 
    (101, 'John', '123 Main St, Anytown', 'Anytown', 'New York'),
    (102, 'Jane', '456 Broadway, Somecity', 'Somecity', 'California'),
    (103, 'Mary', '789 5th Ave, Othercity', 'Othercity', 'Texas'),
    (104, 'Bob', '321 Elm St, Theirtown', 'Theirtown', 'New York'),
    (105, 'Alice', '654 Park Ave, Mycity', 'Mycity', 'Assam'),
    (106, 'David', '987 High St, Yourcity', 'Yourcity', 'Assam'),
    (107, 'Karen', '555 Market St, Ourcity', 'Ourcity', 'Bihar'),
    (108, 'Tom', '2222 Maple Ave, Hiscity', 'Hiscity', 'Bihar'),
    (109, 'Mike', '3333 Oak St, Hercity', 'Hercity', 'Bihar');


-- Display the distinct cities in the Client table
SELECT DISTINCT city FROM Client;


-- List the name and city of clients in the state 'Assam'
SELECT name, city FROM Client WHERE state = 'Assam';


-- Count the number of clients in the state 'Bihar'
SELECT COUNT(*) FROM Client WHERE state = 'Bihar';
