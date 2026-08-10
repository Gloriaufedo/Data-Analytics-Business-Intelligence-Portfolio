# 🌍 Global Sales Performance Analytics

## End-to-End Sales Analysis & Business Intelligence Project

An interactive Business Intelligence solution analyzing the global sales performance of **Northwind Traders** across 2013–2015. This project transforms raw transactional data into executive insights covering revenue trends, category concentration, product pricing dynamics, operational shipping costs, employee productivity, and geographic distribution.

---

## 🎯 Project Objective

The objective of this project is to convert complex sales records into structured analytical dashboards that support commercial strategy, operational optimization, and leadership decision-making.

The analysis evaluates key business questions:
- How is overall revenue and order volume performing over time?
- Which geographic markets and product categories drive core profitability?
- What impact do discounts have on product demand and overall margins?
- Where are shipping costs unproportionately high relative to market revenue?
- How do individual sales representatives contribute to total revenue?

---

## 📊 Executive Dashboard Architecture

The reporting layer is structured across three interactive views:

### 1. Overview Dashboard (`Sales & Revenue Overview`)
* **Core KPIs:** Total Revenue ($1.27M), Year-over-Year Growth (+179.3%), Total Orders (830), Average Order Value ($1.53K), Average Freight Cost ($78.24).
* **Monthly Revenue Trends:** Line chart evaluating monthly trajectories across 2013, 2014, and 2015 *(Note: 2015 data spans January to July)*.
* **Top 10 Markets by Revenue:** Horizontal bar chart highlighting lead revenue generators (USA, Germany, Austria, Brazil, France).
* **Seasonal Revenue Patterns by Quarter:** Quarterly distribution demonstrating seasonal demand spikes in Q1 and Q4.

### 2. Business Intelligence (`Product & Category Intelligence`)
* **Category Revenue Contribution:** Breakdown across core lines (Beverages at $0.27M, Dairy Products at $0.23M, Confections at $0.17M, Meat & Poultry at $0.16M, Seafood at $0.13M, Condiments, Produce, Grains & Cereals).
* **Top 10 Products:** Individual item lead table featuring *Côte de Blaye* ($0.14M), *Thüringer Rostbratwurst* ($0.08M), and *Raclette Courdavault* ($0.07M).
* **Active vs. Discontinued Product Mix:** Donut chart showing active line dominance ($1.08M / 85.39%) vs. discontinued offerings ($0.18M / 14.61%).
* **Discount Dynamics:** Matrix table and scatter plot (`Discount Rate vs. Revenue by Product`) proving that higher discounts do not reliably drive higher revenue volumes.

### 3. Overall Performance (`Operations & People Performance`)
* **Shipping Cost Distribution:** Regional cost ranking showing high freight expenditure in Austria (185), USA (113), and Germany (92).
* **Operational Metrics:** Average Shipping Duration (8 Days) and Total Active Customer Count (89).
* **Shipper Efficiency Matrix:** Performance table ranking logistics partners (*United Package*, *Federal Shipping*, *Speedy Express*) by average delivery speed, freight costs, order throughput, and revenue generated.
* **Geographic Mapping & Salesperson Rankings:** Regional map paired with employee revenue contribution rankings led by Margaret Peacock ($232.89K), Janet Leverling ($202.81K), and Nancy Davolio ($192.11K).

---

## 🗂️ Project Workflow

```text
Raw Sales Data ──> Data Cleaning & Validation ──> Analytical Modelling (Star Schema) ──> KPI & DAX Development ──> Interactive Dashboard Design ──> Executive Insights & Recommendations
```
---

## 🔍 Key Data Findings & Business Insights

### Revenue Concentration & High-Performing Markets
- **Total cumulative revenue** reached **$1.27M** across **830 orders**, with **USA ($0.25M)** and **Germany ($0.23M)** serving as the top two global markets.
- Demand exhibits strong seasonality, with revenue peaking heavily in **Q1 ($0.30M in 2015)** and **Q4**.

### Category Dominance & Ineffective Discounting
- Revenue is heavily concentrated in **Beverages ($267.8K)** and **Dairy Products ($234.5K)**, which together generate over 39% of total sales.
- The top single product, **Côte de Blaye**, accounts for **$140K** in total sales.
- Across all categories, average discounts range between **4.53% and 6.45%**. However, scatter analysis confirms that higher discount rates fail to produce proportional increases in product sales revenue.

### Logistics & Freight Cost Disparities
- Freight costs do not always align with market revenue. For instance, **Austria** incurs the highest shipping cost volume (185) despite being the third-largest revenue market.
- **United Package** handled the highest order volume (326 orders, $533.5K revenue) with an average delivery duration of 9 days.

### Salesforce Contribution
- Sales performance is driven primarily by the top three account representatives: **Margaret Peacock ($232.89K)**, **Janet Leverling ($202.81K)**, and **Nancy Davolio ($192.11K)**, who collectively generate over 49% of total company revenue.

---

## 💡 Strategic Recommendations

- 🏷️ **Re-evaluate Discounting Strategies:** Limit automatic percentage discounts on high-demand categories (Beverages & Dairy), as discounting is currently eroding margins without significantly expanding volume.
- 📦 **Optimize Logistics in High-Freight Regions:** Renegotiate freight contracts or establish regional fulfillment hubs in central European locations like Austria to reduce elevated shipping costs.
- 🗑️ **Product Portfolio Rationalization:** Phase out or replace low-performing discontinued items (currently representing 14.61% of total revenue) to lower holding costs and streamline inventory.

---

## 👩🏽‍💻 Author

**Gloria Austin**  
*Business Intelligence Analyst | Data Analyst*

**Core Competencies:**  
`Business Intelligence` | `Data Analytics` | `Power BI` | `DAX` | `SQL` | `PostgreSQL` | `Excel` | `KPI Development` | `Executive Reporting`
