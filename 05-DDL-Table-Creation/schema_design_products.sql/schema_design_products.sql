-- ************************************************************
-- REPOSITORY: SQL-Mastery-Journey
-- MODULE: 05 - Data Definition Language (DDL)
-- BRAND: Data With RISHAL
-- OBJECTIVE: Designing a scalable table schema from scratch.
-- ************************************************************

/* SCENARIO: 
   As a Data Architect, you are tasked with building a new 
   Inventory Management system. We need a 'Products' table 
   that handles various data types accurately.
*/

-- 1. CREATING THE TABLE
-- Goal: Define the structure with specific data types and constraints.
CREATE TABLE Products (
    product_id INT PRIMARY KEY,              -- Unique ID for every product
    product_name VARCHAR(100) NOT NULL,      -- Text up to 100 characters (Required)
    category VARCHAR(50),                    -- Category classification
    price DECIMAL(10, 2),                   -- Money format: 10 digits total, 2 after decimal
    stock_quantity INT DEFAULT 0,            -- Number of items, defaults to 0
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Auto-records when the row was made
);

-- 2. ALTERING THE STRUCTURE
-- Goal: The business changed! We need to add a 'Supplier' column.
ALTER TABLE Products 
ADD COLUMN supplier_name VARCHAR(100);

-- 3. SCHEMA CLEANUP (Commented out for safety)
-- Goal: How to remove a table if it's no longer needed.
-- DROP TABLE Products;