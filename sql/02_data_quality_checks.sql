-- Data Quality Checks on Bronze Layer
-- Customer Lifetime Value Prediction Platform

USE CLV_Portfolio;
GO

-- 1. Duplicate customers
SELECT customer_id, COUNT(*) AS duplicate_count
FROM bronze_customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- 2. Null / blank checks
SELECT 
    SUM(CASE WHEN country IS NULL OR country = '' THEN 1 ELSE 0 END) AS bad_country,
    SUM(CASE WHEN subscription_tier IS NULL THEN 1 ELSE 0 END) AS null_tier,
    SUM(CASE WHEN preferred_category IS NULL THEN 1 ELSE 0 END) AS null_category
FROM bronze_customers;

-- 3. Invalid transaction amounts
SELECT COUNT(*) AS invalid_amounts
FROM bronze_transactions
WHERE amount <= 0;

-- 4. Future-dated transactions
SELECT COUNT(*) AS future_dated
FROM bronze_transactions
WHERE transaction_date > CAST(GETDATE() AS DATE);

-- 5. Invalid quantities
SELECT COUNT(*) AS bad_quantity 
FROM bronze_transactions 
WHERE quantity <= 0 OR quantity IS NULL;

-- 6. Invalid satisfaction scores
SELECT COUNT(*) AS bad_satisfaction 
FROM bronze_support_tickets 
WHERE satisfaction_score NOT BETWEEN 1 AND 5 OR satisfaction_score IS NULL;

-- 7. Negative resolution times
SELECT COUNT(*) AS negative_resolution 
FROM bronze_support_tickets 
WHERE resolution_time_hours < 0;
