-- By - Kaustav Purkayastha ( Gurucharan University, Silchar - @ Department of Computer Science )

/* 2. Create a table Route (rid, rno, origin, destn, fare, distance). 'rid' as primary key.
	(a) Make at least 6 entries in the table.
	(b) Display only those routes whose origin has a substring 'ma'.
	(c) Increase the fare of all the routes by 5%.		*/


-- Create the Route table with the specified columns
CREATE TABLE Route (
    rid INT PRIMARY KEY,
    rno VARCHAR(10),
    origin VARCHAR(50),
    destn VARCHAR(50),
    fare DECIMAL(10, 2),
    distance DECIMAL(10, 2)
);


-- Insert at least 6 entries into the Route table
INSERT INTO Route (rid, rno, origin, destn, fare, distance)
VALUES
    (1, 'R1001', 'Mumbai', 'Delhi', 2000.00, 1500.00),
    (2, 'R1002', 'Bangalore', 'Chennai', 1500.00, 800.00),
    (3, 'R1003', 'Hyderabad', 'Kolkata', 3000.00, 2000.00),
    (4, 'R1004', 'Jaipur', 'Ahmedabad', 1000.00, 500.00),
    (5, 'R1005', 'Pune', 'Nagpur', 1200.00, 700.00),
    (6, 'R1006', 'Mangalore', 'Goa', 800.00, 400.00);


-- Display only those routes whose origin has a substring 'ma'
SELECT * FROM Route WHERE origin LIKE '%ma%';


-- Increase the fare of all the routes by 5%
UPDATE Route SET fare = fare + (fare * 0.05);
