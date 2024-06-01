--Q1: Retrieve the patient_id and ages of all patients
SELECT patient_id, age
FROM diabetes;

--Q2: Select all female patients who are older than 40
SELECT *
FROM diabetes
WHERE gender = 'Female' AND age > 40;

--Q3: Calculate the average BMI of patients
SELECT AVG(bmi) AS average_bmi
FROM diabetes;

--Q4: List patients in descending order of blood glucose levels
SELECT *
FROM diabetes
ORDER BY blood_glucose_level DESC;

--Q5: Find patients who have both hypertension and diabetes
SELECT *
FROM diabetes
WHERE hypertension = 1 AND diabetes = 1;

--Q6: Determine the number of patients with heart disease
SELECT COUNT(*) AS patients_with_heart_disease
FROM diabetes
WHERE heart_disease = 1;

--Q7: Group patients by smoking history and count each group
SELECT smoking_history, COUNT(*)
FROM diabetes
GROUP BY smoking_history;

--Q8: Retrieve the patient_ids of patients with a BMI greater than the average BMI
SELECT patient_id
FROM diabetes
WHERE bmi > (SELECT AVG(bmi) FROM diabetes);

--Q9: Find the patient with the highest and lowest HbA1c levels
SELECT MAX(hba1c_level) AS highest_hba1c_level, 
       MIN(hba1c_level) AS lowest_hba1c_level 
FROM diabetes;

--Q10: Calculate the year of birth for patients (assuming the current date as of now)
SELECT patient_id,
       EXTRACT(YEAR FROM AGE(CURRENT_DATE, age)) AS year_of_birth 
FROM diabetes;

--Q11: Rank patients by blood glucose level within each gender group
SELECT
  patient_id,
  gender,
  blood_glucose_level,
  RANK() OVER (PARTITION BY gender ORDER BY blood_glucose_level DESC) AS glucose_rank
FROM
  diabetes;

--Q12: Update the smoking history of patients older than 50 to 'Ex-smoker'
UPDATE diabetes
SET smoking_history = 'Ex-smoker'
WHERE age > 50;

--Q13: Insert a new patient into the database with sample data
INSERT INTO diabetes (employeename, 
					  patient_id, 
					  gender, 
					  age, 
					  hypertension,
					  heart_disease,
					  smoking_history,
					  bmi,
					  hba1c_level,
					  blood_glucose_level, 
					  diabetes) 
VALUES ('Sample Name',
	   'P0',
	   'Female',
	   23,
	   0,
	   0,
	   'never',
	   25,
	   5,
	   155,
	   0);

--Q14: Delete all patients with heart disease from the database
DELETE FROM diabetes
WHERE heart_disease = 1;

--Q15: Find patients who have hypertension but not diabetes using the EXCEPT operator
SELECT patient_id 
FROM diabetes
WHERE hypertension = 1

EXCEPT

SELECT patient_id 
FROM diabetes
WHERE diabetes = 1;

--Q16: Define a unique constraint on the 'patient_id' column to ensure unique values
ALTER TABLE diabetes
ADD CONSTRAINT unique_patient_id UNIQUE(patient_id);

--Q17: Create a view that displays the patient_ids, ages, and BMI of patients
CREATE VIEW patient_info AS
SELECT patient_id, age, bmi
FROM diabetes;

SELECT * FROM patient_info;

--Q18: Suggestions for improving the database schema to reduce redundancy and enhance data integrity
--1. Normalize the database to eliminate redundancy. This involves dividing the data into smaller, related tables to avoid duplicate storage of information.
--2. Create a separate table for patient information, containing columns such as patient_id, employeename, gender, age, and smoking_history.
--3. Use the patient_id as the primary key in this table and reference it as a foreign key in other related tables.

--Q19: Methods to optimize the performance of SQL queries on this dataset
--1. Identify columns frequently used in WHERE clauses, JOIN conditions, and ORDER BY clauses, and create indexes on those columns. This can greatly enhance data retrieval speed.
--2. Only select the columns necessary for your query. Avoid using SELECT * if you do not need all columns, as fetching unnecessary data can impact performance.
