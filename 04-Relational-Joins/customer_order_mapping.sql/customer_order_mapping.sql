-- ************************************************************
-- REPOSITORY: SQL-Mastery-Journey
-- MODULE: 04 - Joins & Relational Mapping
-- BRAND: Data With RISHAL
-- OBJECTIVE: Linking disparate tables to gain deeper insights.
-- ************************************************************

/* SCENARIO: 
   The Marketing team wants a list of all customers and their 
   order history. We need to combine the 'Customers' table 
   with the 'Orders' table using a common key.
*/

-- 1. INNER JOIN (The "Matching" Data)
-- Goal: Find all customers who have placed an order.
SELECT 
    c.customer_id,
    c.customer_name,
    o.order_date,
    o.total_amount
FROM Customers AS c
INNER JOIN Orders AS o ON c.customer_id = o.customer_id
ORDER BY o.total_amount DESC;

-- 2. LEFT JOIN (The "Full Coverage" View)
-- Goal: List ALL customers, even those who haven't ordered anything yet.
-- This helps identify potential customers for marketing emails.
SELECT 
    c.customer_name,
    c.email,
    o.order_id,
    COALESCE(o.total_amount, 0) AS spend_amount
FROM Customers AS c
LEFT JOIN Orders AS o ON c.customer_id = o.customer_id;

-- 3. COMPLEX MULTI-TABLE JOIN
-- Goal: Connect Customers -> Orders -> Products.
SELECT 
    c.customer_name,
    o.order_id,
    p.product_name,
    p.category
FROM Customers AS c
JOIN Orders AS o ON c.customer_id = o.customer_id
JOIN Order_Items AS oi ON o.order_id = oi.order_id
JOIN Products AS p ON oi.product_id = p.product_id;