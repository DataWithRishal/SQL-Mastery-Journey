-- ************************************************************
-- REPOSITORY: SQL-Mastery-Journey
-- MODULE: 07 - Data Manipulation Language (DML)
-- BRAND: Data With RISHAL
-- OBJECTIVE: Controlling the flow of data within existing schemas.
-- ************************************************************

/* SCENARIO: 
   The Sales team has new products to add, an existing price 
   to update, and an old category to retire. We must execute 
   these changes precisely.
*/

-- 1. INSERT (Adding fresh data)
-- Goal: Populate our 'Products' table with new inventory.
INSERT INTO Products (product_id, product_name, category, price, stock_quantity)
VALUES 
(101, 'Mechanical Keyboard', 'Electronics', 4500.00, 50),
(102, 'Ergonomic Mouse', 'Electronics', 2200.00, 35),
(103, 'Type-C Hub', 'Accessories', 1500.00, 100);

-- 2. UPDATE (Modifying existing records)
-- Goal: The keyboard is on sale! Reduce the price by 10%.
UPDATE Products
SET price = price * 0.9
WHERE product_name = 'Mechanical Keyboard';

-- 3. DELETE (Removing obsolete data)
-- Goal: Remove products that are out of stock and no longer sold.
-- NOTE: Always use a WHERE clause to avoid deleting the whole table!
DELETE FROM Products
WHERE stock_quantity = 0 AND category = 'Accessories';