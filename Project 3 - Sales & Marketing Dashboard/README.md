# 📊 Sales & Marketing Performance Dashboard

## Interactive Power BI Dashboard for Sales & Marketing Performance

An interactive Power BI dashboard designed to monitor sales performance, marketing activity, key performance indicators, and campaign effectiveness.

The project combines business intelligence, data visualisation, and DAX-based analysis to provide a centralised view of commercial performance and help identify trends, opportunities, and areas requiring attention.

---

## 🎯 Project Objective

The objective of this project was to build an interactive reporting solution that enables stakeholders to monitor sales and marketing performance from a single dashboard.

The dashboard focuses on:
- Sales performance
- Marketing performance
- Key performance indicators
- Campaign effectiveness
- Performance trends
- Business-level reporting

Rather than relying on static reports, the dashboard allows users to interact with the data and investigate performance across different dimensions.

---

## 📌 Business Questions

The dashboard was designed to answer questions such as:

### Sales Performance
- How is sales performance changing over time?
- Which areas are contributing most to overall performance?
- Are there noticeable changes in sales trends?
- Which segments require further investigation?

### Marketing Performance
- How are marketing activities performing?
- Which campaigns are generating stronger results?
- Are marketing initiatives contributing effectively to business performance?
- Where are opportunities for optimisation?

### KPI Monitoring
- What are the key business performance indicators?
- How are KPIs changing over time?
- Which metrics require management attention?

---

## 📊 Executive Dashboard Architecture

The reporting system features two core interactive views:

### 1. Overview Page (`Sales and Marketing Intelligence`)
* **Core KPIs:** Total Revenue ($11.95M), Marketing Investment ($531.49K), Return on Ad Spend / ROAS ($22.49), Units Sold (53K).
* **Trend Analysis:** `Sales Trend` area chart alongside `Ad Spend Trend` line chart showing monthly movement.
* **Top Performing Products:** Bar chart highlighting lead revenue drivers, led by **Product 18** ($1.15M) and **Product 10** ($0.83M).
* **Sales by Platform:** Donut chart breakdown across retail channels: **Bed Bath & Beyond** ($2.68M), **Lowe's** ($2.52M), **Wayfair** ($2.32M), **Home Depot** ($2.23M), and **Costco** ($2.19M).

### 2. Deep Dive Page (`Marketing Efficiency Deep Dive`)
* **Monthly Efficiency Breakdown:** Table displaying `Total Revenue` ($11.95M cumulative), `Total Ad Spend` ($531.49K cumulative), `Total Sales Quantity` (52,986 units), and `Overall ROAS` heat-mapped across months (led by May at 37.63 ROAS).
* **Channel Distribution:** `Ad Spend Across Platforms` bar chart ranking channels: **Email** ($148K), **Facebook Ads** ($137K), **TikTok Ads** ($136K), and **Google Ads** ($111K).
* **Volume & Profit Metrics:** `Top Product Sale Quantity` tree map (led by Products 3, 12, 10, 11), **Total Profit** ($11.42M across all platforms), and **Revenue MoM Change** (14.43%).
* **Quadrant Analysis:** `Marketing Spend Efficiency by Product` scatter plot evaluating spend vs. return across product SKUs.

---

## 🛠️ Tools & Technologies

- **Microsoft Power BI**
- **DAX** (Custom measures for ROAS, MoM %, Profitability)
- **Power Query** (ETL pipeline)
- **Data Modelling** (Star schema relationship setup)
- **Data Visualisation** (Custom layout, custom icon sets, high-contrast palette)

---

## 🔄 Project Workflow

```text
Raw Business Data ──> Data Preparation ──> Power Query Transformation ──> Data Modelling ──> DAX Calculations ──> KPI Development ──> Dashboard Design ──> Performance Analysis ──> Business Insights
```
---

## 🔍 Key Data Findings & Business Insights

* 💰 **High Marketing Efficiency (ROAS):** Cumulative ad spend of **$531.49K** drove **$11.95M** in revenue, yielding an extraordinary overall **ROAS of 22.49** and generating **$11.42M in Net Profit**.
* 📈 **Seasonal ROAS Peaks:** Marketing efficiency peaked in **May (37.63 ROAS)** and **October (29.84 ROAS)**, while January recorded lower return rates (18.92 ROAS) despite high initial ad spend ($69.6K).
* 🛍️ **Balanced Channel Distribution:** Sales are evenly distributed across all five primary platforms, led by **Bed Bath & Beyond ($2.68M)** and **Lowe's ($2.52M)**.
* 🎯 **Channel Spend Efficiency:** **Email** received the highest total ad spend (**$148K**), closely followed by **Facebook Ads ($137K)** and **TikTok Ads ($136K)**, with **Google Ads** being the leanest channel ($111K).
* 📦 **Product Revenue Concentration:** **Product 18** is the leading revenue generator at **$1.15M**, followed by **Product 10 ($0.83M)**.

---

## 💡 Strategic Recommendations

- 🎯 **Reallocate Ad Budgets to High-ROAS Months:** Shift aggressive promotional ad budgets toward Q2 and early Q4 (May/October) where ROAS exceeds 29+, while optimizing campaigns in lower-performing months like January.
- 📢 **Scale Lean Channels:** Evaluate increasing budget allocation to Google Ads, which maintained competitive performance despite receiving the lowest total ad spend ($111K).
- 🔝 **Double Down on Top Performing SKUs:** Further optimize promotional campaigns for top revenue-generating SKUs (Product 18 and Product 10) to maintain market dominance across partner retail channels.

---

## 👩🏽‍💻 Author

**Gloria Austin**  
*Business Intelligence Analyst | Data Analyst*

**Core Competencies:**  
`Business Intelligence` | `Data Analytics` | `Power BI` | `DAX` | `SQL` | `PostgreSQL` | `Excel` | `KPI Development` | `Executive Reporting`
