-- Bronze Layer: Raw Tables in MS SQL Server
-- Customer Lifetime Value Prediction Platform

CREATE DATABASE CLV_Portfolio;
GO

USE CLV_Portfolio;
GO

CREATE TABLE bronze_customers (
    customer_id         VARCHAR(20),
    signup_date         DATE,
    country             VARCHAR(50),
    preferred_category  VARCHAR(50),
    subscription_tier   VARCHAR(20),
    is_active           INT,
    acquisition_channel VARCHAR(30),
    customer_segment    VARCHAR(20)
);

CREATE TABLE bronze_transactions (
    transaction_id    VARCHAR(20),
    customer_id       VARCHAR(20),
    transaction_date  DATE,
    amount            DECIMAL(10,2),
    product_category  VARCHAR(50),
    quantity          INT,
    channel           VARCHAR(20)
);

CREATE TABLE bronze_support_tickets (
    ticket_id             VARCHAR(20),
    customer_id           VARCHAR(20),
    created_date          DATE,
    category              VARCHAR(30),
    priority              VARCHAR(20),
    resolution_time_hours DECIMAL(6,1),
    satisfaction_score    INT
);

PRINT 'Bronze tables created successfully';
