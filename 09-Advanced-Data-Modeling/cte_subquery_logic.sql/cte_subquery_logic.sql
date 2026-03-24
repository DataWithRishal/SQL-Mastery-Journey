-- ************************************************************
-- REPOSITORY: SQL-Mastery-Journey
-- MODULE: 09 - Advanced Data Modeling (CTEs & Subqueries)
-- BRAND: Data With RISHAL
-- OBJECTIVE: Implementing modular and complex business logic.
-- ************************************************************

/* SCENARIO: 
   The CEO needs a report on "Top Tier Products." These are 
   products whose price is higher than the average price 
   in their specific category. This requires calculating 
   category averages first, then comparing individual items.
*/

-- 1. COMMON TABLE EXPRESSIONS (CTE) - The Professional Standard
-- We define a "Temporary Result" to hold category averages.
WITH CategoryAverages AS (
    SELECT 
        category, 
        AVG(price) AS avg_category_price
    FROM Products
    GROUP BY category
)
-- Now we use that CTE to find the premium products.
SELECT 
    p.product_name,
    p.category,
    p.price,
    ca.avg_category_price
FROM Products p
JOIN CategoryAverages ca ON p.category = ca.category
WHERE p.price > ca.avg_category_price;

-- 2. CORRELATED SUBQUERY (The Deep Dive)
-- Goal: Find customers who have placed orders above the 
-- average order value of the entire company.
SELECT 
    customer_name,
    email
FROM Customers
WHERE customer_id IN (
    SELECT customer_id 
    FROM Orders 
    WHERE total_amount > (SELECT AVG(total_amount) FROM Orders)
);