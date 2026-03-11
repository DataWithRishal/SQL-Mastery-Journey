-- ==========================================================================
-- PROJECT: SQL Mastery Journey ( Data Architecture Roadmap)
-- MODULE: 01 - Foundational Data Retrieval & Quality Assurance
-- AUTHOR: Muhammed Rishal (Data With RISHAL)
-- DESCRIPTION: Beyond basic SELECTs. Implementing filters, data validation,
--              and professional formatting for downstream analytics.
-- ==========================================================================

/* SCENARIO A: DATA INTEGRITY CHECK
   Before analyzing customers, a Data Engineer must check for anomalies.
   Here we look for customers with missing critical contact information.
*/
SELECT 
    customerName, 
    city, 
    country 
FROM customers 
WHERE addressLine1 IS NULL 
   OR postalCode IS NULL;


/* SCENARIO B: HIGH-VALUE MARKET SEGMENTATION
   Extracting a clean list of unique cities in 'USA' or 'France' 
   where we have high-credit limit customers (> 100,000).
*/
SELECT DISTINCT 
    city, 
    state, 
    creditLimit 
FROM customers 
WHERE country IN ('USA', 'France') 
  AND creditLimit > 100000 
ORDER BY creditLimit DESC;


/* SCENARIO C: INVENTORY THRESHOLD ALERTS
   As a Data Architect, I build queries that can power automated alerts.
   This identifies product lines that are running dangerously low on stock.
*/
SELECT 
    productCode, 
    productName, 
    quantityInStock 
FROM products 
WHERE productLine = 'Classic Cars' 
  AND quantityInStock BETWEEN 0 AND 500 
ORDER BY quantityInStock ASC;


/* SCENARIO D: PERFORMANCE OPTIMIZATION (LIMITING DATA)
   When dealing with millions of rows, we never "SELECT *".
   We pull exactly what the dashboard needs.
*/
SELECT 
    orderNumber, 
    orderDate, 
    status 
FROM orders 
WHERE status != 'Shipped' 
  AND orderDate >= '2025-01-01'
LIMIT 20;

-- ==========================================================================
-- END OF MODULE 01: READY FOR ETL PIPELINE INTEGRATION
-- ==========================================================================