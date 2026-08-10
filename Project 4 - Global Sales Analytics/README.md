# 🌍 Global Sales Performance Analytics

## End-to-End Sales Analysis & Business Intelligence Project

An interactive **Power BI** business intelligence solution analyzing global sales performance for **Northwind Traders** across July 2013 to July 2015. This project transforms transactional data into executive-level insights covering sales volume, seasonality, category concentration, pricing and discount dynamics, regional shipping costs, logistics performance, and account representative productivity.

---

## 🎯 Project Objective

The objective of this project is to convert complex sales and operations records into structured, decision-ready analytical dashboards to inform commercial strategies, pricing models, and logistics management.

The analysis evaluates key business questions:
- How is overall revenue and order volume performing over time?
- Which geographic markets and product categories drive core profitability?
- What impact do discounts have on product demand and overall margins?
- Where are shipping costs disproportionately high relative to revenue?
- How do logistics providers and individual sales representatives perform?

---

## 📌 Business Questions

The analysis was designed around five core pillars:

### 1. Sales Performance
- What is the overall revenue and order volume generated?
- How are sales changing across monthly and quarterly periods?
- What are the peak seasonal quarters?

### 2. Geographic Performance
- Which countries generate the highest sales volume?
- Are there geographic regions where shipping costs outweigh revenue contributions?

### 3. Product Performance
- Which product categories generate the highest revenue?
- How much revenue is tied to active vs. discontinued products?
- Does discounting effectively drive product sales volume?

### 4. Customer & Operations
- How many total active customers are being served?
- What is the average order value and shipping duration?
- Which shipping partners deliver the highest order throughput and efficiency?

### 5. Workforce Performance
- Which account representatives drive the highest sales revenue?
- How concentrated is revenue among top performers?

---

## 🛠️ Tools & Technologies

- **Microsoft Power BI** (Interactive visual reporting)
- **DAX** (Custom measures for revenue calculation, MoM %, and averages)
- **Power Query** (Data cleaning, type validation, and transformation)
- **Data Modelling** (Relational star schema setup connecting 7 core tables: Orders, Order Details, Products, Customers, Employees, Categories, and Shippers)

---

## 🔄 Project Workflow

```text
Raw Sales Data ──> Power Query Transformation ──> Data Modelling ──> DAX Calculations ──> KPI Development ──> Interactive Dashboard Design ──> Executive Insights & Recommendations
```
---

## 📊 Executive Dashboard Architecture

The reporting layer features three main interactive views[cite: 1]:  

### 1. Sales & Revenue Overview
- **Core KPIs:** Total Revenue ($1.27M), Year-over-Year Growth (+179.3%), Total Orders (830), Average Order Value ($1.53K), Average Freight Cost ($78.24)[cite: 1].
- **Monthly Revenue Trend:** Interactive multi-year trend line comparing 2013, 2014, and 2015 *(Note: 2015 data covers January to July only)*[cite: 1].
- **Top 10 Markets by Revenue:** Ranked bar chart led by USA ($0.25M) and Germany ($0.23M)[cite: 1].
- **Seasonal Revenue Patterns by Quarter:** Quarterly distribution showing strong seasonal demand peaks in Q1 and Q4, with Q2 dipping consistently[cite: 1].

### 2. Product & Category Intelligence
- **Category Revenue Breakdown:** Category contribution led by Beverages ($0.27M) and Dairy Products ($0.23M)[cite: 1].
- **Top 10 Products by Total Revenue:** Lead products featuring *Côte de Blaye* ($0.14M)[cite: 1].
- **Active vs Discontinued Portfolio:** Donut chart showing Active line dominance ($1.08M / 85.39%) vs. Discontinued items ($0.18M / 14.61%)[cite: 1].
- **Discount Dynamics:** Matrix table and scatter plot (`Discount Rate vs Revenue by Product`) showing category average discounts (5.62% overall, with Meat & Poultry highest) and proving that higher discounts do not reliably yield higher revenue[cite: 1].

### 3. Operations & People Performance
- **Shipping Cost Distribution:** Regional freight cost ranking showing Austria highest at 185, significantly higher than the USA at 113[cite: 1].
- **Operational KPIs:** Average Shipping Days (8 Days) and Total Customers (89)[cite: 1].
- **Logistics Partner Matrix:** Performance comparison ranking *United Package* (326 orders, $533.5K revenue, highest freight cost), *Federal Shipping* (255 orders, $383.4K revenue, fastest at 7 days average), and *Speedy Express* (249 orders, $348.8K revenue)[cite: 1].
- **Geographic Mapping & Sales Rankings:** World map visualization paired with employee revenue contribution rankings led by Margaret Peacock ($0.23M) down to Steven Buchanan ($0.07M)[cite: 1].

---

## 🔍 Key Data Findings & Business Insights

* 📈 **Revenue Growth & Contextual Interpretation:** Reported YoY growth stands at **179.3%**, but this metric requires careful interpretation because 2013 data starts in July and 2015 ends in July, meaning only 2014 represents a complete full year[cite: 1].
* 📦 **Discontinued Product Revenue Contribution:** Discontinued products unexpectedly still generate **14.61% of total revenue**, suggesting that previous product discontinuation decisions may not have been fully aligned with actual market demand[cite: 1].
* 🏷️ **Ineffective Discounting Impact:** Average discounts sit at **5.62%** (with Meat & Poultry having the highest), but scatter analysis proves that higher discounts do not consistently drive higher revenue, resulting in unnecessary margin erosion[cite: 1].
* 🚚 **Logistics Disparities:** **Austria** incurs an average freight cost of **185** (substantially higher than the USA at 113), prompting questions around whether regional revenue justifies the elevated shipping expenditure[cite: 1].

---

## 💡 Strategic Recommendations

- 🔄 **Review and Reintroduce High-Performing Discontinued Products:** The Product and Category team should conduct a quick audit of discontinued items contributing to the 14.61% revenue share to assess them for relisting or replacement, targeting increased category revenue within 60 to 90 days with zero additional acquisition cost[cite: 1].
- 🏷️ **Restructure Discount Strategy Across Categories:** The Growth and Commercial teams should replace blanket discounts—especially in high-discount categories like Meat & Poultry—with targeted, performance-based promotions to safeguard profit margins and align discount spend with actual revenue growth over 60 to 90 days[cite: 1].

---

## ⭐ Project Summary

| Category | Details |
| :--- | :--- |
| **Project** | Global Sales Performance Analytics[cite: 1] |
| **Company** | Northwind Traders[cite: 1] |
| **Tool** | Microsoft Power BI[cite: 1] |
| **Data Period** | July 2013 to July 2015[cite: 1] |
| **Core KPIs** | Revenue ($1.27M), Orders (830), Avg Order Value ($1.53K), Avg Freight Cost ($78.24)[cite: 1] |
| **Main Output** | Interactive 3-Page Executive Power BI Dashboard[cite: 1] |

---

## 👩🏽‍💻 Author

**Gloria Austin**[cite: 1]  
*Business Intelligence Analyst | Data Analyst*

**Core Competencies:**  
`Business Intelligence` | `Data Analytics` | `Power BI` | `DAX` | `SQL` | `PostgreSQL` | `Excel` | `KPI Development` | `Executive Reporting`
