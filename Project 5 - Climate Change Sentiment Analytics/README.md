# Climate Change Sentiment Intelligence

### End-to-End SQL & Power BI Analysis of 15.7 Million Climate Conversations

An end-to-end analytics project examining how public sentiment, climate stance, and aggressive behaviour shifted across more than **15.7 million climate-related Twitter conversations between 2006 and 2019**.

The project was built using **PostgreSQL and Microsoft Power BI**, with PostgreSQL handling the complete data preparation, transformation, analytical modelling, and aggregation before the final insights were delivered through an interactive Power BI dashboard.

---

## Project Overview

Public conversations around climate change can shift significantly over time, particularly around political events, scientific debates, and changes in public awareness.

This project analyses more than **15.7 million tweets** to understand:

- How public sentiment changed over time
- How climate stance shifted across the dataset
- Which topics generated the most aggressive discussions
- Whether deniers and believers behaved differently
- How gender relates to climate stance
- How aggressiveness changed over time
- Whether temperature deviation was associated with sentiment
- Where geographic patterns could be observed from available location data

The analysis was designed to support a hypothetical climate research organisation preparing a policy briefing.

---

## Key Results

| Metric | Result |
|---|---:|
| Total Tweets | **15,789,411** |
| Date Range | **2006–2019** |
| Average Sentiment | **-0.07** |
| Aggressive Posts | **38.26%** |
| Believers | **71.52%** |
| Deniers | **7.55%** |
| Neutral | **20.93%** |
| Geolocated Records | **33.6%** |
| Polarisation Index | **0.64** |

### Key findings

**1. Sentiment became more negative over time**

Overall sentiment was slightly negative, with an average score of **-0.07**. Sentiment remained close to neutral during the earlier years before becoming more negative after 2013.

**2. Believers dominate the conversation**

Believers represented approximately **71.5%** of all conversations, while deniers accounted for approximately **7.6%**.

**3. Deniers were more aggressive by rate**

Although believers generated substantially more content because of their larger population, deniers showed a considerably higher aggressiveness rate.

The analysis therefore compares **aggressiveness rates rather than raw counts** when evaluating behaviour between stance groups.

**4. Politics drives hostile conversations**

Political topics showed the highest levels of aggressiveness.

The leading topics included:

1. Politics
2. Donald Trump versus Science
3. Undefined / One Word Hashtags
4. Impact of Resource Overconsumption
5. Ideological Positions on Global Warming

**5. Aggressiveness declined substantially over time**

Aggressiveness fell from approximately **80% in the early years to around 25% by 2019**.

**6. Geographic analysis is exploratory**

Only approximately **33.6% of records contained geographic information**.

As a result, geographic and temperature-related findings were treated as exploratory rather than representative of the entire dataset.

---

# Business Questions

The analysis was structured around several questions:

### Sentiment
- How has public sentiment toward climate change changed over time?
- Which years experienced the most negative sentiment?

### Stance
- What proportion of conversations come from believers, deniers, and neutral users?
- How has the distribution of climate stance changed over time?

### Behaviour
- Which stance group is more aggressive?
- Which topics generate the most aggressive discussions?
- Has aggressiveness increased or decreased over time?

### Demographics
- Does climate stance differ by gender?

### Geography
- Where are climate-related conversations concentrated?
- Is temperature deviation associated with sentiment?

---

# Dataset

**Dataset:** Climate Change Twitter Dataset

**Source:** Mendeley Data

The dataset contains more than **15.7 million tweet records** and includes information such as:

- Tweet timestamp
- Tweet ID
- Geographic coordinates
- Topic
- Sentiment score
- Climate stance
- Gender
- Temperature deviation
- Aggressiveness

### Important Data Quality Finding

The original project brief stated a different date range from the data actually provided.

Profiling confirmed that the available dataset spans:

**2006–2019**

rather than the range stated in the brief.

The 2006 records contained only **12 tweets** and were therefore flagged as pre-analysis outliers and excluded from key trend analysis.

---

# Data Quality Assessment

Before cleaning, the raw dataset was profiled to understand its structure and identify potential issues.

| Data Quality Check | Finding |
|---|---|
| Total Records | 15,789,411 |
| Duplicate Tweet IDs | None |
| Missing Coordinates & Temperature | 10,481,873 |
| Missing Sentiment / Stance / Gender / Aggressiveness | None |
| Distinct Topics | 10 |
| Distinct Stances | 3 |
| Distinct Gender Values | 3 |
| Aggressiveness Values | 2 |
| Sentiment Range | -0.9942 to +0.9917 |

Approximately **66.4% of records lacked geographic coordinates and temperature data**.

Instead of deleting these records, they were retained and flagged so that the full dataset could still be used for sentiment, stance, and behavioural analysis.

---

# Data Cleaning

The cleaning strategy prioritised **data preservation and traceability**.

Rather than removing problematic records, data quality flags were introduced to allow different analyses to apply appropriate filters.

### Cleaning steps included:

- Standardising stance values
- Standardising gender values
- Standardising aggressiveness labels
- Correcting the topic typo:
  `Importance of Human Intervantion`
  → `Importance of Human Intervention`
- Flagging missing geographic information
- Flagging pre-2007 records
- Validating sentiment ranges
- Checking for duplicate tweet IDs

### Data Quality Flags

A `dq_flag` field was created to document identified issues.

An `is_geolocated` flag was also created to allow geographic analysis to use only records with valid latitude and longitude information.

---

# SQL Data Transformation

A dedicated `transformed_tweets` table was created to prepare the dataset for analysis.

Several analytical fields were derived from the raw data.

| Derived Field | Purpose |
|---|---|
| `year` | Year-level analysis |
| `month` | Monthly analysis |
| `quarter` | Quarterly aggregation |
| `year_month` | Monthly Power BI trends |
| `sentiment_label` | Positive / Neutral / Negative grouping |
| `is_aggressive` | Binary aggregation flag |
| `is_geolocated` | Geographic analysis filter |
| `dq_flag` | Data quality tracking |

### Sentiment Classification

Sentiment scores were converted into readable categories:

```text
Positive  >= 0.05
Negative  <= -0.05
Neutral   between -0.05 and +0.05
```
---

## 🛠️ PostgreSQL Analytical Views

| View Name | Primary Analytics Purpose |
| :--- | :--- |
| `vw_yearly_trends` | Yearly sentiment and stance analysis |
| `vw_topic_summary` | Topic-level performance and ranking |
| `vw_monthly_trends` | Monthly conversation volume and sentiment trends |
| `vw_gender_stance` | Gender breakdown and stance interaction |
| `vw_geo_tweets` | Geographic and location-based distribution |
| `vw_stance_aggressiveness` | Stance-level behavioral and aggression analysis |
| `vw_kpi_summary` | Dashboard-level top-line KPI metrics |
| `vw_sentiment_trend` | Sentiment category distribution across time |
| `vw_temperature_sentiment` | Correlation between local temperature shifts and sentiment |

*Indexes were applied to high-cardinality and frequently queried columns: `year`, `topic`, `stance`, `is_geolocated`, and `year_month`.*

---

## 🔄 Project Workflow

```text
Raw Twitter Data ──> Data Profiling & Quality Assessment ──> PostgreSQL Cleaning & Transformation ──> Indexed Analytical Tables & Views ──> Descriptive Analytics ──> Diagnostic Analytics ──> Power BI Dashboard Development ──> Business Insights & Recommendations
```
---

## 📊 Executive Dashboard Architecture

The Power BI solution consists of a four-page interactive layout:

- **Page 1: Overview:** Executive snapshot covering total conversation volume, average sentiment, stance distribution, and macro behavioral trends.
- **Page 2: Topics & Stance:** Detailed view of topic volumes (~4.5M Global Stance, ~2.6M Human Intervention), category rankings, and topic-level aggressiveness.
- **Page 3: Behavior & Dynamics:** Diagnostic analysis of stance aggressiveness over time, Polarisation Index calculations, and gender stance dynamics.
- **Page 4: Geographic Analysis:** Exploration of spatial tweet distribution, local temperature deviations, and regional sentiment profiles.

---

## 🔍 Key Analytical Findings & Insights

### 1. Descriptive Analytics
- **Overall Sentiment:** Slightly negative with an overall average score of **-0.07**. Negative posts represent the largest sentiment group across most evaluated years.
- **Stance Breakdown:** The conversation is overwhelmingly driven by **Believers (71.52%)**, followed by **Neutral (20.93%)**, and **Deniers (7.55%)**.
- **Core Topics:** Top categories by volume are **Global Stance (~4.5M)**, **Importance of Human Intervention (~2.6M)**, **Weather Extremes (~2.3M)**, and **Politics (~1.8M)**.

### 2. Diagnostic & Behavioral Analytics
- **Sentiment Movement:** Sentiment shifted significantly negative after **2013**, coinciding with periods of substantially elevated global conversation volume.
- **Topic Hostility:** Political discussions recorded the highest levels of aggression (led by *Politics*, *Donald Trump vs. Science*, and *Ideological Positions on Global Warming*). Hostility is far more correlated with ideology than pure science.
- **Aggressiveness Trend Shift:** Overall conversation aggressiveness dropped drastically from **~80% down to ~25%** between the earliest dataset years and 2019.
- **Polarisation Index (0.64):**
  $$\text{Polarisation Index} = \frac{\text{Denier Aggressiveness Rate}}{\text{Denier Aggressiveness Rate} + \text{Believer Aggressiveness Rate}}$$
  *A value of **0.64** (> 0.50) proves that Denier discourse contributes disproportionately to hostile engagement relative to overall volume.*

---

## 💡 Strategic Recommendations

- 🎯 **Target Political Communication Spaces:** Develop specialized messaging and moderation strategies for politically charged topic channels, as they exhibit the highest baseline hostility.
- 📣 **Amplify Key Demographics:** Leverage high believer rates observed among female users to construct targeted engagement programs and community-led public messaging.
- 📉 **Track Relative Aggression Rates:** Standardize hostility tracking using relative rates ($\frac{\text{Aggressive Tweets}}{\text{Total Stance Volume}}$) rather than raw counts to prevent volume bias between unequally sized groups.
- 📍 **Enhance Geospatial Data Collection:** Implement improved geolocation enrichment pipelines to resolve the ~66% location data gap and refine regional temperature-deviation analysis.

---

## 📂 Repository Structure

```text
Climate-Change-Sentiment-Analytics/
│
├── README.md
│
├── SQL/
│   ├── data_cleaning.sql
│   ├── data_transformation.sql
│   ├── analytical_views.sql
│   └── analysis.sql
│
├── PowerBI/
│   └── climate_change_sentiment.pbix
│
├── Documentation/
│   └── Climate_Change_Sentiment_Intelligence_Report.pdf
│
└── Images/
    ├── dashboard-overview.png
    ├── topics-stance.png
    ├── behaviour.png
    └── geography.png
```
---

## 🛠️ Tools & Technologies

- **PostgreSQL / SQL:** Large-scale ETL, data profiling, indexing, data quality filtering, analytical view engineering.
- **Microsoft Power BI:** Advanced visual reporting, interactive cross-filtering, executive KPI layouts, regional mapping.
- **DAX:** Custom time-intelligence measures, dynamic group rates, and interactive index calculations.
- **Dataset Reference:** Climate Change Twitter Dataset (Mendeley Data, `mw8yd7z9wc/2`).

---

## 👩🏽‍💻 Author

**Gloria Austin**  
*Business Intelligence Analyst | Data Analyst | Reporting Analyst*  

**Core Competencies:**  
`Business Intelligence` | `Data Analytics` | `Power BI` | `DAX` | `SQL` | `PostgreSQL` | `Data Engineering` | `KPI Development` | `Executive Reporting`
