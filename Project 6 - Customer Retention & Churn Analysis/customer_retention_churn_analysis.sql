/* =========================================================
   PROJECT: Customer Retention & Churn Analysis
   AUTHOR: Gloria Austin Ufedo
   TOOLS: Excel, MySQL, Power BI

   PROJECT OVERVIEW:
   This project analyzes customer purchase behavior, retention,
   churn risk, and revenue contribution using transactional
   retail data.

   WORKFLOW:
   1. Clean raw transactional data in Excel
   2. Import cleaned CSV into MySQL
   3. Transform line-level data into order-level data
   4. Build customer-level summary metrics
   5. Classify customers as one-time or repeat
   6. Estimate churn using a 90-day inactivity proxy
   7. Create dashboard-ready views for Power BI

   NOTE:
   The raw dataset was cleaned in Excel before import.
   This SQL script focuses on transformation, analysis,
   and dashboard-ready outputs.
========================================================= */


/* =========================================================
   1. CREATE DATABASE & BASE TABLE
========================================================= */

CREATE DATABASE IF NOT EXISTS customer_retention_project;
USE customer_retention_project;

DROP TABLE IF EXISTS clean_orders;

CREATE TABLE clean_orders (
    order_id VARCHAR(20),
    customer_id INT,
    order_date DATE,
    quantity INT,
    unit_price DECIMAL(10,2),
    sales DECIMAL(12,2),
    country VARCHAR(100)
);


/* =========================================================
   2. OPTIONAL DATA QUALITY CHECKS
   (Run after CSV import into clean_orders)
========================================================= */

-- Total imported rows
SELECT COUNT(*) AS total_rows
FROM clean_orders;

-- Transaction date range
SELECT 
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date
FROM clean_orders;

-- Distinct customers
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM clean_orders;

-- Missing customer IDs
SELECT COUNT(*) AS null_customer_ids
FROM clean_orders
WHERE customer_id IS NULL;


/* =========================================================
   3. CREATE ORDER-LEVEL TABLE
   Aggregate line-level transactions into order-level revenue
========================================================= */

DROP TABLE IF EXISTS order_level_orders;

CREATE TABLE order_level_orders AS
SELECT
    order_id,
    customer_id,
    order_date,
    country,
    ROUND(SUM(sales), 2) AS order_value
FROM clean_orders
WHERE customer_id IS NOT NULL
GROUP BY order_id, customer_id, order_date, country;


/* =========================================================
   4. CREATE CUSTOMER-LEVEL SUMMARY TABLE
   Summarize purchase behavior per customer
========================================================= */

DROP TABLE IF EXISTS customer_order_summary;

CREATE TABLE customer_order_summary AS
SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS total_orders,
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    ROUND(SUM(order_value), 2) AS total_revenue,
    ROUND(AVG(order_value), 2) AS avg_order_value
FROM order_level_orders
GROUP BY customer_id;


/* =========================================================
   5. CREATE CUSTOMER CHURN STATUS TABLE
   Churn is defined using a 90-day inactivity rule:
   If the number of days between the customer's last order
   and the dataset's latest order date is > 90, the customer
   is classified as Churned; otherwise Active.
========================================================= */

DROP TABLE IF EXISTS customer_churn_status;

CREATE TABLE customer_churn_status AS
SELECT
    customer_id,
    total_orders,
    first_order_date,
    last_order_date,
    total_revenue,
    CASE
        WHEN DATEDIFF(
            (SELECT MAX(order_date) FROM order_level_orders),
            last_order_date
        ) > 90 THEN 'Churned'
        ELSE 'Active'
    END AS churn_status
FROM customer_order_summary;


/* =========================================================
   6. CORE ANALYTICAL KPI QUERIES
   These are useful for validation and portfolio storytelling
========================================================= */

-- Total customers
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM customer_order_summary;

-- Total orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM order_level_orders;

-- Total revenue
SELECT ROUND(SUM(order_value), 2) AS total_revenue
FROM order_level_orders;

-- Average order value
SELECT ROUND(AVG(order_value), 2) AS average_order_value
FROM order_level_orders;

-- Average orders per customer
SELECT 
    ROUND(COUNT(DISTINCT order_id) * 1.0 / COUNT(DISTINCT customer_id), 2) AS avg_orders_per_customer
FROM order_level_orders;

-- Repeat purchase rate
SELECT 
    ROUND(
        SUM(CASE WHEN total_orders > 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS repeat_purchase_rate_pct
FROM customer_order_summary;

-- One-time customer rate
SELECT 
    ROUND(
        SUM(CASE WHEN total_orders = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS one_time_customer_rate_pct
FROM customer_order_summary;

-- Retention rate
SELECT
    ROUND(
        SUM(CASE WHEN churn_status = 'Active' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS retention_rate_pct
FROM customer_churn_status;

-- Churn rate
SELECT
    ROUND(
        SUM(CASE WHEN churn_status = 'Churned' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_pct
FROM customer_churn_status;


/* =========================================================
   7. DASHBOARD-READY VIEWS FOR POWER BI
========================================================= */

-- KPI summary view (best for KPI cards)
DROP VIEW IF EXISTS vw_kpi_summary;

CREATE VIEW vw_kpi_summary AS
SELECT
    (SELECT COUNT(DISTINCT customer_id) FROM customer_order_summary) AS total_customers,
    (SELECT COUNT(DISTINCT order_id) FROM order_level_orders) AS total_orders,
    (SELECT ROUND(SUM(order_value), 2) FROM order_level_orders) AS total_revenue,
    (SELECT ROUND(AVG(order_value), 2) FROM order_level_orders) AS average_order_value,
    (
        SELECT ROUND(
            SUM(CASE WHEN total_orders > 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
        )
        FROM customer_order_summary
    ) AS repeat_purchase_rate_pct,
    (
        SELECT ROUND(
            SUM(CASE WHEN churn_status = 'Active' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
        )
        FROM customer_churn_status
    ) AS retention_rate_pct,
    (
        SELECT ROUND(
            SUM(CASE WHEN churn_status = 'Churned' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
        )
        FROM customer_churn_status
    ) AS churn_rate_pct;


-- Revenue contribution by customer type
DROP VIEW IF EXISTS vw_customer_type_revenue;

CREATE VIEW vw_customer_type_revenue AS
SELECT
    CASE
        WHEN total_orders = 1 THEN 'One-Time Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(*) AS customer_count,
    ROUND(SUM(total_revenue), 2) AS total_revenue,
    ROUND(AVG(total_revenue), 2) AS avg_customer_revenue
FROM customer_order_summary
GROUP BY customer_type;


-- Churn status summary
DROP VIEW IF EXISTS vw_churn_status_summary;

CREATE VIEW vw_churn_status_summary AS
SELECT
    churn_status,
    COUNT(*) AS customer_count
FROM customer_churn_status
GROUP BY churn_status;


-- Monthly customer activity trend
DROP VIEW IF EXISTS vw_monthly_customer_activity;

CREATE VIEW vw_monthly_customer_activity AS
SELECT
    DATE_FORMAT(order_date, '%Y-%m-01') AS order_month,
    COUNT(DISTINCT customer_id) AS active_customers,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(order_value), 2) AS total_revenue
FROM order_level_orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m-01')
ORDER BY order_month;


-- Purchase frequency segmentation
DROP VIEW IF EXISTS vw_purchase_frequency_segments;

CREATE VIEW vw_purchase_frequency_segments AS
SELECT
    CASE
        WHEN total_orders = 1 THEN '1 Order'
        WHEN total_orders BETWEEN 2 AND 3 THEN '2-3 Orders'
        WHEN total_orders BETWEEN 4 AND 5 THEN '4-5 Orders'
        ELSE '6+ Orders'
    END AS order_frequency_segment,
    COUNT(*) AS customer_count,
    ROUND(AVG(total_revenue), 2) AS avg_customer_revenue,
    ROUND(SUM(total_revenue), 2) AS total_segment_revenue
FROM customer_order_summary
GROUP BY order_frequency_segment;


/* =========================================================
   8. OPTIONAL VALIDATION QUERIES FOR FINAL CHECK
========================================================= */

-- Preview dashboard KPI summary
SELECT * FROM vw_kpi_summary;

-- Preview customer type revenue split
SELECT * FROM vw_customer_type_revenue;

-- Preview churn summary
SELECT * FROM vw_churn_status_summary;

-- Preview monthly trend
SELECT * FROM vw_monthly_customer_activity;

-- Preview purchase frequency segments
SELECT * FROM vw_purchase_frequency_segments;