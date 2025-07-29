CREATE DATABASE capitaledge;
USE capitaledge;

CREATE TABLE clients(
ClientID INT,
Firstname VARCHAR(50),
Lastname VARCHAR (50),
Country VARCHAR (50),
PRIMARY KEY (ClientID)
);

CREATE TABLE portfolios (
    PortfolioID INT PRIMARY KEY,
    ClientID INT,
    PortfolioName VARCHAR(100),
    CreatedDate DATE,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
); 

CREATE TABLE investments (
    InvestmentID INT PRIMARY KEY,
    PortfolioID INT,
    AssetType VARCHAR(50),
    AssetName VARCHAR(100),
    AmountInvested DECIMAL(10,2),
    InvestmentDate DATE,
    FOREIGN KEY (PortfolioID) REFERENCES portfolios(PortfolioID)
);

INSERT INTO Clients VALUES 
(1, 'Alice', 'Nguyen', 'USA'),
(2, 'Ben', 'Carter', 'UK'),
(3, 'Carlos', 'Diaz', 'Canada');

INSERT INTO Portfolios VALUES
(101, 1, 'Growth Fund', '2023-01-15'),
(102, 2, 'Dividend Fund', '2023-05-20'),
(103, 1, 'Tech Ventures', '2024-03-05');

INSERT INTO Investments VALUES
(201, 101, 'Stock', 'Apple', 10000.00, '2024-01-10'),
(202, 101, 'ETF', 'Vanguard S&P 500', 5000.00, '2024-02-10'),
(203, 102, 'Bond', 'UK Govt Bond', 8000.00, '2024-01-15'),
(204, 103, 'Crypto', 'Ethereum', 3000.00, '2024-06-01');

show tables;
show columns in clients;
show columns in portfolios;
show columns in investments;

-- Show all investments in order by amount
SELECT * FROM Investments
ORDER BY AmountInvested DESC;

-- Count how many investments each client has
SELECT ClientID, COUNT(*) AS InvestmentCount
FROM Portfolios p
JOIN Investments i ON p.PortfolioID = i.PortfolioID
GROUP BY ClientID;

-- Show distinct asset types
SELECT DISTINCT AssetType from investments;

-- Show all clients from the USA
SELECT * FROM clients
WHERE country = 'USA';

-- Update a client’s country
UPDATE clients 
SET country = 'United States'
WHERE clientID = 1;

-- Add a new column to Investments
ALTER TABLE investments
ADD Currency VARCHAR (50);

SELECT * FROM investments;

-- BONUS: Add an Advisors table and link clients to advisors
CREATE TABLE Advisors (
    AdvisorID INT PRIMARY KEY,
    AdvisorName VARCHAR(100)
);

-- Add an AdvisorID column to Clients table
ALTER TABLE Clients
ADD AdvisorID INT;

-- Establish foreign key relationship
ALTER TABLE Clients
ADD FOREIGN KEY (AdvisorID) REFERENCES Advisors(AdvisorID);

-- Insert sample advisors 
INSERT INTO Advisors VALUES
(1, 'Linda Matthews'),
(2, 'James Park');

-- Assign advisors to clients
UPDATE Clients SET AdvisorID = 1 WHERE ClientID = 1;
UPDATE Clients SET AdvisorID = 2 WHERE ClientID = 2;
UPDATE Clients SET AdvisorID = 1 WHERE ClientID = 3;

-- Bonus Challenge 2: Total invested per asset type
SELECT AssetType, SUM(AmountInvested) AS TotalInvested
FROM Investments
GROUP BY AssetType;

-- Bonus Challenge 3: Join to list investments with client full names
SELECT 
    c.FirstName || ' ' || c.LastName AS ClientName,
    i.AssetType,
    i.AssetName,
    i.AmountInvested
FROM Clients c
JOIN Portfolios p ON c.ClientID = p.ClientID
JOIN Investments i ON p.PortfolioID = i.PortfolioID;
