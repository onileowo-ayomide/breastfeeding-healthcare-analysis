# breastfeeding-healthcare-analysis
Healthcare data cleaning, analysis and visualization of infant breastfeeding records using MySQL and Power BI.
# Breastfeeding & Infant Health Analysis

## 📌 Project Overview

This project analyzes infant healthcare and breastfeeding records to identify patterns in breastfeeding status, birth weight, maternal comorbidities, infant diagnoses, and healthcare department activity.

The project demonstrates an end-to-end healthcare data analytics workflow, from **SQL data cleaning and validation to exploratory analysis and interactive Power BI visualization**.

## 🎯 Project Objectives

The analysis was designed to:

* Examine the demographic distribution of registered infants.
* Analyze breastfeeding patterns across the dataset.
* Investigate birth-weight patterns using median birth weight.
* Identify the most frequently recorded infant diagnoses.
* Examine maternal comorbidities recorded among mothers.
* Explore healthcare patterns within specific departments.
* Build an interactive Power BI dashboard to support healthcare-focused insights.

## 🛠️ Tools & Technologies

* **MySQL** — Data cleaning, validation, transformation and analysis
* **Power BI** — Data visualization and interactive dashboard development
* **DAX** — Measures and calculated metrics
* **Power Query** — Data transformation and preparation
* **Excel** — Preliminary data inspection and validation

## 🧹 Data Cleaning & Preparation

The dataset required several data-quality checks before analysis.

The SQL workflow included:

* Identifying missing and blank values
* Investigating inconsistent date formats
* Detecting invalid dates
* Standardizing date fields
* Reviewing potentially erroneous birth-weight values
* Checking demographic inconsistencies
* Investigating duplicate and incomplete records
* Preparing variables for downstream analysis

The SQL cleaning and exploratory analysis scripts are available in the [`SQL`](SQL/) folder.

## 📊 Dashboard Overview

### All Departments

The unfiltered dashboard provides an overall view of infant records across departments.

Key dashboard observations include:

* The total registered infant card displays approximately **2K records**.
* **Male:** 1,379
* **Female:** 1,329
* **Unknown gender:** 38
* **Median birth weight:** 3.29 kg
* **Most frequently recorded diagnosis:** Dehydration — 504 cases
* **Top maternal comorbidity:** Hypertension — 440 cases

The diagnosis visual displays the top five diagnoses rather than the complete diagnosis distribution, so the displayed categories do not represent all diagnoses in the dataset.

![Breastfeeding Dashboard](Dashboard/Dashboard_breastfeeding_dashboard.png)

## 🚑 Department-Level Analysis: Emergency

The dashboard can also be filtered to examine individual departments.

For the **Emergency Department**:

* **Registered infants:** 422
* **Male:** 233
* **Female:** 220
* **Unknown gender:** 3
* **Median birth weight:** 3.31 kg
* **Most frequently recorded diagnosis:** Respiratory Infection — 59 cases

This demonstrates how interactive filtering can reveal patterns that may differ from the overall dataset.

![Emergency Department Analysis](Dashboard/Filtered_breastfeeding_analysis_dashboard.png)

## 🔎 Key Insights

### 1. Infant Demographics

The dashboard shows a relatively balanced distribution between male and female infant records, with a small number of records categorized as unknown gender.

### 2. Birth Weight

The overall median birth weight displayed on the dashboard is **3.29 kg**, while the Emergency Department has a slightly higher median of **3.31 kg**.

### 3. Infant Diagnoses

**Dehydration** is the most frequently displayed diagnosis in the overall dashboard, with **504 cases**.

However, the Emergency Department shows a different leading diagnosis: **Respiratory Infection**, with **59 cases**.

This highlights the value of department-level filtering when assessing healthcare utilization and disease patterns.

### 4. Maternal Comorbidities

**Hypertension** is the most frequently displayed individual maternal comorbidity, with **440 records**. A combined **Diabetes;Hypertension** category follows closely with **435 records**, while **Obesity** accounts for **433 records**.

These patterns suggest that maternal comorbidity data may provide useful context when examining infant healthcare outcomes.

## 💡 Healthcare Recommendations

Based on the patterns observed in the dashboard:

1. **Strengthen monitoring of dehydration cases** through early identification and appropriate infant feeding and hydration support.

2. **Investigate department-specific diagnosis patterns**, particularly respiratory infections in Emergency, to better understand differences in healthcare needs across departments.

3. **Monitor maternal hypertension and multiple comorbidities** as part of broader maternal-infant healthcare surveillance.

4. **Improve data quality and standardization** so that healthcare teams can confidently compare outcomes across departments and patient groups.

5. **Use interactive dashboards for routine monitoring** to allow healthcare stakeholders to identify emerging patterns and investigate specific departments or demographic groups.

## 📁 Project Structure

```text
breastfeeding-healthcare-analysis/
│
├── README.md
│
├── SQL/
│   ├── README.md
│   └── breastfeeding_data_cleaning_EDA.sql
│
├── PowerBI/
│   └── Breastfeeding_and_Infant_Health_Analysis.pbix
│
└── Dashboard/
    ├── breastfeeding_dashboard.png
    └── breastfeeding_dashboard_analysis.png
```

## 📈 Skills Demonstrated

This project demonstrates practical experience in:

* Healthcare data analysis
* Data cleaning
* Data quality assessment
* SQL querying
* Exploratory data analysis
* Power Query
* DAX
* Power BI dashboard development
* Healthcare KPI development
* Data storytelling
* Translating analytical findings into healthcare recommendations

## 👤 Author

**Ayomide David Onileowo**

Healthcare Data Analyst | SQL | Power BI | Excel | Python

Interested in using data analytics to improve healthcare decision-making, patient outcomes, and operational efficiency.
