
-- REPOSITORY: SQL-Mastery-Journey
-- MODULE: 02 - Advanced Filtering & Logic
-- BRAND: Data With RISHAL
-- OBJECTIVE: Extracting high-value business insights using 
--            Logical Operators, Range Filtering, and Wildcards.


/* SCENARIO: 
   The Management team requires a report on 'Premium Performance'. 
   We need to identify high-ticket transactions, specific regional 
   performance, and targeted customer segments.
*/

-- 1. IDENTIFYING HIGH-VALUE INVENTORY
-- Goal: Filter products that are priced above the luxury threshold (50,000)
-- and belong to specific high-margin categories.
SELECT 
    product_name, 
    category, 
    price, 
    stock_quantity
FROM Inventory
WHERE price >= 50000 
  AND stock_quantity < 10
ORDER BY price DESC;

-- 2. TEMPORAL & REGIONAL PERFORMANCE (BETWEEN & IN)
-- Goal: Extract sales data for the Q1 peak period for specific 
-- high-performing branches (Calicut, Kochi, Dubai).
SELECT 
    transaction_id, 
    branch_name, 
    amount, 
    transaction_date
FROM Sales
WHERE branch_name IN ('Calicut', 'Kochi', 'Dubai')
  AND transaction_date BETWEEN '2026-01-01' AND '2026-03-31'
  AND status = 'Completed'
ORDER BY transaction_date ASC;

-- 3. TARGETED CUSTOMER SEGMENTATION (LIKE & NULL)
-- Goal: Find corporate or specialized clients (names containing 'Corp' or 'Ltd') 
-- who have a registered email and are active in our system.
SELECT 
    customer_name, 
    email, 
    membership_level
FROM Customers
WHERE (customer_name LIKE '%Corp%' OR customer_name LIKE '%Ltd%')
  AND email IS NOT NULL
  AND account_status != 'Suspended';