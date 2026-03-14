-- ************************************************************
-- REPOSITORY: SQL-Mastery-Journey
-- MODULE: 03 - Data Aggregations & Grouping
-- BRAND: Data With RISHAL
-- OBJECTIVE: Converting raw transactional data into high-level 
--            Business Intelligence metrics.
-- ************************************************************

/* SCENARIO: 
   The CFO needs a summary of Q1 performance. We are aggregating 
   millions of rows to find total revenue, average spend, 
   and branch-wise performance.
*/

-- 1. GLOBAL SALES SUMMARY
-- Goal: Calculate the big-picture metrics for the entire organization.
SELECT 
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS gross_revenue,
    AVG(total_amount) AS average_order_value,
    MAX(total_amount) AS highest_single_sale
FROM Sales_Data;

-- 2. BRANCH-WISE PERFORMANCE (GROUP BY)
-- Goal: Rank branches by their total revenue to identify top performers.
SELECT 
    branch_name,
    COUNT(order_id) AS total_transactions,
    SUM(total_amount) AS regional_revenue
FROM Sales_Data
GROUP BY branch_name
ORDER BY regional_revenue DESC;

-- 3. HIGH-PERFORMANCE FILTERING (HAVING)
-- Goal: Identify categories that generated more than 1,00,000 in revenue.
-- Note: We use HAVING because we are filtering an aggregated result.
SELECT 
    product_category,
    SUM(total_amount) AS category_revenue
FROM Sales_Data
GROUP BY product_category
HAVING SUM(total_amount) > 100000
ORDER BY category_revenue DESC;