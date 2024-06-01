-- Drop the existing diabetes table if it exists
DROP TABLE IF EXISTS diabetes;

-- Create the diabetes table with specified columns and data types
CREATE TABLE IF NOT EXISTS diabetes (
    EmployeeName varchar(50),	
	Patient_id text,
	gender varchar(50),
	age float,
	hypertension integer,	
	heart_disease integer,
	smoking_history varchar(50),
	bmi float,
	HbA1c_level float,	
	blood_glucose_level integer,	
	diabetes integer
);

-- Copy data from the CSV file into the diabetes table
COPY diabetes
FROM "E:\Semester 2\Database Programming\Downloads\diabetes.sql"d
ENCODING 'ISO-8859-1'
DELIMITER ','
CSV HEADER;
