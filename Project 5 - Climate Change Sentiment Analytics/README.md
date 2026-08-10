# 🌍 Climate Change Public Opinion Analysis

## Turning 15.7M+ Climate Conversations into Actionable Insights

An end-to-end data analytics project analyzing public conversations around climate change using **15.7 million+ tweets collected between 2006 and 2019**.

The project combines **PostgreSQL, SQL analytics, data transformation, sentiment analysis, and Power BI** to investigate how climate-related conversations evolved over time, how sentiment varied across discussions, and what patterns could be identified from the available data.

---

## 📌 Project Overview

Climate change is both a scientific and public-policy issue, but public perception and engagement around it can change significantly over time.

This project explores climate-related Twitter conversations to answer questions such as:

- How did climate change conversations evolve over time?
- What was the overall sentiment of climate-related discussions?
- Which sentiment categories dominated the conversation?
- How did conversation volume change across years?
- What patterns can be identified from the available geographic and environmental data?
- What data quality limitations affect geographic and environmental analysis?

Rather than treating the dataset as a simple visualization exercise, the project uses a structured analytical workflow to move from **raw data → transformation → analysis → business-style reporting**.

---

## 🎯 Objectives

The analysis was designed to:

1. Understand long-term trends in climate-related conversations.
2. Categorize tweets based on sentiment.
3. Identify changes in conversation volume over time.
4. Examine the availability of geographic and environmental information.
5. Identify data-quality issues that could influence conclusions.
6. Build reusable analytical tables and views in PostgreSQL.
7. Translate analytical findings into an interactive Power BI dashboard.

---

## 🗂️ Dataset

**Dataset:** Climate Change Twitter Dataset

**Period:** 2006–2019

**Records:** 15.7M+

The dataset contains Twitter conversations related to climate change, including fields used for temporal, sentiment, geographic, and environmental analysis.

### Key analytical fields

- Tweet text
- Year / date information
- Sentiment score
- Geographic coordinates
- Temperature / environmental information
- Other tweet-level attributes

---

# 🏗️ Project Architecture

The project follows an end-to-end analytics workflow:

```text
Raw Twitter Dataset
        │
        ▼
PostgreSQL
        │
        ├── Data Cleaning
        │
        ├── Data Transformation
        │
        ├── Feature Engineering
        │
        ├── Sentiment Categorization
        │
        ├── Data Quality Analysis
        │
        └── Analytical Views
                │
                ▼
          Power BI
                │
                ├── KPI Reporting
                ├── Trend Analysis
                ├── Sentiment Analysis
                └── Interactive Visualization
```
---

## 🛠️ Tools & Technologies

| Tool | Purpose |
| :--- | :--- |
| **PostgreSQL** | Data storage, cleaning, transformation and analysis |
| **SQL** | Data preparation, feature engineering and analytical queries |
| **Power BI** | Interactive dashboards and reporting |
| **Power Query** | Data preparation for reporting |
| **DAX** | Measures, KPIs and time-based analysis |
| **GitHub** | Version control and project documentation |

---

## 🧹 Data Preparation

The raw dataset was loaded into PostgreSQL and prepared for analysis.

**The workflow included:**
- Data type validation
- Missing-value assessment
- Data cleaning
- Feature creation
- Sentiment categorisation
- Geographic data assessment
- Environmental-data assessment
- Creation of analytical tables and views
- Indexing of frequently queried fields

> A dedicated transformed dataset was created to separate analytical logic from the original raw data.

---

## 🧠 Sentiment Classification

Tweets were grouped into three sentiment categories using their sentiment scores:

* **Positive**: $\text{Sentiment Score} \ge 0.05$
* **Negative**: $\text{Sentiment Score} \le -0.05$
* **Neutral**: $-0.05 < \text{Sentiment Score} < 0.05$

This allowed the analysis to move beyond raw sentiment scores and produce interpretable categories for reporting.

---

## 🌍 Geographic & Environmental Data

One of the important findings from the data-quality assessment was the high level of missing geographic and environmental information. 

* **66.4%** of records lacked coordinates and/or temperature information.

Instead of treating missing geographic information as a minor technical issue, the project explicitly evaluates the limitation because incomplete location data can introduce bias when attempting to draw geographic conclusions from social-media data.

A derived field was created to identify records containing geographic information:
`is_geolocated`

This enabled comparison between records with and without available geographic information.

---

## 📊 Analytical Approach

The project uses both descriptive and diagnostic analytics.

### Descriptive Analytics
Focuses on:
- Conversation volume
- Yearly trends
- Sentiment distribution
- Sentiment trends over time
- Geographic data availability
- Environmental data availability

### Diagnostic Analytics
Explores:
- Changes in conversation patterns over time
- Sentiment shifts
- Data completeness
- Geographic coverage
- Potential limitations affecting interpretation

> The goal is not simply to report what happened, but to investigate the underlying patterns and limitations within the dataset.

---

## 📈 Power BI Dashboard

The Power BI component translates the SQL analysis into an interactive reporting layer.

**Dashboard areas include:**
- Total conversations
- Yearly conversation trends
- Sentiment distribution
- Sentiment trends
- Geographic data availability
- Environmental data availability
- Year-over-year changes

The dashboard is designed to allow users to explore the dataset interactively rather than relying only on static SQL outputs.

---

## 🔍 Key Data Findings

1. **Large-scale public conversation**
   * The dataset contains **15.7M+ records**, providing a substantial volume of social-media data for studying climate-related public discourse.

2. **Significant missing geographic/environmental information**
   * Approximately **66.4% of records** were missing coordinates and/or temperature information, limiting the reliability of geographic and environmental comparisons across the entire dataset.

3. **Multi-dimensional analysis**
   * Rather than analysing only conversation volume, the project incorporates sentiment classification to examine how the tone of climate-related conversations changes alongside conversation volume.

---

## ⚠️ Data Limitations

* 📍 **Missing geographic information:** A substantial proportion of records do not contain usable geographic or environmental information. Therefore, geographic findings should not be interpreted as representative of the entire dataset.
* 👥 **Social-media sampling bias:** Twitter users are not a perfect representation of the general population. The findings describe Twitter conversations, rather than public opinion across the entire population.
* 💬 **Sentiment classification:** Sentiment scores simplify complex human language into numerical categories. Sarcasm, context, ambiguity and domain-specific language may not always be captured accurately.
* 📅 **Dataset period:** The dataset covers 2006–2019, meaning the analysis does not represent climate-related conversations after 2019.
