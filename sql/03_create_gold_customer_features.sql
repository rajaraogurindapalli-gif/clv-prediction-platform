-- Gold Layer: Customer Feature Table
-- Customer Lifetime Value Prediction Platform
-- Supports all 5 business questions

USE CLV_Portfolio;
GO

CREATE TABLE gold_customer_features (
    customer_id            VARCHAR(20) PRIMARY KEY,
    -- Continuous variables
    total_spend            DECIMAL(12,2),
    avg_order_value        DECIMAL(10,2),
    avg_resolution_hours   DECIMAL(8,1),
    -- Discrete variables
    order_count            INT,
    ticket_count           INT,
    -- Nominal / Ordinal variables
    country                VARCHAR(50),
    preferred_category     VARCHAR(50),
    subscription_tier      VARCHAR(20),
    customer_segment       VARCHAR(20),
    -- Derived features
    days_since_signup      INT,
    days_since_last_order  INT
);

INSERT INTO gold_customer_features
SELECT 
    c.customer_id,
    COALESCE(t.total_spend, 0) AS total_spend,
    COALESCE(t.avg_order_value, 0) AS avg_order_value,
    COALESCE(s.avg_resolution_hours, 0) AS avg_resolution_hours,
    COALESCE(t.order_count, 0) AS order_count,
    COALESCE(s.ticket_count, 0) AS ticket_count,
    c.country,
    c.preferred_category,
    c.subscription_tier,
    c.customer_segment,
    DATEDIFF(DAY, c.signup_date, GETDATE()) AS days_since_signup,
    DATEDIFF(DAY, t.last_order_date, GETDATE()) AS days_since_last_order
FROM silver_customers c
LEFT JOIN (
    SELECT 
        customer_id,
        SUM(amount) AS total_spend,
        AVG(amount) AS avg_order_value,
        COUNT(*) AS order_count,
        MAX(transaction_date) AS last_order_date
    FROM silver_transactions
    GROUP BY customer_id
) t ON c.customer_id = t.customer_id
LEFT JOIN (
    SELECT 
        customer_id,
        COUNT(*) AS ticket_count,
        AVG(resolution_time_hours) AS avg_resolution_hours
    FROM silver_support_tickets
    GROUP BY customer_id
) s ON c.customer_id = s.customer_id;

-- Verification
SELECT COUNT(*) AS GoldCustomerCount FROM gold_customer_features;
SELECT TOP 10 * FROM gold_customer_features;
