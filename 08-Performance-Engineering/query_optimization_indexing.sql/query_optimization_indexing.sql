-- ************************************************************
-- REPOSITORY: SQL-Mastery-Journey
-- MODULE: 08 - Performance Engineering (Indexing & Views)
-- BRAND: Data With RISHAL
-- OBJECTIVE: Optimizing search speed and abstracting complexity.
-- ************************************************************

/* SCENARIO: 
   A high-traffic application is experiencing lag during search. 
   As the Data Architect, you must implement B-Tree indexing to 
   optimize lookups and create a Secure View to hide complex 
   logic from the application layer.
*/

-- 1. B-TREE INDEXING (Search Optimization)
-- Creating a unique index to ensure the hardware can find users instantly.
CREATE INDEX idx_user_email ON System_Users(email);

-- 2. COMPOSITE INDEXING (Multi-Column Optimization)
-- Used when the business frequently filters by both Category and Price.
CREATE INDEX idx_prod_cat_price ON Products(category, price);

-- 3. ARCHITECTURAL ABSTRACTION (DATABASE VIEWS)
-- We create a "Virtual Table" so the UI team doesn't have to write 
-- 10-line Joins. They just select from this View.
CREATE VIEW v_active_customer_metrics AS
SELECT 
    c.customer_name,
    c.email,
    SUM(o.total_amount) AS total_revenue,
    MAX(o.order_date) AS last_purchase
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_name, c.email;