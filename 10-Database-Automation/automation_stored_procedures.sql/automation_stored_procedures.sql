-- ************************************************************
-- REPOSITORY: SQL-Mastery-Journey
-- MODULE: 10 - Database Automation (Stored Procedures)
-- BRAND: Data With RISHAL
-- OBJECTIVE: Automating repetitive business logic.
-- ************************************************************

/* SCENARIO: 
   To prevent errors, we need a "Black Box" where a salesperson 
   can enter a Product ID and Quantity, and the system 
   automatically reduces stock and records the sale.
*/

DELIMITER //

CREATE PROCEDURE ProcessProductSale(
    IN p_product_id INT,
    IN p_quantity_sold INT
)
BEGIN
    -- 1. TRANSACTIONAL LOGIC: Update the stock
    UPDATE Products
    SET stock_quantity = stock_quantity - p_quantity_sold
    WHERE product_id = p_product_id;

    -- 2. LOGGING: We could add a record to a 'Sales' table here
    -- (Architecture Note: This ensures data consistency)
END //

DELIMITER ;

-- HOW TO CALL IT (Architect's Example):
-- CALL ProcessProductSale(101, 5);