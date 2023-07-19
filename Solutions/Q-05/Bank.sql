-- By - Kaustav Purkayastha ( Gurucharan University, Silchar - @ Department of Computer Science )

/* 5. Create the following tables:
		Customer (Cid, Cname);  'Cid' as primary key.
		Branch (Bcode, Bname);  'Bcode' as primary key.
		Account (Ano, Atype, Balance, Cid, Bcode);  'Ano' as primary key.
	An account can be saving account or a current account. Check Atype in 'S' or 'C'. A customer can have both types of accounts.
		Transaction (Tid, Ano, Ttype, Tdate, Tamount);  'Tid' and 'Ano' as primary key.
	Ttype can be 'D' or 'W'. D - Deposit, W - Withdrawal.
	(a) Make entries in each of the table.
	(b) Develop a SQL query to list the details of customers who have a saving account and a current account.
	(c) Develop a SQL query to list the details of branches and the number of accounts in each branch.
	(d) Develop a SQL query to list the details of branches where the number of accounts is less than the average number of accounts in all branches.		*/


-- Create the Customer table with Cid and Cname columns
CREATE TABLE Customer (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50)
);

-- Create the Branch table with Bcode and Bname columns
CREATE TABLE Branch (
    Bcode INT PRIMARY KEY,
    Bname VARCHAR(50)
);

-- Create the Account table with Ano, Atype, Balance, Cid, and Bcode columns
CREATE TABLE Account (
    Ano INT PRIMARY KEY,
    Atype CHAR(1),
    Balance FLOAT,
    Cid INT,
    Bcode INT,
    FOREIGN KEY (Cid) REFERENCES Customer(Cid),
    FOREIGN KEY (Bcode) REFERENCES Branch(Bcode)
);

-- Create the Transaction table with Tid, Ano, Ttype, Tdate, and Tamount columns
CREATE TABLE Transaction (
    Tid INT PRIMARY KEY,
    Ano INT,
    Ttype CHAR(1),
    Tdate DATE,
    Tamount FLOAT,
    FOREIGN KEY (Ano) REFERENCES Account(Ano)
);


-- Insert some sample data into the tables
INSERT INTO Customer (Cid, Cname)
VALUES 
    (1, 'John'),
    (2, 'Jane'),
    (3, 'Mary'),
    (4, 'Bob'),
    (5, 'Alice');

INSERT INTO Branch (Bcode, Bname)
VALUES 
    (101, 'Main Branch'),
    (102, 'Downtown Branch'),
    (103, 'Uptown Branch');

INSERT INTO Account (Ano, Atype, Balance, Cid, Bcode)
VALUES 
    (1001, 'S', 5000, 1, 101),
    (1002, 'C', 10000, 1, 101),
    (1003, 'S', 7500, 2, 102),
    (1004, 'C', 15000, 2, 102),
    (1005, 'S', 10000, 3, 103),
    (1006, 'C', 20000, 3, 103),
    (1007, 'S', 2500, 4, 103),
    (1008, 'C', 5000, 5, 101);

INSERT INTO Transaction (Tid, Ano, Ttype, Tdate, Tamount)
VALUES 
    (1, 1001, 'D', '2022-03-01', 2500),
    (2, 1002, 'W', '2022-03-01', 1000),
    (3, 1003, 'D', '2022-03-02', 500),
    (4, 1004, 'W', '2022-03-02', 2000),
    (5, 1005, 'D', '2022-03-03', 1000),
    (6, 1006, 'W', '2022-03-03', 500),
    (7, 1007, 'D', '2022-03-04', 250),
    (8, 1008, 'W', '2022-03-04', 1000);


-- Develop a SQL query to list the details of customers who have a saving account and a current account
SELECT DISTINCT c.Cid, c.Cname
FROM Customer c
INNER JOIN Account a1 ON c.Cid = a1.Cid AND a1.Atype = 'S'
INNER JOIN Account a2 ON c.Cid = a2.Cid AND a2.Atype = 'C'
WHERE a1.Cid = a2.Cid;


-- Develop a SQL query to list the details of branches and the number of accounts in each branch
SELECT b.Bcode, b.Bname, COUNT(*) as num_accounts
FROM Branch b
INNER JOIN Account a ON b.Bcode = a.Bcode
GROUP BY b.Bcode, b.Bname;


-- Develop a SQL query to list the details of branches where the number of accounts is less than the average number of accounts in all branches
SELECT b.Bcode, b.Bname, COUNT(*) as num_accounts
FROM Branch b
INNER JOIN Account a ON b.Bcode = a.Bcode
GROUP BY b.Bcode, b.Bname
HAVING COUNT(*) < (SELECT AVG(num_accounts) FROM (SELECT Bcode, COUNT(*) as num_accounts FROM Account GROUP BY Bcode) as account_counts);
