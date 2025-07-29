# 💼 SQL Assignment – Investor Portfolio Management System

This SQL project was created as part of my **Meta Database Engineer Certificate** journey.  
It simulates a real-world investing platform, where we manage client portfolios and track their investments using relational databases.

---

## 🧠 Learning Objectives

Through this hands-on project, I practiced core SQL operations:

- `CREATE DATABASE`, `CREATE TABLE`, `INSERT INTO`
- `SELECT`, `SELECT DISTINCT`, `SELECT COUNT`
- `ORDER BY`, `WHERE`, `JOIN`, `GROUP BY`
- `UPDATE`, `ALTER TABLE`, `DROP TABLE`
- Understanding and applying **primary** and **foreign keys**

---

## 🗃️ Database Structure

### 📁 Tables Created:

#### `Clients`
| Column      | Type         | Description          |
|-------------|--------------|----------------------|
| ClientID    | INT (PK)     | Unique ID for client |
| FirstName   | VARCHAR(50)  | Client's first name  |
| LastName    | VARCHAR(50)  | Client's last name   |
| Country     | VARCHAR(50)  | Client's country     |

#### `Portfolios`
| Column        | Type         | Description               |
|---------------|--------------|---------------------------|
| PortfolioID   | INT (PK)     | Unique ID for portfolio   |
| ClientID      | INT (FK)     | Linked to Clients table   |
| PortfolioName | VARCHAR(100) | Name of the portfolio     |
| CreatedDate   | DATE         | Portfolio creation date   |

#### `Investments`
| Column         | Type          | Description                   |
|----------------|---------------|-------------------------------|
| InvestmentID   | INT (PK)      | Unique ID for investment      |
| PortfolioID    | INT (FK)      | Linked to Portfolios table    |
| AssetType      | VARCHAR(50)   | Type (Stock, Bond, Crypto)    |
| AssetName      | VARCHAR(100)  | Name of asset                 |
| AmountInvested | DECIMAL(10,2) | Amount of money invested      |
| InvestmentDate | DATE          | Date of investment            |
| Currency       | VARCHAR(50)   | (Added later via `ALTER`)     |

---

## 🔍 Practice Tasks

- **Insert sample data** for clients, portfolios, and investments
- Use `ORDER BY` to sort investments by amount
- Use `SELECT DISTINCT` to find unique asset types
- Use `SELECT COUNT` with `GROUP BY` to analyze activity per client
- Modify a client's country using `UPDATE`
- Add a new column using `ALTER TABLE`
- Remove a table with `DROP TABLE` (handling foreign key constraints)

---

## 🧩 Bonus Challenges Solved

✔️ Add and link an `Advisors` table  
✔️ Write a query to show **total invested by asset type**  
✔️ Use `JOIN` to show **client full names with their investments**

---

## 📸 Example Query Output

**Total Invested by Asset Type**

| AssetType | TotalInvested |
|-----------|---------------|
| Stock     | 10000.00      |
| Bond      | 8000.00       |
| Crypto    | 3000.00       |

**Investments with Client Names**

| ClientName     | AssetType | AssetName         | AmountInvested |
|----------------|-----------|-------------------|----------------|
| Alice Nguyen   | Stock     | Apple             | 10000.00       |
| Ben Carter     | Bond      | UK Govt Bond      | 8000.00        |

---

## 📚 Tools Used

- MySQL 8.0
- MySQL Workbench
- Manual debugging of constraint errors (`FOREIGN_KEY_CHECKS`)

---

## 🚀 Summary

This project gave me practical experience with core database design and query building, while simulating how investment platforms track users, portfolios, and financial assets.  
The focus on **normalization, relationships, and query logic** helped reinforce best practices for building clean, scalable SQL systems.

---
