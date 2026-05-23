# Healthcare Dataset — Exploratory SQL Analysis

Exploratory data analysis of a synthetic healthcare dataset (~55,500 patient records) using **SQLite**. This project demonstrates SQL skills relevant to clinical and product data analysis: aggregation, data quality auditing, date arithmetic, and translating raw records into business-relevant findings.

## Project Overview

The goal of this analysis was to explore patient-level healthcare data and surface insights around patient conditions, billing, and length of stay — while documenting the process in a clean, reproducible SQL script suitable for review.

The full analysis lives in [`01_exploratory_analysis.sql`](01_exploratory_analysis.sql), with inline comments capturing findings at each step.

## Dataset

- **Source:** Synthetic healthcare dataset (Kaggle)
- **Size:** ~55,500 patient records
- **Engine:** SQLite
- **Fields include:** patient demographics, medical condition, admission/discharge dates, billing amount, and more

## Analysis Performed

- **Dataset overview & previewing** — row counts and structure to understand the shape of the data
- **Unique value exploration** — distinct conditions, categories, and field values
- **Condition-level patient counts** — number of patients grouped by medical condition
- **Financial analysis** — average, minimum, maximum, and total billing amounts
- **Data quality audit** — identified records with negative billing amounts (a real-world data integrity issue)
- **Date format verification** — confirmed admission/discharge dates were valid for calculation
- **Length-of-stay analysis** — calculated stay duration using `JULIANDAY()` date math, including average length of stay per condition via `GROUP BY`

## Key Findings

> _Replace these with your actual results — even rough numbers make this section much stronger._

- The most common condition among patients was **[condition]**, accounting for **[N]** records.
- Average billing amount was **[$X]**, ranging from **[$min]** to **[$max]**.
- Data quality check flagged **[N]** records with negative billing amounts, indicating entry or processing errors that would need cleaning before downstream analysis.
- Average length of stay was **[N] days**, varying by condition — **[condition]** had the longest average stay.

## Skills Demonstrated

- Aggregation and grouping (`GROUP BY`, `COUNT`, `AVG`, `MIN`, `MAX`, `SUM`)
- Data quality auditing and validation
- Date arithmetic with `JULIANDAY()`
- Writing readable, well-documented SQL

## Tools

- **SQLite** — database engine
- **DBeaver** — SQL client

## How to Run

1. Load the dataset into a SQLite database (`healthcare.db`).
2. Open `01_exploratory_analysis.sql` in DBeaver (or any SQLite client).
3. Run the queries top to bottom — each section is commented to explain its purpose and findings.

---

*This project is part of a data analytics portfolio focused on healthcare-domain work.*
