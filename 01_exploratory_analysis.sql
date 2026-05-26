/*
==========================================
HEALTHCARE DATA ANALYSIS — EXPLORATORY QUERIES
Dataset: Synthetic patient records (~55,500 patients)
Source: Kaggle (Prasad22/healthcare-dataset)
Author: [Your Name]
Date: April 2026
==========================================

NOTE ON THE DATASET:
This is synthetic (simulated) data with only 6 medical conditions
and an even patient distribution across them. Real-world hospital
data would show much more variation. This dataset is suited for
SQL practice, not real epidemiological inference.
*/


-- ==============================================
-- 1. DATASET OVERVIEW
-- ==============================================

-- How many patient records are in the database?
SELECT COUNT(*) AS total_patients 
FROM patients;
-- Result: 55,500 patients


-- Preview the first 5 rows to understand the column structure
SELECT * 
FROM patients 
LIMIT 5;
-- Note: 'Name' column has inconsistent capitalization (data quality issue)


-- ==============================================
-- 2. MEDICAL CONDITIONS BREAKDOWN
-- ==============================================

-- How many unique medical conditions exist in the dataset?
SELECT COUNT(DISTINCT "Medical Condition") AS unique_conditions 
FROM patients;
-- Result: 6 conditions (small number suggests synthetic data)


-- List the actual conditions
SELECT DISTINCT "Medical Condition" 
FROM patients;
-- Result: Cancer, Obesity, Diabetes, Asthma, Hypertension, Arthritis


-- How many patients have each condition? Ranked from most to least common.
SELECT 
    "Medical Condition",
    COUNT(*) AS patient_count
FROM patients
GROUP BY "Medical Condition"
ORDER BY patient_count DESC;
/*
Results:
  Arthritis    9,308
  Diabetes     9,304
  Hypertension 9,245
  Obesity      9,231
  Cancer       9,227
  Asthma       9,185
  
Observation: Distribution is nearly even (range: 9,185 - 9,308).
This confirms the dataset is synthetic and deliberately balanced.
*/
-- Average length of stay per medical condition
SELECT
    "Medical Condition",
    ROUND(AVG(JULIANDAY("Discharge Date") - JULIANDAY("Date of Admission")), 2) AS avg_length_of_stay_days,
    COUNT(*) AS patient_count
FROM patients
GROUP BY "Medical Condition"
ORDER BY avg_length_of_stay_days DESC;
SELECT *
FROM patients
LIMIT 5;
SELECT
    ROUND(AVG("Billing Amount"), 2) AS avg_billing,
    ROUND(MIN("Billing Amount"), 2) AS min_billing,
    ROUND(MAX("Billing Amount"), 2) AS max_billing,
    ROUND(SUM("Billing Amount"), 2) AS total_billing
FROM patients;
/*
Results:
  Average billing: 25,539.32
  Minimum billing: -2,008.49
  Maximum billing: 52,764.28
  Total billing:   1,417,432,043.40

Observation: The minimum is negative, which is impossible for a real bill.
This signals data-quality issues — investigated in the next query.
*/
-- ==============================================
-- 4. DATA QUALITY CHECK
-- ==============================================

-- How many records have a negative billing amount? (These are invalid.)
SELECT COUNT(*) AS negative_billing_count
FROM patients
WHERE "Billing Amount" < 0;
