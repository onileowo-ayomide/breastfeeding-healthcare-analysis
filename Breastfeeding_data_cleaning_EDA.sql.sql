CREATE DATABASE Breastfeeding_Record;
USE Breastfeeding_Record;
CREATE TABLE Breastfeeding (
                          Mother_ID VARCHAR (100),
                          IInfant_ID VARCHAR (100),
                          Mother_Age INT,
                          Infant_Gender VARCHAR (100),
                          Birth_Date VARCHAR (100),
                          Admission_Date VARCHAR (100),
                          Birth_Weight_Kg DECIMAL (5,2),
                          Breastfeeding_Status VARCHAR (100),
                          Exclusive_Breastfeeding_Days INT,
                          Formular_Feeding VARCHAR (100),
                          Complementary_Feeding VARCHAR (100),
                          Primary_Infant_Diagnosis VARCHAR (100),
                          Maternal_Comorbidities VARCHAR (100),
                          Department VARCHAR (100),
                          Length_Of_Stay_Days INT,
                          Total_Cost DECIMAL (5,2),
                          Currency VARCHAR (100),
                          Raedmitted_30_Days VARCHAR (100),
                          Hospital_ID VARCHAR (100),
                          Insurance_Type VARCHAR (100),
                          Breastfeeding_Status_Duplicate VARCHAR (100)
);
       
--- View Data Set

SELECT *
FROM Breast_feeding;

--- Create a back up Table

CREATE TABLE Breast_Feeding_Rec
Like Breast_Feeding;

--- Insert the New Table

INSERT Breast_Feeding_Rec
SELECT *
FROM Breast_Feeding;

--- View the New Back Up Table

SELECT *
FROM Breast_Feeding_Rec;

--- Check Total Rows

SELECT COUNT(*) AS Total_Rows
FROM Breast_Feeding_Rec;

--- Describe data types and check columns BreastFeeding_Record

DESCRIBE Breast_Feeding_Rec;

--- Check for NULL Values

SELECT *
FROM Breast_Feeding_Rec
WHERE Mother_ID IS NULL;

SELECT COUNT(*) AS Missing_Mother_ID
FROM Breast_Feeding_Rec
WHERE Mother_ID IS NULL;

SELECT COUNT(*) AS Missing_Infant_ID
FROM Breast_Feeding_Rec
WHERE Infant_ID IS NULL;

--- Check several columns with NULL Values

SELECT SUM(
	   CASE WHEN Mother_Age IS NULL OR TRIM(Mother_Age) = ' ' THEN 1 ELSE 0 END) AS Missing_Mother_Age,
       SUM(CASE WHEN Infant_Gender IS NULL THEN 1 ELSE 0 END) AS Missing_Infant_Gender,
       SUM(CASE WHEN Birth_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Birth_Date,
       SUM(CASE WHEN Admission_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Admission_Date,
       SUM(CASE WHEN Birth_Weight_Kg IS NULL THEN 1 ELSE 0 END) AS Missing_Birth_Weigth_Kg,
       SUM(CASE WHEN Breastfeeding_Status IS NULL THEN 1 ELSE 0 END) AS Missing_Breastfeeding_Status,
       SUM(CASE WHEN Exclusive_Breastfeeding_Days IS NULL THEN 1 ELSE 0 END) AS Missing_Exclusive_Breastfeeding_Days,
       SUM(CASE WHEN Formula_Feeding IS NULL THEN 1 ELSE 0 END) AS Missing_Formula_Feeding,
       SUM(CASE WHEN Complementary_Feeding IS NULL THEN 1 ELSE 0 END) AS Missing_Complementary_Feeding,
       SUM(CASE WHEN Primary_Infant_Diagnosis IS NULL THEN 1 ELSE 0 END) AS Missing_Primary_Infant_Diagnosis,
       SUM(CASE WHEN Maternal_Comorbidities IS NULL THEN 1 ELSE 0 END) AS Missing_Maternal_Comorbidities,
       SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS Missing_Department,
       SUM(CASE WHEN Length_Of_Stay_Days IS NULL THEN 1 ELSE 0 END) AS Missing_Length_Of_Stay_Days,
       SUM(CASE WHEN Total_Cost IS NULL THEN 1 ELSE 0 END) AS Missing_Total_Cost,
       SUM(CASE WHEN Currency IS NULL THEN 1 ELSE 0 END) AS Missing_Currency,
       SUM(CASE WHEN Readmitted_30_Days IS NULL THEN 1 ELSE 0 END) AS Missing_Readmitted_30_Days,
       SUM(CASE WHEN Hospital_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Hospital_ID,
       SUM(CASE WHEN Insurance_Type IS NULL THEN 1 ELSE 0 END) AS Missing_Insurance_Type,
       SUM(CASE WHEN Breastfeeding_Status_Duplicate IS NULL THEN 1 ELSE 0 END) AS Missing_Breastfeeding_Status_Duplicate
FROM Breast_Feeding_Rec;

--- Finding Blank Rows

SELECT *
FROM Breast_Feeding_Rec
WHERE Infant_Gender = '';

SELECT *
FROM Breast_Feeding_Rec;

--- Handling both NULL and Blank Rows

SELECT *
FROM Breast_Feeding_Rec
Where Infant_Gender IS NULL
OR TRIM(Infant_Gender) = '';


UPDATE Breast_Feeding_Rec
SET Infant_Gender = 'Unknown'
WHERE Infant_Gender IS NULL
OR TRIM(Infant_Gender) = '';

SET SQL_safe_updates = 0;

--- Update the blank rows with Unknown

UPDATE Breast_Feeding_Rec
SET Infant_Gender = 'Unknown'
WHERE Infant_Gender IS NULL
OR TRIM(Infant_Gender) = '';

--- Check the Updated Table

Select COUNT(*)
FROM Breast_Feeding_Rec
WHERE Infant_Gender = '';

SELECT *
FROM Breast_Feeding_Rec
WHERE Admission_Date = 'N/A';

UPDATE Breast_Feeding_Rec
SET Admission_Date = 'Unknown'
WHERE Admission_Date = 'N/A';

SELECT COUNT(*)
FROM Breast_Feeding_Rec
WHERE Discharge_Date = '';

UPDATE Breast_Feeding_Rec
SET Discharge_Date = 'Unknown'
WHERE Discharge_Date = '';

SELECT COUNT(*)
FROM Breast_Feeding_Rec
WHERE Discharge_Date = '';

SELECT COUNT(*)
FROM Breast_Feeding_Rec
WHERE Birth_Weight_Kg = '';

UPDATE Breast_Feeding_Rec
SET Birth_Weight_Kg = null
WHERE Birth_Weight_Kg = '';

SELECT COUNT(*)
FROM Breast_Feeding_Rec
WHERE Breastfeeding_Status = '';

UPDATE Breast_Feeding_Rec
SET Breastfeeding_Status = 'Unknown'
WHERE Breastfeeding_Status = '';

SELECT SUM(
	   CASE WHEN Mother_Age IS NULL OR TRIM(Mother_Age) = '' THEN 1 ELSE 0 END) AS Missing_Mother_Age,
       SUM(CASE WHEN Infant_Gender IS NULL OR TRIM(Infant_Gender) = '' THEN 1 ELSE 0 END) AS Missing_Infant_Gender,
       SUM(CASE WHEN Birth_Date IS NULL OR TRIM(Birth_Date) = '' THEN 1 ELSE 0 END) AS Missing_Birth_Date,
       SUM(CASE WHEN Admission_Date IS NULL OR TRIM(Admission_Date) = '' THEN 1 ELSE 0 END) AS Missing_Admission_Date,
       SUM(CASE WHEN Birth_Weight_Kg IS NULL OR TRIM(Birth_Weight_Kg) = '' THEN 1 ELSE 0 END) AS Missing_Birth_Weigth_Kg,
       SUM(CASE WHEN Breastfeeding_Status IS NULL OR TRIM(Breastfeeding_Status) = '' THEN 1 ELSE 0 END) AS Missing_Breastfeeding_Status,
       SUM(CASE WHEN Exclusive_Breastfeeding_Days IS NULL OR TRIM(Exclusive_Breastfeeding_Days) = '' THEN 1 ELSE 0 END) AS Missing_Exclusive_Breastfeeding_Days,
       SUM(CASE WHEN Formula_Feeding IS NULL OR TRIM(Formula_Feeding) = '' THEN 1 ELSE 0 END) AS Missing_Formula_Feeding,
       SUM(CASE WHEN Complementary_Feeding IS NULL OR TRIM(Complementary_Feeding) = '' THEN 1 ELSE 0 END) AS Missing_Complementary_Feeding,
       SUM(CASE WHEN Primary_Infant_Diagnosis IS NULL OR TRIM(Primary_Infant_Diagnosis) = '' THEN 1 ELSE 0 END) AS Missing_Primary_Infant_Diagnosis,
       SUM(CASE WHEN Maternal_Comorbidities IS NULL OR TRIM(Maternal_Comorbidities) = '' THEN 1 ELSE 0 END) AS Missing_Maternal_Comorbidities,
       SUM(CASE WHEN Department IS NULL OR TRIM(Department) = '' THEN 1 ELSE 0 END) AS Missing_Department,
       SUM(CASE WHEN Length_Of_Stay_Days IS NULL OR TRIM(Length_Of_Stay_Days) = '' THEN 1 ELSE 0 END) AS Missing_Length_Of_Stay_Days,
       SUM(CASE WHEN Total_Cost IS NULL OR TRIM(Total_Cost) = '' THEN 1 ELSE 0 END) AS Missing_Total_Cost,
       SUM(CASE WHEN Currency IS NULL OR TRIM(Currency) = '' THEN 1 ELSE 0 END) AS Missing_Currency,
       SUM(CASE WHEN Readmitted_30_Days IS NULL OR TRIM(Readmitted_30_Days) = '' THEN 1 ELSE 0 END) AS Missing_Readmitted_30_Days,
       SUM(CASE WHEN Hospital_ID IS NULL OR TRIM(Hospital_ID) = '' THEN 1 ELSE 0 END) AS Missing_Hospital_ID,
       SUM(CASE WHEN Insurance_Type IS NULL OR TRIM(Insurance_Type) = '' THEN 1 ELSE 0 END) AS Missing_Insurance_Type,
       SUM(CASE WHEN Breastfeeding_Status_Duplicate IS NULL OR TRIM(Breastfeeding_Status_Duplicate) = '' THEN 1 ELSE 0 END) AS Missing_Breastfeeding_Status_Duplicate
FROM Breast_Feeding_Rec;

--- Check for duplicate Values

SELECT Mother_ID, COUNT(*) AS Duplicate_Rows
FROM Breast_Feeding_Rec
GROUP BY Mother_ID
HAVING COUNT(*)>1
ORDER BY Duplicate_Rows DESC;

--- Investigate the duplicate values

SELECT Mother_ID,
COUNT(*) AS Number_Of_Admission
FROM Breast_Feeding_Rec
GROUP BY Mother_ID
HAVING COUNT(*) > 1
ORDER BY Number_Of_Admission DESC;

SELECT Infant_ID, COUNT(*) AS Duplicate_Rows
FROM Breast_Feeding_Rec
GROUP BY Infant_ID
HAVING COUNT(*)>1
ORDER BY Duplicate_Rows DESC;

SELECT Infant_ID,
COUNT(*) AS Number_Of_Admission
FROM Breast_Feeding_Rec
GROUP BY Infant_ID
HAVING COUNT(*) > 1
ORDER BY Number_Of_Admission DESC;

SELECT COUNT(*) AS Repeated_Mothers
FROM (
    SELECT Mother_ID
    FROM Breast_Feeding_Rec
    GROUP BY Mother_ID
    HAVING COUNT(*) > 1
) AS repeated;

SELECT
    Mother_ID,
    COUNT(*) AS Number_of_Records
FROM Breast_Feeding_Rec
GROUP BY Mother_ID
HAVING COUNT(*) > 1
ORDER BY Number_of_Records DESC;

SELECT
    Mother_ID,
    Infant_ID,
    Admission_Date,
    Discharge_Date,
    Primary_Infant_Diagnosis,
    Maternal_Comorbidities,
    Department
FROM Breast_Feeding_Rec
WHERE Mother_ID = 'M100289'
ORDER BY Admission_Date;

SELECT Admission_Date, Discharge_Date
FROM Breast_Feeding_Rec;

SELECT STR_TO_DATE (
Admission_Date, '%d/%m/%y'
) AS Clean_Admission_Date
FROM Breast_Feeding_Rec;

SELECT STR_TO_DATE (
Discharge_Date, '%d/%m/%y'
) AS Clean_Discharge_Date
FROM Breast_Feeding_Rec;

SELECT*
FROM Breast_Feeding_Rec
WHERE Discharge_Date < Admission_Date;

DESCRIBE Breast_Feeding_Rec;

SELECT
    Admission_Date,
    LENGTH(Admission_Date) AS Length,
    CONCAT('[', Admission_Date, ']') AS Visible_Value
FROM Breast_Feeding_Rec
LIMIT 20;

SELECT
    Admission_Date,
    LENGTH(Admission_Date) AS Length,
    HEX(Admission_Date) AS Hex_Value
FROM Breast_Feeding_Rec
LIMIT 20;

SELECT
    Admission_Date,
    LENGTH(Admission_Date) AS Length,
    HEX(Admission_Date) AS Hex_Value
FROM Breast_Feeding_Rec
WHERE Admission_Date <> ''
LIMIT 10;

SELECT
    Admission_Date AS Original_Date,
    STR_TO_DATE(TRIM(Admission_Date), '%m/%d/%Y') AS Standardized_Date
FROM Breast_Feeding_Rec
LIMIT 20;

SELECT
    Admission_Date
FROM Breast_Feeding_Rec
WHERE TRIM(Admission_Date) <> ''
  AND STR_TO_DATE(TRIM(Admission_Date), '%m/%d/%Y') IS NULL;

SELECT
    Discharge_Date AS Original_Date,
    STR_TO_DATE(TRIM(Discharge_Date), '%m/%d/%Y') AS Standardized_Date
FROM Breast_Feeding_Rec
LIMIT 20;

SELECT
    Discharge_Date
FROM Breast_Feeding_Rec
WHERE TRIM(Discharge_Date) <> ''
  AND STR_TO_DATE(TRIM(Discharge_Date), '%m/%d/%Y') IS NULL;
  
  ALTER TABLE Breast_Feeding_Rec
ADD COLUMN Admission_Date_Standardized DATE;

SET SQL_SAFE_UPDATES = 0;

SELECT
    SUM(
        CASE
            WHEN CAST(SUBSTRING_INDEX(Admission_Date, '/', 1) AS UNSIGNED) > 12
            THEN 1
            ELSE 0
        END
    ) AS Clearly_DD_MM_YYYY,

    SUM(
        CASE
            WHEN CAST(SUBSTRING_INDEX(Admission_Date, '/', 1) AS UNSIGNED) <= 12
            THEN 1
            ELSE 0
        END
    ) AS Could_Be_MM_DD_YYYY
FROM Breast_Feeding_Rec
WHERE TRIM(Admission_Date) <> '';

SELECT
STR_TO_DATE(Admission_Date, '%d/%m/%Y')
FROM Breast_Feeding_Rec;

SELECT
    Admission_Date
FROM Breast_Feeding_Rec
WHERE CAST(SUBSTRING_INDEX(Admission_Date, '/', 1) AS UNSIGNED) <= 12
ORDER BY Admission_Date
LIMIT 50;

SELECT DISTINCT Admission_Date
FROM Breast_Feeding_Rec
WHERE CAST(SUBSTRING_INDEX(Admission_Date, '/', 1) AS UNSIGNED) > 12
ORDER BY Admission_Date
LIMIT 50;

SELECT
    Admission_Date,
    SUBSTRING_INDEX(Admission_Date, '/', 1) AS Part_1,
    SUBSTRING_INDEX(
        SUBSTRING_INDEX(Admission_Date, '/', 2),
        '/',
        -1
    ) AS Part_2,
    SUBSTRING_INDEX(Admission_Date, '/', -1) AS Part_3
FROM Breast_Feeding_Rec
LIMIT 30;

SELECT
    SUM(
        CASE
            WHEN Admission_Date REGEXP '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$'
                 AND CAST(SUBSTRING_INDEX(Admission_Date, '/', 1) AS UNSIGNED) > 12
            THEN 1 ELSE 0
        END
    ) AS Definitely_DD_MM,

    SUM(
        CASE
            WHEN Admission_Date REGEXP '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$'
                 AND CAST(SUBSTRING_INDEX(Admission_Date, '/', -1) AS UNSIGNED) > 0
                 AND CAST(
                     SUBSTRING_INDEX(
                         SUBSTRING_INDEX(Admission_Date, '/', 2),
                         '/',
                         -1
                     ) AS UNSIGNED
                 ) > 12
            THEN 1 ELSE 0
        END
    ) AS Definitely_MM_DD,

    SUM(
        CASE
            WHEN Admission_Date REGEXP '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$'
                 AND CAST(SUBSTRING_INDEX(Admission_Date, '/', 1) AS UNSIGNED) <= 12
                 AND CAST(
                     SUBSTRING_INDEX(
                         SUBSTRING_INDEX(Admission_Date, '/', 2),
                         '/',
                         -1
                     ) AS UNSIGNED
                 ) <= 12
            THEN 1 ELSE 0
        END
    ) AS Ambiguous
FROM Breast_Feeding_Rec;

SELECT
    Admission_Date,
    STR_TO_DATE(TRIM(Admission_Date), '%d/%m/%Y') AS Standardized_Date
FROM Breast_Feeding_Rec;

SELECT
    Admission_Date,
    STR_TO_DATE(TRIM(Admission_Date), '%d/%m/%Y') AS Standardized_Date
FROM Breast_Feeding_Rec
WHERE CAST(SUBSTRING_INDEX(Admission_Date, '/', 1) AS UNSIGNED) > 12;

SELECT
    Admission_Date,
    STR_TO_DATE(TRIM(Admission_Date), '%m/%d/%Y') AS Standardized_Date
FROM Breast_Feeding_Rec
WHERE CAST(
    SUBSTRING_INDEX(
        SUBSTRING_INDEX(Admission_Date, '/', 2),
        '/',
        -1
    ) AS UNSIGNED
) > 12;

SELECT DISTINCT Admission_Date
FROM Breast_Feeding_Rec
WHERE Admission_Date LIKE '%/%/%'
  AND (
      CAST(SUBSTRING_INDEX(Admission_Date, '/', 1) AS UNSIGNED) > 31
      OR CAST(
          SUBSTRING_INDEX(
              SUBSTRING_INDEX(Admission_Date, '/', 2),
              '/',
              -1
          ) AS UNSIGNED
      ) > 31
  )
LIMIT 100;

SELECT
    COUNT(*) AS Malformed_Dates
FROM Breast_Feeding_Rec
WHERE Admission_Date = '2025/31/02';

UPDATE Breast_Feeding_Rec
SET Discharge_Date = null
WHERE Discharge_Date = 'Unknown';

SELECT
    Mother_ID,
    Infant_ID,
    Admission_Date,
    Discharge_Date,
    Primary_Infant_Diagnosis,
    Maternal_Comorbidities,
    Department
FROM Breast_Feeding_Rec
WHERE Admission_Date = '2025/31/02';

SELECT
    Admission_Date,
    Discharge_Date,
    COUNT(*) AS Number_of_Records
FROM Breast_Feeding_Rec
WHERE Admission_Date = '2025/31/02'
GROUP BY
    Admission_Date,
    Discharge_Date
ORDER BY Discharge_Date;

UPDATE Breast_Feeding_Rec
SET Admission_Date_Standardized = NULL
WHERE Admission_Date = '2025/31/02';

UPDATE Breast_Feeding_Rec
SET Birth_Date = null
WHERE Birth_Date = 'Unknown';

SELECT
COUNT(*) AS Missing_Discharge_Date
FROM Breast_Feeding_Rec
WHERE Discharge_Date IS NULL;

SELECT DISTINCT Discharge_Date
FROM Breast_Feeding_Rec
WHERE Discharge_Date IS NOT NULL
LIMIT 50;

SELECT
    LENGTH(Discharge_Date) AS Date_Length,
    COUNT(*) AS Number_of_Records
FROM Breast_Feeding_Rec
WHERE Discharge_Date IS NOT NULL
GROUP BY LENGTH(Discharge_Date)
ORDER BY Date_Length;

SELECT DISTINCT Discharge_Date
FROM Breast_Feeding_Rec
WHERE Discharge_Date IS NOT NULL
ORDER BY Discharge_Date
LIMIT 50;

SELECT
    Discharge_Date,
    LENGTH(Discharge_Date) AS Date_Length,
    HEX(Discharge_Date) AS Hex_Value
FROM Breast_Feeding_Rec
WHERE Discharge_Date IS NOT NULL
LIMIT 20;

SELECT
    SUM(
        CASE
            WHEN Discharge_Date LIKE '%/%/%'
                 AND CAST(SUBSTRING_INDEX(Discharge_Date, '/', 1) AS UNSIGNED) > 12
            THEN 1 ELSE 0
        END
    ) AS Definitely_DD_MM,

    SUM(
        CASE
            WHEN Discharge_Date LIKE '%/%/%'
                 AND CAST(
                     SUBSTRING_INDEX(
                         SUBSTRING_INDEX(Discharge_Date, '/', 2),
                         '/',
                         -1
                     ) AS UNSIGNED
                 ) > 12
            THEN 1 ELSE 0
        END
    ) AS Definitely_MM_DD,

    SUM(
        CASE
            WHEN Discharge_Date LIKE '%/%/%'
                 AND CAST(SUBSTRING_INDEX(Discharge_Date, '/', 1) AS UNSIGNED) <= 12
                 AND CAST(
                     SUBSTRING_INDEX(
                         SUBSTRING_INDEX(Discharge_Date, '/', 2),
                         '/',
                         -1
                     ) AS UNSIGNED
                 ) <= 12
            THEN 1 ELSE 0
        END
    ) AS Ambiguous
FROM Breast_Feeding_Rec
WHERE Discharge_Date IS NOT NULL;

SELECT
    Discharge_Date,
    STR_TO_DATE(TRIM(Discharge_Date), '%d/%m/%Y') AS Standardized_Date
FROM Breast_Feeding_Rec
WHERE Discharge_Date LIKE '%/%/%'
  AND CAST(SUBSTRING_INDEX(Discharge_Date, '/', 1) AS UNSIGNED) > 12;
  
  SELECT
    Discharge_Date,
    STR_TO_DATE(TRIM(Discharge_Date), '%m/%d/%Y') AS Standardized_Date
FROM Breast_Feeding_Rec
WHERE Discharge_Date LIKE '%/%/%'
  AND CAST(
      SUBSTRING_INDEX(
          SUBSTRING_INDEX(Discharge_Date, '/', 2),
          '/',
          -1
      ) AS UNSIGNED
  ) > 12;
  
  ALTER TABLE Breast_Feeding_Rec
ADD COLUMN Discharge_Date_Standardized DATE;

UPDATE Breast_Feeding_Rec
SET Discharge_Date_Standardized =
    CASE
        -- Definitely DD/MM/YYYY
        WHEN Discharge_Date LIKE '%/%/%'
             AND CAST(SUBSTRING_INDEX(Discharge_Date, '/', 1) AS UNSIGNED) > 12
        THEN STR_TO_DATE(TRIM(Discharge_Date), '%d/%m/%Y')

        -- Definitely MM/DD/YYYY
        WHEN Discharge_Date LIKE '%/%/%'
             AND CAST(
                 SUBSTRING_INDEX(
                     SUBSTRING_INDEX(Discharge_Date, '/', 2),
                     '/',
                     -1
                 ) AS UNSIGNED
             ) > 12
        THEN STR_TO_DATE(TRIM(Discharge_Date), '%m/%d/%Y')

        ELSE NULL
    END;
    
    SELECT
    COUNT(*) AS Standardized_Discharge_Dates
FROM Breast_Feeding_Rec
WHERE Discharge_Date_Standardized IS NOT NULL;

SELECT
    Discharge_Date,
    Discharge_Date_Standardized
FROM Breast_Feeding_Rec
WHERE Discharge_Date_Standardized IS NOT NULL
LIMIT 30;

SELECT *
FROM Breast_Feeding_Rec;

SELECT
    COUNT(*) AS Standardized_Admission_Dates
FROM Breast_Feeding_Rec
WHERE Admission_Date_Standardized IS NOT NULL;

UPDATE Breast_Feeding_Rec
SET Discharge_Date_Standardized =
    CASE
        WHEN Discharge_Date LIKE '%/%/%'
             AND CAST(SUBSTRING_INDEX(Discharge_Date, '/', 1) AS UNSIGNED) > 12
        THEN STR_TO_DATE(TRIM(Discharge_Date), '%d/%m/%Y')

        WHEN Discharge_Date LIKE '%/%/%'
             AND CAST(
                 SUBSTRING_INDEX(
                     SUBSTRING_INDEX(Discharge_Date, '/', 2),
                     '/',
                     -1
                 ) AS UNSIGNED
             ) > 12
        THEN STR_TO_DATE(TRIM(Discharge_Date), '%m/%d/%Y')

        ELSE NULL
    END;
    
    SELECT *
FROM Breast_Feeding_Rec;


UPDATE Breast_Feeding_Rec
SET Admission_Date = null
WHERE Admission_Date = 'Unknown';

SELECT
    Admission_Date,
    COUNT(*) AS Number_of_Records
FROM Breast_Feeding_Rec
WHERE Admission_Date IS NOT NULL
  AND Admission_Date_Standardized IS NULL
GROUP BY Admission_Date
ORDER BY Number_of_Records DESC;

    
    SELECT
    Admission_Date,
    COUNT(*) AS Number_of_Records
FROM Breast_Feeding_Rec
WHERE Admission_Date IN (
    '2024-02-30',
    '31-13-2024',
    '2025/31/02'
)
GROUP BY Admission_Date;

UPDATE Breast_Feeding_Rec
SET Admission_Date_Standardized =
    CASE

        -- DD/MM/YYYY
        WHEN Admission_Date REGEXP '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$'
             AND CAST(SUBSTRING_INDEX(Admission_Date, '/', 1) AS UNSIGNED) BETWEEN 13 AND 31
             AND CAST(
                 SUBSTRING_INDEX(
                     SUBSTRING_INDEX(Admission_Date, '/', 2),
                     '/',
                     -1
                 ) AS UNSIGNED
             ) BETWEEN 1 AND 12
        THEN STR_TO_DATE(TRIM(Admission_Date), '%d/%m/%Y')

        -- MM/DD/YYYY
        WHEN Admission_Date REGEXP '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$'
             AND CAST(SUBSTRING_INDEX(Admission_Date, '/', 1) AS UNSIGNED) BETWEEN 1 AND 12
             AND CAST(
                 SUBSTRING_INDEX(
                     SUBSTRING_INDEX(Admission_Date, '/', 2),
                     '/',
                     -1
                 ) AS UNSIGNED
             ) BETWEEN 13 AND 31
        THEN STR_TO_DATE(TRIM(Admission_Date), '%m/%d/%Y')

        -- Valid YYYY-MM-DD
        WHEN Admission_Date REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$'
             AND Admission_Date NOT IN ('2024-02-30')
        THEN STR_TO_DATE(TRIM(Admission_Date), '%Y-%m-%d')

        ELSE NULL
    END;
    
    SELECT
    COUNT(*) AS Standardized_Admission_Dates
FROM Breast_Feeding_Rec
WHERE Admission_Date_Standardized IS NOT NULL;

SELECT *
FROM Breast_Feeding_Rec;

SELECT
    COUNT(*) AS Ambiguous_Admission_Dates
FROM Breast_Feeding_Rec
WHERE Admission_Date REGEXP '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$'
  AND CAST(SUBSTRING_INDEX(Admission_Date, '/', 1) AS UNSIGNED) BETWEEN 1 AND 12
  AND CAST(
      SUBSTRING_INDEX(
          SUBSTRING_INDEX(Admission_Date, '/', 2),
          '/',
          -1
      ) AS UNSIGNED
  ) BETWEEN 1 AND 12;
  
  SELECT
    Admission_Date,
    COUNT(*) AS Number_of_Records
FROM Breast_Feeding_Rec
WHERE Admission_Date REGEXP '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$'
  AND CAST(SUBSTRING_INDEX(Admission_Date, '/', 1) AS UNSIGNED) BETWEEN 1 AND 12
  AND CAST(
      SUBSTRING_INDEX(
          SUBSTRING_INDEX(Admission_Date, '/', 2),
          '/',
          -1
      ) AS UNSIGNED
  ) BETWEEN 1 AND 12
GROUP BY Admission_Date
ORDER BY Number_of_Records DESC, Admission_Date;

SELECT
    Admission_Date,
    Discharge_Date,
    STR_TO_DATE(Admission_Date, '%m/%d/%Y') AS As_MM_DD,
    STR_TO_DATE(Admission_Date, '%d/%m/%Y') AS As_DD_MM
FROM Breast_Feeding_Rec
WHERE Admission_Date IN (
    '5/10/2024',
    '7/11/2025',
    '4/11/2023',
    '10/6/2024',
    '4/4/2026',
    '5/8/2026',
    '8/2/2023'
)
LIMIT 50;

SELECT *
FROM Breast_Feeding_Rec;

SELECT
    Admission_Date,
    Admission_Date_Standardized,
    STR_TO_DATE(Admission_Date, '%m/%d/%Y') AS As_MM_DD,
    STR_TO_DATE(Admission_Date, '%d/%m/%Y') AS As_DD_MM
FROM Breast_Feeding_Rec
WHERE Admission_Date LIKE '%/%/%'
LIMIT 50;

SELECT
    Discharge_Date,
    Discharge_Date_Standardized,
    STR_TO_DATE(Discharge_Date, '%m/%d/%Y') AS As_MM_DD,
    STR_TO_DATE(Discharge_Date, '%d/%m/%Y') AS As_DD_MM
FROM Breast_Feeding_Rec
WHERE Discharge_Date LIKE '%/%/%'
LIMIT 50;

SELECT
      Admission_Date,
      Admission_Date_Standardized,
    Discharge_Date,
    Discharge_Date_Standardized,
    
    STR_TO_DATE(Admission_Date, '%m/%d/%Y') As As_Admission_MM_DD,
    STR_TO_DATE(Admission_Date, '%m/%d/%Y') As As_Admission_DD_MM,
    
    STR_TO_DATE(Discharge_Date, '%m/%d/%Y') AS As_Discharge_MM_DD,
    STR_TO_DATE(Discharge_Date, '%d/%m/%Y') AS As_Discharge_DD_MM
    
FROM Breast_Feeding_Rec
WHERE Admission_Date IS NOT NULL
OR Discharge_Date IS NOT NULL
LIMIT 100;

SELECT
    Admission_Date,
    Admission_Date_Standardized,
    Discharge_Date,
    Discharge_Date_Standardized,

    STR_TO_DATE(Admission_Date, '%m/%d/%Y') AS Admission_MM_DD,
    STR_TO_DATE(Admission_Date, '%d/%m/%Y') AS Admission_DD_MM,

    STR_TO_DATE(Discharge_Date, '%m/%d/%Y') AS Discharge_MM_DD,
    STR_TO_DATE(Discharge_Date, '%d/%m/%Y') AS Discharge_DD_MM

FROM Breast_Feeding_Rec
WHERE
    (
        STR_TO_DATE(Admission_Date, '%m/%d/%Y') IS NOT NULL
        AND
        STR_TO_DATE(Admission_Date, '%d/%m/%Y') IS NOT NULL
        AND
        STR_TO_DATE(Admission_Date, '%m/%d/%Y')
        <> STR_TO_DATE(Admission_Date, '%d/%m/%Y')
    )
    OR
    (
        STR_TO_DATE(Discharge_Date, '%m/%d/%Y') IS NOT NULL
        AND
        STR_TO_DATE(Discharge_Date, '%d/%m/%Y') IS NOT NULL
        AND
        STR_TO_DATE(Discharge_Date, '%m/%d/%Y')
        <> STR_TO_DATE(Discharge_Date, '%d/%m/%Y')
    );
    
    SELECT
    Admission_Date,
    Discharge_Date,
    Admission_Date_Standardized,
    Discharge_Date_Standardized,

    STR_TO_DATE(Admission_Date, '%m/%d/%Y') AS Admission_MM_DD,
    STR_TO_DATE(Admission_Date, '%d/%m/%Y') AS Admission_DD_MM,

    STR_TO_DATE(Discharge_Date, '%m/%d/%Y') AS Discharge_MM_DD,
    STR_TO_DATE(Discharge_Date, '%d/%m/%Y') AS Discharge_DD_MM,

    CASE
        WHEN STR_TO_DATE(Admission_Date, '%m/%d/%Y') IS NOT NULL
         AND STR_TO_DATE(Discharge_Date, '%m/%d/%Y') IS NOT NULL
         AND STR_TO_DATE(Admission_Date, '%m/%d/%Y')
             <= STR_TO_DATE(Discharge_Date, '%m/%d/%Y')
        THEN 'Valid'
        ELSE 'Invalid'
    END AS MM_DD_Chronology,

    CASE
        WHEN STR_TO_DATE(Admission_Date, '%d/%m/%Y') IS NOT NULL
         AND STR_TO_DATE(Discharge_Date, '%d/%m/%Y') IS NOT NULL
         AND STR_TO_DATE(Admission_Date, '%d/%m/%Y')
             <= STR_TO_DATE(Discharge_Date, '%d/%m/%Y')
        THEN 'Valid'
        ELSE 'Invalid'
    END AS DD_MM_Chronology

FROM Breast_Feeding_Rec
WHERE Admission_Date IS NOT NULL
  AND Discharge_Date IS NOT NULL
LIMIT 100;

SELECT
    Admission_Date,
    Admission_Date_Standardized,
    Discharge_Date,
    Discharge_Date_Standardized,

    -- Admission Date: test both possible formats
    STR_TO_DATE(Admission_Date, '%m/%d/%Y') AS Admission_MM_DD,
    STR_TO_DATE(Admission_Date, '%d/%m/%Y') AS Admission_DD_MM,

    -- Discharge Date: test both possible formats
    STR_TO_DATE(Discharge_Date, '%m/%d/%Y') AS Discharge_MM_DD,
    STR_TO_DATE(Discharge_Date, '%d/%m/%Y') AS Discharge_DD_MM,

    -- Check whether MM/DD interpretation gives a valid chronology
    CASE
        WHEN STR_TO_DATE(Admission_Date, '%m/%d/%Y') IS NOT NULL
         AND STR_TO_DATE(Discharge_Date, '%m/%d/%Y') IS NOT NULL
         AND STR_TO_DATE(Admission_Date, '%m/%d/%Y')
             <= STR_TO_DATE(Discharge_Date, '%m/%d/%Y')
        THEN 'Valid'
        ELSE 'Invalid'
    END AS MM_DD_Chronology,

    -- Check whether DD/MM interpretation gives a valid chronology
    CASE
        WHEN STR_TO_DATE(Admission_Date, '%d/%m/%Y') IS NOT NULL
         AND STR_TO_DATE(Discharge_Date, '%d/%m/%Y') IS NOT NULL
         AND STR_TO_DATE(Admission_Date, '%d/%m/%Y')
             <= STR_TO_DATE(Discharge_Date, '%d/%m/%Y')
        THEN 'Valid'
        ELSE 'Invalid'
    END AS DD_MM_Chronology

FROM Breast_Feeding_Rec

WHERE
    -- Exclude rows where BOTH interpretations of Admission_Date are invalid
    (
        STR_TO_DATE(Admission_Date, '%m/%d/%Y') IS NOT NULL
        OR
        STR_TO_DATE(Admission_Date, '%d/%m/%Y') IS NOT NULL
    )

    AND

    -- Exclude rows where BOTH interpretations of Discharge_Date are invalid
    (
        STR_TO_DATE(Discharge_Date, '%m/%d/%Y') IS NOT NULL
        OR
        STR_TO_DATE(Discharge_Date, '%d/%m/%Y') IS NOT NULL
    )

LIMIT 100;

SELECT
    Admission_Date,
    Admission_Date_Standardized,
    Discharge_Date,
    Discharge_Date_Standardized,

    STR_TO_DATE(Admission_Date, '%m/%d/%Y') AS Admission_MM_DD,
    STR_TO_DATE(Admission_Date, '%d/%m/%Y') AS Admission_DD_MM,

    STR_TO_DATE(Discharge_Date, '%m/%d/%Y') AS Discharge_MM_DD,
    STR_TO_DATE(Discharge_Date, '%d/%m/%Y') AS Discharge_DD_MM,

    CASE
        WHEN STR_TO_DATE(Admission_Date, '%m/%d/%Y') IS NOT NULL
         AND STR_TO_DATE(Admission_Date, '%d/%m/%Y') IS NULL
        THEN 'MM/DD'

        WHEN STR_TO_DATE(Admission_Date, '%m/%d/%Y') IS NULL
         AND STR_TO_DATE(Admission_Date, '%d/%m/%Y') IS NOT NULL
        THEN 'DD/MM'

        ELSE 'Ambiguous_or_Invalid'
    END AS Admission_Interpretation,

    CASE
        WHEN STR_TO_DATE(Discharge_Date, '%m/%d/%Y') IS NOT NULL
         AND STR_TO_DATE(Discharge_Date, '%d/%m/%Y') IS NULL
        THEN 'MM/DD'

        WHEN STR_TO_DATE(Discharge_Date, '%m/%d/%Y') IS NULL
         AND STR_TO_DATE(Discharge_Date, '%d/%m/%Y') IS NOT NULL
        THEN 'DD/MM'

        ELSE 'Ambiguous_or_Invalid'
    END AS Discharge_Interpretation

FROM Breast_Feeding_Rec
WHERE Admission_Date IS NOT NULL
   OR Discharge_Date IS NOT NULL
LIMIT 100;

SELECT
    Admission_Date,
    Admission_Date_Standardized,
    Discharge_Date,
    Discharge_Date_Standardized
FROM Breast_Feeding_Rec
WHERE
    (
        STR_TO_DATE(Admission_Date, '%m/%d/%Y') IS NOT NULL
        AND STR_TO_DATE(Admission_Date, '%d/%m/%Y') IS NOT NULL
        AND STR_TO_DATE(Admission_Date, '%m/%d/%Y')
            <> STR_TO_DATE(Admission_Date, '%d/%m/%Y')
    )
    OR
    (
        STR_TO_DATE(Discharge_Date, '%m/%d/%Y') IS NOT NULL
        AND STR_TO_DATE(Discharge_Date, '%d/%m/%Y') IS NOT NULL
        AND STR_TO_DATE(Discharge_Date, '%m/%d/%Y')
            <> STR_TO_DATE(Discharge_Date, '%d/%m/%Y')
    );
    
  SELECT
    Admission_Date,
    Admission_Date_Standardized,
    Discharge_Date,
    Discharge_Date_Standardized
FROM Breast_Feeding_Rec
WHERE Admission_Date_Standardized IS NULL
   OR Discharge_Date_Standardized IS NULL;
   
   SELECT
    COUNT(*) AS Total_Rows,
    SUM(Admission_Date_Standardized IS NULL) AS Missing_Admission_Standardized,
    SUM(Discharge_Date_Standardized IS NULL) AS Missing_Discharge_Standardized
FROM Breast_Feeding_Rec;

SELECT
    Admission_Date,
    Admission_Date_Standardized,
    Discharge_Date,
    Discharge_Date_Standardized
FROM Breast_Feeding_Rec
WHERE Admission_Date_Standardized IS NULL
   OR Discharge_Date_Standardized IS NULL
LIMIT 100;

SELECT COUNT(*) AS Total_Rows
FROM Breast_Feeding_Rec;

DESCRIBE Breast_Feeding_Rec;

SELECT Infant_ID,
COUNT(*) AS Record_Row
FROM Breast_Feeding_Rec
WHERE Infant_ID IS NOT NULL
GROUP BY Infant_ID
HAVING COUNT(*) > 1
ORDER BY Record_Row DESC;

SELECT
    COUNT(*) AS Duplicate_Infant_IDs,
    SUM(Record_Count) AS Rows_Involved
FROM (
    SELECT
        Infant_ID,
        COUNT(*) AS Record_Count
    FROM Breast_Feeding_Rec
    WHERE Infant_ID IS NOT NULL
    GROUP BY Infant_ID
    HAVING COUNT(*) > 1
) AS duplicates;

SELECT *
FROM Breast_Feeding_Rec
WHERE Infant_ID IN (
    SELECT Infant_ID
    FROM Breast_Feeding_Rec
    WHERE Infant_ID IS NOT NULL
    GROUP BY Infant_ID
    HAVING COUNT(*) > 1
)
ORDER BY Infant_ID;

SELECT
    Infant_ID,
    Mother_ID,
    Admission_Date_Standardized,
    Discharge_Date_Standardized,
    Birth_Date,
    Infant_Gender,
    Primary_Infant_Diagnosis
FROM Breast_Feeding_Rec
WHERE Infant_ID = 'I200405';

SELECT
    Mother_ID,
    Infant_ID,
    Mother_Age,
    Infant_Age_Days,
    Infant_Gender,
    Birth_Date,
    Admission_Date,
    Discharge_Date,
    Birth_Weight_kg,
    Breastfeeding_Status,
    Exclusive_Breastfeeding_Days,
    Formula_Feeding,
    Complementary_Feeding,
    Primary_Infant_Diagnosis,
    Maternal_Comorbidities,
    Department,
    Length_of_Stay_Days,
    Total_Cost,
    Currency,
    Readmitted_30_Days,
    Hospital_ID,
    Insurance_Type,
    Breastfeeding_Status_Duplicate,
    Admission_Date_Standardized,
    Discharge_Date_Standardized,
    COUNT(*) AS Duplicate_Count
FROM Breast_Feeding_Rec
GROUP BY
    Mother_ID,
    Infant_ID,
    Mother_Age,
    Infant_Age_Days,
    Infant_Gender,
    Birth_Date,
    Admission_Date,
    Discharge_Date,
    Birth_Weight_kg,
    Breastfeeding_Status,
    Exclusive_Breastfeeding_Days,
    Formula_Feeding,
    Complementary_Feeding,
    Primary_Infant_Diagnosis,
    Maternal_Comorbidities,
    Department,
    Length_of_Stay_Days,
    Total_Cost,
    Currency,
    Readmitted_30_Days,
    Hospital_ID,
    Insurance_Type,
    Breastfeeding_Status_Duplicate,
    Admission_Date_Standardized,
    Discharge_Date_Standardized
HAVING COUNT(*) > 1;

SELECT
    Infant_Gender,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Infant_Gender
ORDER BY Frequency DESC;

SET SQL_SAFE_UPDATES = 0;

UPDATE Breast_Feeding_Rec
SET Infant_Gender =
    CASE
        WHEN Infant_Gender = 'M' THEN 'Male'
        WHEN Infant_Gender = 'F' THEN 'Female'
        ELSE Infant_Gender
    END;
    
    SELECT
    Infant_Gender,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Infant_Gender
ORDER BY Frequency DESC;

SELECT
    Breastfeeding_Status,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Breastfeeding_Status
ORDER BY Frequency DESC;

UPDATE Breast_Feeding_Rec
SET Breastfeeding_Status = TRIM(Breastfeeding_Status);

UPDATE Breast_Feeding_Rec
SET Breastfeeding_Status =
    UPPER(
        TRIM(
            REPLACE(
                Breastfeeding_Status,
                CONVERT(0xC2A0 USING utf8mb4),
                ' '
            )
        )
    );
    
    SELECT
    Breastfeeding_Status,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Breastfeeding_Status
ORDER BY Frequency DESC;

SELECT
    Formula_Feeding,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Formula_Feeding
ORDER BY Frequency DESC;

UPDATE Breast_Feeding_Rec
SET Formula_Feeding =
    CASE
        WHEN UPPER(TRIM(Formula_Feeding)) IN ('YES', 'Y', '1')
            THEN 'YES'
        WHEN UPPER(TRIM(Formula_Feeding)) IN ('NO', 'N', '0')
            THEN 'NO'
        WHEN TRIM(Formula_Feeding) = ''
            THEN 'UNKNOWN'
        ELSE Formula_Feeding
    END;

UPDATE Breast_Feeding_Rec
SET Breastfeeding_Status =
    CASE
        WHEN Breastfeeding_Status IN ('Y', '1') THEN 'YES'
        WHEN Breastfeeding_Status IN ('N', '0') THEN 'NO'
        WHEN Breastfeeding_Status = '' THEN 'UNKNOWN'
        ELSE Breastfeeding_Status
    END;
    
    SELECT
    Formula_Feeding,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Formula_Feeding
ORDER BY Frequency DESC;

SELECT
    Complementary_Feeding,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Complementary_Feeding
ORDER BY Frequency DESC;

UPDATE Breast_Feeding_Rec
SET Complementary_Feeding =
    CASE
        WHEN UPPER(TRIM(Complementary_Feeding)) IN ('YES', 'Y')
            THEN 'YES'
        WHEN UPPER(TRIM(Complementary_Feeding)) = 'NO'
            THEN 'NO'
        WHEN UPPER(TRIM(Complementary_Feeding)) = 'N'
            THEN 'NO'
        WHEN TRIM(Complementary_Feeding) = ''
            THEN 'UNKNOWN'
        ELSE UPPER(TRIM(Complementary_Feeding))
    END;
    
    SELECT *
    FROM Breast_Feeding_Rec;
    
    SELECT
    Primary_Infant_Diagnosis,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Primary_Infant_Diagnosis
ORDER BY Frequency DESC;

UPDATE Breast_Feeding_Rec
SET Primary_Infant_Diagnosis =
    CASE
        WHEN TRIM(Primary_Infant_Diagnosis) = ''
            THEN 'UNKNOWN'

        WHEN TRIM(Primary_Infant_Diagnosis) IN
            ('Healthy Newborn')
            THEN 'Healthy Newborn'

        WHEN TRIM(Primary_Infant_Diagnosis) IN
            ('Dehydration', 'Dehydraton')
            THEN 'Dehydration'

        WHEN TRIM(Primary_Infant_Diagnosis) IN
            ('Low Birth Weight', 'Low Birth Wight')
            THEN 'Low Birth Weight'

        WHEN TRIM(Primary_Infant_Diagnosis) IN
            ('Respiratory Infection', 'Respiratory Infecion')
            THEN 'Respiratory Infection'

        WHEN TRIM(Primary_Infant_Diagnosis) IN
            ('Diarrheal Disease', 'Diarrheal Desease')
            THEN 'Diarrheal Disease'

        WHEN TRIM(Primary_Infant_Diagnosis) IN
            ('Poor Weight Gain', 'Poor Weight Gainn')
            THEN 'Poor Weight Gain'

        WHEN TRIM(Primary_Infant_Diagnosis) IN
            ('Neonatal Sepsis', 'Neonatal Sepis')
            THEN 'Neonatal Sepsis'

        WHEN TRIM(Primary_Infant_Diagnosis) IN
            ('Prematurity', 'Prematurty')
            THEN 'Prematurity'

        WHEN TRIM(Primary_Infant_Diagnosis) IN
            ('Neonatal Jaundice', 'Neonatal Jaundce')
            THEN 'Neonatal Jaundice'

        ELSE Primary_Infant_Diagnosis
    END;
    
    SELECT
    Maternal_Comorbidities,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Maternal_Comorbidities
ORDER BY Frequency DESC;

UPDATE Breast_Feeding_Rec
SET Maternal_Comorbidities = 'UNKNOWN'
WHERE TRIM(Maternal_Comorbidities) = '';

SELECT
    Infant_ID,
    Primary_Infant_Diagnosis,
    LENGTH(Primary_Infant_Diagnosis) AS Char_Length,
    HEX(Primary_Infant_Diagnosis) AS Hex_Value
FROM Breast_Feeding_Rec
WHERE Primary_Infant_Diagnosis IS NULL
   OR TRIM(Primary_Infant_Diagnosis) = '';
   
   SELECT
    Department,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Department
ORDER BY Frequency DESC;

UPDATE Breast_Feeding_Rec
SET Department = 'NICU'
WHERE UPPER(TRIM(Department)) = 'NICU';

SELECT *
FROM Breast_Feeding_Rec;

SELECT
    Birth_Weight_kg,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
WHERE Birth_Weight_kg < 0
GROUP BY Birth_Weight_kg
ORDER BY Birth_Weight_kg;

UPDATE Breast_Feeding_Rec
SET Birth_Weight_kg = NULL
WHERE Birth_Weight_kg = -0.8;

SELECT
    AVG(Birth_Weight_kg) AS Median_Birth_Weight
FROM (
    SELECT
        Birth_Weight_kg,
        ROW_NUMBER() OVER (ORDER BY Birth_Weight_kg) AS rn,
        COUNT(*) OVER () AS total_rows
    FROM Breast_Feeding_Rec
    WHERE Birth_Weight_kg IS NOT NULL
) AS x
WHERE rn IN (
    FLOOR((total_rows + 1) / 2),
    CEIL((total_rows + 1) / 2)
);

UPDATE Breast_Feeding_Rec
SET Birth_Weight_kg = 3.31
WHERE Birth_Weight_kg IS NULL;

SELECT
    COUNT(*) AS Missing_Birth_Weight
FROM Breast_Feeding_Rec
WHERE Birth_Weight_kg IS NULL;

SELECT*
FROM Breast_Feeding_Rec;

SELECT
    Length_of_Stay_Days,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Length_of_Stay_Days
ORDER BY Length_of_Stay_Days;

SELECT
    COUNT(*) AS Above_15_Days
FROM Breast_Feeding_Rec
WHERE Length_of_Stay_Days > 15
  AND Length_of_Stay_Days <> 999;
  
  SELECT
    MIN(Length_of_Stay_Days) AS Minimum,
    MAX(Length_of_Stay_Days) AS Maximum,
    AVG(Length_of_Stay_Days) AS Average
FROM Breast_Feeding_Rec
WHERE Length_of_Stay_Days >= 0
  AND Length_of_Stay_Days <> 999;
  
  UPDATE Breast_Feeding_Rec
SET Length_of_Stay_Days = NULL
WHERE Length_of_Stay_Days IN (-5, 999);

SELECT
    AVG(Length_of_Stay_Days) AS Median_Length_of_Stay
FROM (
    SELECT
        Length_of_Stay_Days,
        ROW_NUMBER() OVER (ORDER BY Length_of_Stay_Days) AS rn,
        COUNT(*) OVER () AS total_rows
    FROM Breast_Feeding_Rec
    WHERE Length_of_Stay_Days IS NOT NULL
) AS x
WHERE rn IN (
    FLOOR((total_rows + 1) / 2),
    CEIL((total_rows + 1) / 2)
);

UPDATE Breast_Feeding_Rec
SET Length_of_Stay_Days = 7
WHERE Length_of_Stay_Days IS NULL;

SELECT*
FROM Breast_Feeding_Rec;

SELECT
    Currency,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Currency
ORDER BY Frequency DESC;

SELECT
    Currency,
    Total_Cost,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Currency, Total_Cost
ORDER BY Currency, Frequency DESC;

SELECT
    Total_Cost,
    Currency,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
WHERE
       (Currency = 'EUR' AND (
            Total_Cost LIKE '%$%'
            OR UPPER(Total_Cost) LIKE '%USD%'
       ))
    OR (Currency = 'USD' AND (
            UPPER(Total_Cost) LIKE '%EUR%'
            OR UPPER(Total_Cost) LIKE '%€%'
       ))
    OR (Currency = 'NGN' AND (
            UPPER(Total_Cost) LIKE '%USD%'
            OR UPPER(Total_Cost) LIKE '%EUR%'
            OR Total_Cost LIKE '%$%'
            OR Total_Cost LIKE '%€%'
       ))
GROUP BY Total_Cost, Currency
ORDER BY Currency, Frequency DESC;

SELECT 
    Currency,
    COUNT(*) AS Total_Rows,
    MIN(Total_Cost) AS Min_Cost,
    MAX(Total_Cost) AS Max_Cost
FROM Breast_Feeding_Rec
GROUP BY Currency;

SELECT 
    Currency,
    Total_Cost
FROM Breast_Feeding_Rec
WHERE Total_Cost LIKE '%-2,500%'
   OR Total_Cost LIKE '%99999999%'
   OR Total_Cost LIKE '%150,000,000%'
ORDER BY Currency;

SELECT 
    Currency,
    COUNT(*) AS Flagged_Rows
FROM Breast_Feeding_Rec
WHERE Total_Cost LIKE '%-2,500%'
   OR Total_Cost LIKE '%150,000,000%'
   OR Total_Cost LIKE '%99999999%'
GROUP BY Currency;

ALTER TABLE Breast_Feeding_Rec
ADD COLUMN Total_Cost_Clean DECIMAL(15,2);

SELECT 
    Total_Cost,
    Currency
FROM Breast_Feeding_Rec
WHERE Total_Cost LIKE '%,%'
   OR Total_Cost LIKE '%.%'
   OR Total_Cost LIKE '%$%'
   OR Total_Cost LIKE '%EUR%'
   OR Total_Cost LIKE '%NGN%'
   OR Total_Cost LIKE '%USD%'
LIMIT 30;

SELECT
    Total_Cost,
    Currency,

    CASE
        -- Remove currency text/symbols and spaces
        WHEN Total_Cost LIKE '%-%'
            THEN NULL

        -- European format: multiple periods + comma decimal
        WHEN Total_Cost REGEXP '[0-9]+\.[0-9]+\.[0-9]+,[0-9]{2}'
            THEN CAST(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(TRIM(Total_Cost), '$', ''),
                            'EUR', ''
                        ),
                        'NGN', ''
                    ),
                    'USD', ''
                ) AS DECIMAL(15,2)
            )

        ELSE NULL
    END AS Test_Value

FROM Breast_Feeding_Rec
WHERE Total_Cost IN (
    '$8,907,489.15',
    'EUR 7840,89',
    '$17.108.423,54',
    '9.966,97 EUR',
    '21.115,65',
    '8.047'
);

SELECT
    Total_Cost,
    Currency,

    CASE

        -- European format with multiple dots and comma decimal
        WHEN TRIM(Total_Cost) REGEXP '[0-9]+\\.[0-9]+\\.[0-9]+,[0-9]{2}'
        THEN CAST(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(TRIM(Total_Cost), '$', ''),
                            'EUR', ''
                        ),
                        'NGN', ''
                    ),
                    'USD', ''
                ),
                '.', ''
            ) AS DECIMAL(15,2)
        ) / 1

        -- European format with comma decimal
        WHEN TRIM(Total_Cost) REGEXP '[0-9]+,[0-9]{2}([^0-9]|$)'
        THEN CAST(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(TRIM(Total_Cost), '$', ''),
                            'EUR', ''
                        ),
                        'NGN', ''
                    ),
                    'USD', ''
                ),
                ',', '.'
            ) AS DECIMAL(15,2)
        )

        ELSE NULL

    END AS Test_Clean_Value

FROM breast_feeding_rec
WHERE Total_Cost IN (
    'EUR 7840,89',
    '$17.108.423,54',
    '9.966,97 EUR',
    '21.115,65',
    '8.047'
);

SELECT
    Total_Cost,

    TRIM(Total_Cost) AS Step_1,

    REPLACE(
        REPLACE(
            REPLACE(
                REPLACE(TRIM(Total_Cost), '$', ''),
                'EUR', ''
            ),
            'NGN', ''
        ),
        'USD', ''
    ) AS Step_2,

    REPLACE(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(TRIM(Total_Cost), '$', ''),
                    'EUR', ''
                ),
                'NGN', ''
            ),
            'USD', ''
        ),
        '.', ''
    ) AS Step_3

FROM breast_feeding_rec
WHERE Total_Cost IN (
    '$17.108.423,54',
    '9.966,97 EUR',
    '21.115,65'
);

SELECT
    Total_Cost,
    CAST(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(TRIM(Total_Cost), '$', ''),
                            'EUR', ''
                        ),
                        'NGN', ''
                    ),
                    'USD', ''
                ),
                '.', ''
            ),
            ',', '.'
        ) AS DECIMAL(15,2)
    ) AS Total_Cost_Clean_Test

FROM breast_feeding_rec
WHERE Total_Cost IN (
    '$17.108.423,54',
    '9.966,97 EUR',
    '21.115,65'
);

SELECT
    Total_Cost,
    CAST(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(TRIM(Total_Cost), '$', ''),
                        'EUR', ''
                    ),
                    'NGN', ''
                ),
                'USD', ''
            ),
            ',', ''
        ) AS DECIMAL(15,2)
    ) AS Total_Cost_Clean_Test

FROM breast_feeding_rec
WHERE Total_Cost IN (
    '$8,907,489.15',
    '4,700,859 NGN',
    'USD 17,526.04',
    '5074.57 USD',
    '7,849',
    '23,875',
    '11,727.07',
    '$897,55'
);

SELECT
    Total_Cost,
    Currency,

    CAST(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(TRIM(Total_Cost), '$', ''),
                            'EUR', ''
                        ),
                        'NGN', ''
                    ),
                    'USD', ''
                ),
                ',', '.'
            ),
            ' ', ''
        ) AS DECIMAL(15,2)
    ) AS Test_Value

FROM breast_feeding_rec
WHERE Total_Cost IN (
    '$897,55',
    '13321,75',
    '10894,93'
);

SET SQL_SAFE_UPDATES = 0;

UPDATE breast_feeding_rec
SET Total_Cost_Clean =
CASE

    -- Negative costs: treat as invalid
    WHEN TRIM(Total_Cost) REGEXP '^[-(]'
        THEN NULL

    -- European format with multiple periods and comma decimal
    WHEN TRIM(Total_Cost) REGEXP '[0-9]+\.[0-9]+\.[0-9]+,[0-9]{2}'
    THEN CAST(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(TRIM(Total_Cost), '$', ''),
                            'EUR', ''
                        ),
                        'NGN', ''
                    ),
                    'USD', ''
                ),
                '.', ''
            ),
            ',', '.'
        ) AS DECIMAL(15,2)
    )

    -- Comma used as decimal separator
    WHEN TRIM(Total_Cost) REGEXP '[0-9]+,[0-9]{2}$'
    THEN CAST(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(TRIM(Total_Cost), '$', ''),
                        'EUR', ''
                    ),
                    'NGN', ''
                ),
                'USD', ''
            ),
            ',', '.'
        ) AS DECIMAL(15,2)
    )

    -- Standard US format / plain numbers
    WHEN TRIM(Total_Cost) REGEXP '^[^,]*,[0-9]{3}(\.[0-9]+)?'
      OR TRIM(Total_Cost) REGEXP '^[0-9]+(\.[0-9]+)?$'
    THEN CAST(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(TRIM(Total_Cost), '$', ''),
                        'EUR', ''
                    ),
                    'NGN', ''
                ),
                'USD', ''
            ),
            ',', ''
        ) AS DECIMAL(15,2)
    )

    ELSE NULL

END;

SELECT*
FROM breast_feeding_rec;

SELECT Readmitted_30_Days,
COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Readmitted_30_Days
ORDER BY Frequency DESC;

ALTER TABLE breast_feeding_rec
ADD COLUMN Readmitted_30_Days_Clean VARCHAR(10);

UPDATE breast_feeding_rec
SET Readmitted_30_Days_Clean =
    CASE
        WHEN UPPER(TRIM(Readmitted_30_Days)) IN
             ('TRUE', 'Y', 'YES', 'POSITIVE', '1')
            THEN 'Yes'

        WHEN UPPER(TRIM(Readmitted_30_Days)) IN
             ('FALSE', 'N', 'NO', 'NEGATIVE', '0')
            THEN 'No'

        WHEN TRIM(Readmitted_30_Days) = ''
            OR Readmitted_30_Days IS NULL
            THEN 'Unknown'

        ELSE 'Unknown'
    END;
    
    SELECT*
    FROM breast_feeding_rec;
    
    SELECT Insurance_Type,
COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Insurance_Type
ORDER BY Frequency DESC;

SELECT
    SUM(Insurance_Type IS NULL) AS Null_Count,
    SUM(TRIM(Insurance_Type) = '') AS Blank_Count
FROM Breast_Feeding_Rec;

SELECT Insurance_Type, COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
WHERE Insurance_Type IS NOT NULL
GROUP BY Insurance_Type
ORDER BY Frequency DESC;

UPDATE Breast_Feeding_Rec
SET Insurance_Type = 'Unknown'
WHERE TRIM(Insurance_Type) = '';

SELECT*
FROM breast_feeding_rec;

 SELECT Hospital_ID,
COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Hospital_ID
ORDER BY Frequency DESC;

SELECT 
    COUNT(*) AS Total_Rows,
    COUNT(Hospital_ID) AS Non_Null,
    COUNT(DISTINCT Hospital_ID) AS Unique_Hospitals
FROM Breast_Feeding_Rec;

SELECT COUNT(*) AS Blank_Hospital_ID
FROM Breast_Feeding_Rec
WHERE TRIM(Hospital_ID) = '';

SELECT
    Breastfeeding_Status,
    Breastfeeding_Status_Duplicate,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Breastfeeding_Status, Breastfeeding_Status_Duplicate
ORDER BY Frequency DESC;

SELECT Breastfeeding_Status, COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Breastfeeding_Status
ORDER BY Frequency DESC;

ALTER TABLE Breast_Feeding_Rec
DROP COLUMN Breastfeeding_Status_Duplicate;

SELECT*
FROM breast_feeding_rec;

ALTER TABLE Breast_Feeding_Rec
DROP COLUMN Admission_Date,
DROP COLUMN Discharge_Date,
DROP COLUMN Total_Cost,
DROP COLUMN Currency,
DROP COLUMN Readmitted_30_Days;

SELECT*
FROM breast_feeding_rec;

SELECT Birth_Date, COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Birth_Date
ORDER BY Frequency DESC
LIMIT 50;

ALTER TABLE Breast_Feeding_Rec
ADD COLUMN Clean_Birth_Date DATE;

SELECT
    SUM(
        CASE
            WHEN CAST(SUBSTRING_INDEX(Birth_Date, '/', 1) AS UNSIGNED) > 12
            THEN 1 ELSE 0
        END
    ) AS Definitely_DD_MM,

    SUM(
        CASE
            WHEN CAST(SUBSTRING_INDEX(Birth_Date, '/', 2) AS UNSIGNED) > 12
            THEN 1 ELSE 0
        END
    ) AS Definitely_MM_DD,

    SUM(
        CASE
            WHEN CAST(SUBSTRING_INDEX(Birth_Date, '/', 1) AS UNSIGNED) <= 12
             AND CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(Birth_Date, '/', 2), '/', -1) AS UNSIGNED) <= 12
            THEN 1 ELSE 0
        END
    ) AS Ambiguous
    FROM breast_feeding_rec;
    
    SELECT Birth_Date, Admission_Date_Standardized
FROM Breast_Feeding_Rec
WHERE
    CAST(SUBSTRING_INDEX(Birth_Date, '/', 1) AS UNSIGNED) <= 12
    AND CAST(SUBSTRING_INDEX(Birth_Date, '/', 2) AS UNSIGNED) <= 12
LIMIT 100;

SELECT
    SUM(
        CASE
            WHEN CAST(SUBSTRING_INDEX(Birth_Date, '/', 1) AS UNSIGNED) <= 12
             AND CAST(SUBSTRING_INDEX(Birth_Date, '/', 2) AS UNSIGNED) <= 12
            THEN 1
            ELSE 0
        END
    ) AS Ambiguous_Dates,

    SUM(
        CASE
            WHEN STR_TO_DATE(Birth_Date, '%m/%d/%Y') > Admission_Date_Standardized
              OR STR_TO_DATE(Birth_Date, '%d/%m/%Y') > Admission_Date_Standardized
            THEN 1
            ELSE 0
        END
    ) AS Potentially_Invalid
    FROM breast_feeding_rec;
    
    SELECT Birth_Date, Admission_Date_Standardized
FROM Breast_Feeding_Rec
WHERE
    Admission_Date_Standardized IS NOT NULL
    AND (
        STR_TO_DATE(Birth_Date, '%m/%d/%Y') > Admission_Date_Standardized
        OR
        STR_TO_DATE(Birth_Date, '%d/%m/%Y') > Admission_Date_Standardized
    );

describe breast_feeding_rec;

SELECT
    Birth_Date,
    STR_TO_DATE(TRIM(Birth_Date), '%m/%d/%Y') AS Standardized_Date
FROM Breast_Feeding_Rec
WHERE Birth_Date LIKE '%/%/%'
  AND CAST(
      SUBSTRING_INDEX(
          SUBSTRING_INDEX(Birth_Date, '/', 2),
          '/',
          -1
      ) AS UNSIGNED
  ) > 12;
  
  UPDATE Breast_Feeding_Rec
SET Clean_Birth_Date =
    CASE
        -- Definitely DD/MM/YYYY
        WHEN Birth_Date LIKE '%/%/%'
             AND CAST(SUBSTRING_INDEX(Birth_Date, '/', 1) AS UNSIGNED) > 12
        THEN STR_TO_DATE(TRIM(Birth_Date), '%d/%m/%Y')

        -- Definitely MM/DD/YYYY
        WHEN Birth_Date LIKE '%/%/%'
             AND CAST(
                 SUBSTRING_INDEX(
                     SUBSTRING_INDEX(Birth_Date, '/', 2),
                     '/',
                     -1
                 ) AS UNSIGNED
             ) > 12
        THEN STR_TO_DATE(TRIM(Birth_Date), '%m/%d/%Y')

        ELSE NULL
    END;
    
    SELECT*
    FROM breast_feeding_rec;
    
    ALTER TABLE breast_feeding_rec
    DROP COLUMN Birth_Date;
    
--- Exploratory Data Analysis

--- Establish data structure and data cleaning

SELECT
COUNT(*) AS Total_Rows
FROM breast_feeding_rec;

--- Check Duplicates Record

SELECT
COUNT(*) AS Total_Rows,
COUNT(DISTINCT Mother_ID) AS Unique_Mother
FROM breast_feeding_rec;

SELECT
    Record_Count,
    COUNT(*) AS Number_of_Mothers
FROM (
    SELECT
        Mother_ID,
        COUNT(*) AS Record_Count
    FROM Breast_Feeding_Rec
    GROUP BY Mother_ID
) AS Mother_Records
GROUP BY Record_Count
ORDER BY Record_Count;

--- Check overall dataset profile

SELECT COUNT(*) AS Total_Rows
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
AND TABLE_NAME = 'Breast_Feeding_Rec';

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Breast_Feeding_Rec'
ORDER BY ORDINAL_POSITION;

SELECT*
FROM breast_feeding_rec;

SELECT
    Exclusive_Breastfeeding_Days,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Exclusive_Breastfeeding_Days
ORDER BY Frequency DESC;

SELECT
    Exclusive_Breastfeeding_Days,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
WHERE Exclusive_Breastfeeding_Days IN ('-1', '-10', '999')
GROUP BY Exclusive_Breastfeeding_Days;

SELECT
    COUNT(*) AS Total_Records,
    SUM(CASE WHEN Exclusive_Breastfeeding_Days IS NULL 
              OR TRIM(Exclusive_Breastfeeding_Days) = '' THEN 1 ELSE 0 END) AS Blank,
    SUM(CASE WHEN Exclusive_Breastfeeding_Days = '-1' THEN 1 ELSE 0 END) AS Negative_1,
    SUM(CASE WHEN Exclusive_Breastfeeding_Days = '-10' THEN 1 ELSE 0 END) AS Negative_10,
    SUM(CASE WHEN Exclusive_Breastfeeding_Days = '999' THEN 1 ELSE 0 END) AS Code_999
FROM Breast_Feeding_Rec;

SELECT
    MIN(CAST(Exclusive_Breastfeeding_Days AS UNSIGNED)) AS Min_Days,
    MAX(CAST(Exclusive_Breastfeeding_Days AS UNSIGNED)) AS Max_Days,
    AVG(CAST(Exclusive_Breastfeeding_Days AS UNSIGNED)) AS Mean_Days,
    COUNT(*) AS Valid_Records
FROM Breast_Feeding_Rec
WHERE Exclusive_Breastfeeding_Days NOT IN ('', '-1', '-10', '999')
  AND Exclusive_Breastfeeding_Days IS NOT NULL;
  
  SELECT
    COUNT(*) AS Total_Records,

    SUM(CASE WHEN Mother_ID IS NULL OR TRIM(Mother_ID) = '' THEN 1 ELSE 0 END) AS Mother_ID_Missing,

    SUM(CASE WHEN Infant_ID IS NULL OR TRIM(Infant_ID) = '' THEN 1 ELSE 0 END) AS Infant_ID_Missing,

    SUM(CASE WHEN Mother_Age IS NULL THEN 1 ELSE 0 END) AS Mother_Age_Missing,

    SUM(CASE WHEN Infant_Age_Days IS NULL THEN 1 ELSE 0 END) AS Infant_Age_Days_Missing,

    SUM(CASE WHEN Infant_Gender IS NULL OR TRIM(Infant_Gender) = '' THEN 1 ELSE 0 END) AS Infant_Gender_Missing

FROM Breast_Feeding_Rec;

SELECT
    COUNT(*) AS Total_Records,

    SUM(CASE WHEN Birth_Weight_kg IS NULL THEN 1 ELSE 0 END) AS Birth_Weight_Missing,

    SUM(CASE WHEN Breastfeeding_Status IS NULL OR TRIM(Breastfeeding_Status) = '' THEN 1 ELSE 0 END) AS Breastfeeding_Status_Missing,

    SUM(CASE WHEN Exclusive_Breastfeeding_Days IS NULL 
              OR TRIM(Exclusive_Breastfeeding_Days) = '' THEN 1 ELSE 0 END) AS Exclusive_Breastfeeding_Days_Missing,

    SUM(CASE WHEN Formula_Feeding IS NULL OR TRIM(Formula_Feeding) = '' THEN 1 ELSE 0 END) AS Formula_Feeding_Missing,

    SUM(CASE WHEN Complementary_Feeding IS NULL OR TRIM(Complementary_Feeding) = '' THEN 1 ELSE 0 END) AS Complementary_Feeding_Missing

FROM Breast_Feeding_Rec;

SELECT
    COUNT(*) AS Total_Records,

    SUM(CASE WHEN Primary_Infant_Diagnosis IS NULL 
              OR TRIM(Primary_Infant_Diagnosis) = '' THEN 1 ELSE 0 END) AS Diagnosis_Missing,

    SUM(CASE WHEN Maternal_Comorbidities IS NULL 
              OR TRIM(Maternal_Comorbidities) = '' THEN 1 ELSE 0 END) AS Comorbidities_Missing,

    SUM(CASE WHEN Department IS NULL 
              OR TRIM(Department) = '' THEN 1 ELSE 0 END) AS Department_Missing,

    SUM(CASE WHEN Length_of_Stay_Days IS NULL THEN 1 ELSE 0 END) AS Length_of_Stay_Missing,

    SUM(CASE WHEN Hospital_ID IS NULL 
              OR TRIM(Hospital_ID) = '' THEN 1 ELSE 0 END) AS Hospital_ID_Missing

FROM Breast_Feeding_Rec;

SELECT
    COUNT(*) AS Total_Records,

    SUM(CASE WHEN Insurance_Type IS NULL
              OR TRIM(Insurance_Type) = '' THEN 1 ELSE 0 END) AS Insurance_Missing,

    SUM(CASE WHEN Admission_Date_Standardized IS NULL THEN 1 ELSE 0 END) AS Admission_Date_Missing,

    SUM(CASE WHEN Discharge_Date_Standardized IS NULL THEN 1 ELSE 0 END) AS Discharge_Date_Missing,

    SUM(CASE WHEN Total_Cost_Clean IS NULL THEN 1 ELSE 0 END) AS Total_Cost_Missing,

    SUM(CASE WHEN Readmitted_30_Days_Clean IS NULL
              OR TRIM(Readmitted_30_Days_Clean) = '' THEN 1 ELSE 0 END) AS Readmission_Missing,

    SUM(CASE WHEN Clean_Birth_Date IS NULL THEN 1 ELSE 0 END) AS Birth_Date_Missing

FROM Breast_Feeding_Rec;

SELECT
    Hospital_ID,
    COUNT(*) AS Total_Records,
    SUM(CASE 
        WHEN Admission_Date_Standardized IS NULL THEN 1 
        ELSE 0 
    END) AS Missing_Admission_Date,
    ROUND(
        SUM(CASE 
            WHEN Admission_Date_Standardized IS NULL THEN 1 
            ELSE 0 
        END) * 100.0 / COUNT(*), 
        2
    ) AS Missing_Percentage
FROM Breast_Feeding_Rec
GROUP BY Hospital_ID
ORDER BY Missing_Percentage DESC;

SELECT Hospital_ID,
COUNT(*) AS Total_Records,
SUM(CASE WHEN Discharge_Date_Standardized IS NULL THEN 1 ELSE 0 END) AS Missing_Discharge_Date,
ROUND(SUM(CASE WHEN Discharge_Date_Standardized IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
2
) AS Missing_Percentage
FROM Breast_Feeding_Rec
GROUP BY Hospital_ID
ORDER BY Missing_Percentage DESC;

SELECT
    Hospital_ID,
    COUNT(*) AS Total_Records,
    SUM(
        CASE
            WHEN Clean_Birth_Date IS NULL THEN 1
            ELSE 0
        END
    ) AS Missing_Birth_Date,
    ROUND(
        SUM(
            CASE
                WHEN Clean_Birth_Date IS NULL THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS Missing_Percentage
FROM Breast_Feeding_Rec
GROUP BY Hospital_ID
ORDER BY Missing_Percentage DESC;

SELECT
    Hospital_ID,
    COUNT(*) AS Total_Records,
    SUM(
        CASE
            WHEN Total_Cost_Clean IS NULL THEN 1
            ELSE 0
        END
    ) AS Missing_Total_Cost,
    ROUND(
        SUM(
            CASE
                WHEN Total_Cost_Clean IS NULL THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS Missing_Percentage
FROM Breast_Feeding_Rec
GROUP BY Hospital_ID
ORDER BY Missing_Percentage DESC;

--- Demographic EDA

SELECT
    MIN(Mother_Age) AS Min_Age,
    MAX(Mother_Age) AS Max_Age,
    ROUND(AVG(Mother_Age), 2) AS Mean_Age,
    ROUND(STDDEV(Mother_Age), 2) AS Std_Dev,
    COUNT(DISTINCT Mother_Age) AS Unique_Ages
FROM Breast_Feeding_Rec;

SELECT
    Mother_Age,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Mother_Age
ORDER BY Mother_Age;

SELECT
    Mother_Age,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
WHERE Mother_Age IN (0, 12, 14, 60, 65, 99)
GROUP BY Mother_Age
ORDER BY Mother_Age;

SELECT
    Mother_Age,
    COUNT(*) AS Records,
    MIN(Infant_Age_Days) AS Min_Infant_Age_Days,
    MAX(Infant_Age_Days) AS Max_Infant_Age_Days,
    AVG(Birth_Weight_kg) AS Avg_Birth_Weight
FROM Breast_Feeding_Rec
WHERE Mother_Age IN (0, 12, 14, 60, 65, 99)
GROUP BY Mother_Age
ORDER BY Mother_Age;

SELECT
    Infant_Age_Days,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
WHERE Infant_Age_Days < 0
   OR Infant_Age_Days = 999
GROUP BY Infant_Age_Days
ORDER BY Infant_Age_Days;

SELECT
    MIN(Infant_Age_Days) AS Min_Valid_Age,
    MAX(Infant_Age_Days) AS Max_Valid_Age,
    ROUND(AVG(Infant_Age_Days), 2) AS Mean_Valid_Age,
    ROUND(STDDEV(Infant_Age_Days), 2) AS Std_Dev
FROM Breast_Feeding_Rec
WHERE Infant_Age_Days NOT IN (-5, -1, 999);

SELECT
    MIN(Mother_Age) AS Min_Valid_Age,
    MAX(Mother_Age) AS Max_Valid_Age,
    ROUND(AVG(Mother_Age), 2) AS Mean_Valid_Age,
    ROUND(STDDEV(Mother_Age), 2) AS Std_Dev
FROM Breast_Feeding_Rec
WHERE Mother_Age NOT IN (0, 99);

SELECT
    AVG(Mother_Age) AS Median_Mother_Age
FROM (
    SELECT
        Mother_Age,
        ROW_NUMBER() OVER (ORDER BY Mother_Age) AS rn,
        COUNT(*) OVER () AS total_count
    FROM Breast_Feeding_Rec
    WHERE Mother_Age NOT IN (0, 99)
) AS ranked
WHERE rn IN (
    FLOOR((total_count + 1) / 2),
    CEIL((total_count + 1) / 2)
);

SELECT
    Infant_Gender,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Infant_Gender
ORDER BY Frequency DESC;

SELECT
    COUNT(*) AS Total_Records,
    SUM(CASE WHEN Birth_Weight_kg IS NULL THEN 1 ELSE 0 END) AS Null_Count,
    MIN(Birth_Weight_kg) AS Min_Weight,
    MAX(Birth_Weight_kg) AS Max_Weight,
    ROUND(AVG(Birth_Weight_kg), 2) AS Mean_Weight,
    ROUND(STDDEV(Birth_Weight_kg), 2) AS Std_Dev
FROM Breast_Feeding_Rec;

SELECT
    Birth_Weight_kg,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Birth_Weight_kg
ORDER BY Birth_Weight_kg DESC;

SELECT
    Birth_Weight_kg,
    Hospital_ID,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
WHERE Birth_Weight_kg IN (0.4, 7.5, 7.8, 12.5, 99)
GROUP BY Birth_Weight_kg, Hospital_ID
ORDER BY Birth_Weight_kg, Frequency DESC;

SELECT
    MIN(Birth_Weight_kg) AS Min_Weight,
    MAX(Birth_Weight_kg) AS Max_Weight,
    ROUND(AVG(Birth_Weight_kg), 2) AS Mean_Weight,
    ROUND(STDDEV(Birth_Weight_kg), 2) AS Std_Dev
FROM Breast_Feeding_Rec
WHERE Birth_Weight_kg NOT IN (99, 12.5, 7.8, 7.5, 0.4);

SELECT
    COUNT(*) AS Total_Rows,
    SUM(
        CASE 
            WHEN Birth_Weight_kg IN (0.4, 7.5, 7.8, 12.5, 99)
            THEN 1 ELSE 0
        END
    ) AS Suspicious_Values
FROM Breast_Feeding_Rec;

SELECT
    Birth_Weight_kg,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
WHERE Birth_Weight_kg IN (0.4, 7.5, 7.8, 12.5, 99)
GROUP BY Birth_Weight_kg
ORDER BY Birth_Weight_kg;

SELECT
    Birth_Weight_kg,
    Infant_Age_Days,
    Infant_Gender,
    Mother_Age,
    Primary_Infant_Diagnosis,
    COUNT(*) AS Records
FROM Breast_Feeding_Rec
WHERE Birth_Weight_kg IN (0.4, 7.5, 7.8, 12.5, 99)
GROUP BY
    Birth_Weight_kg,
    Infant_Age_Days,
    Infant_Gender,
    Mother_Age,
    Primary_Infant_Diagnosis
ORDER BY Birth_Weight_kg;

SELECT Infant_Age_Days,
COUNT(*) AS Age_Days_Record
FROM breast_feeding_rec
WHERE Infant_Age_Days IN ( -1, -5)
GROUP BY Infant_Age_Days
ORDER BY Infant_Age_Days;

SET SQL_SAFE_UPDATES = 0;

UPDATE Breast_Feeding_Rec
SET Infant_Age_Days = NULL
WHERE Infant_Age_Days IN (-1, -5);

SELECT
    COUNT(*) AS Above_365_Days
FROM Breast_Feeding_Rec
WHERE Infant_Age_Days > 365;

SELECT
    Infant_Age_Days,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
WHERE Infant_Age_Days > 365
GROUP BY Infant_Age_Days
ORDER BY Infant_Age_Days;

SELECT
    COUNT(*) AS Total_Rows,
    SUM(CASE WHEN Infant_Age_Days IS NULL THEN 1 ELSE 0 END) AS Missing_Age_Days,
    MIN(Infant_Age_Days) AS Minimum_Age_Days,
    MAX(Infant_Age_Days) AS Maximum_Age_Days
FROM Breast_Feeding_Rec;

SELECT
    Infant_Age_Days,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
WHERE Infant_Age_Days < 0
   OR Infant_Age_Days > 365
GROUP BY Infant_Age_Days
ORDER BY Infant_Age_Days;

UPDATE Breast_Feeding_Rec
SET Infant_Age_Days = NULL
WHERE Infant_Age_Days > 365;

SELECT
    COUNT(*) AS Total_Rows,
    SUM(CASE WHEN Infant_Age_Days IS NULL THEN 1 ELSE 0 END) AS Missing_Age_Days,
    MIN(Infant_Age_Days) AS Minimum_Age_Days,
    MAX(Infant_Age_Days) AS Maximum_Age_Days
FROM Breast_Feeding_Rec;

SELECT
    MIN(Birth_Weight_Kg) AS Min_Weight,
    MAX(Birth_Weight_Kg) AS Max_Weight,
    AVG(Birth_Weight_Kg) AS Mean_Weight,
    COUNT(*) AS Total_Records,
    COUNT(Birth_Weight_Kg) AS Non_Null_Records
FROM Breast_Feeding_Rec;

SELECT
    Birth_Weight_Kg,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
WHERE Birth_Weight_Kg < 1
   OR Birth_Weight_Kg > 6
GROUP BY Birth_Weight_Kg
ORDER BY Birth_Weight_Kg;

SELECT
    Birth_Weight_Kg,
    MIN(Infant_Age_Days) AS Min_Age_Days,
    MAX(Infant_Age_Days) AS Max_Age_Days,
    AVG(Infant_Age_Days) AS Avg_Age_Days,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
WHERE Birth_Weight_Kg IN (0.4, 7.5, 7.8, 12.5, 99)
GROUP BY Birth_Weight_Kg
ORDER BY Birth_Weight_Kg;

SELECT
    Birth_Weight_Kg,
    Infant_Age_Days,
    Infant_Gender,
    Clean_Birth_Date
    Admission_Date
FROM Breast_Feeding_Rec
WHERE Birth_Weight_Kg IN (0.4, 7.5, 7.8, 12.5, 99)
ORDER BY Birth_Weight_Kg, Infant_Age_Days;

UPDATE Breast_Feeding_Rec
SET Birth_Weight_Kg = NULL
WHERE Birth_Weight_Kg > 6;

SELECT
    Birth_Weight_Kg,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Birth_Weight_Kg
ORDER BY Birth_Weight_Kg;

SELECT
    COUNT(*) AS Total_Rows,
    COUNT(Birth_Weight_Kg) AS Non_Null_Weights,
    SUM(CASE WHEN Birth_Weight_Kg IS NULL THEN 1 ELSE 0 END) AS Null_Weights,
    SUM(CASE WHEN Birth_Weight_Kg = 0.4 THEN 1 ELSE 0 END) AS Flagged_0_4
FROM Breast_Feeding_Rec;

SELECT*
FROM breast_feeding_rec;

SELECT
    Breastfeeding_Status,
    COUNT(*) AS Frequency,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Breast_Feeding_Rec),
        2
    ) AS Percentage
FROM Breast_Feeding_Rec
GROUP BY Breastfeeding_Status
ORDER BY Frequency DESC;

SELECT
    Breastfeeding_Status,
    COUNT(*) AS Frequency,
    ROUND(AVG(Infant_Age_Days), 1) AS Mean_Infant_Age_Days,
    MIN(Infant_Age_Days) AS Min_Age_Days,
    MAX(Infant_Age_Days) AS Max_Age_Days
FROM Breast_Feeding_Rec
GROUP BY Breastfeeding_Status
ORDER BY Frequency DESC;

SELECT
    Infant_Gender,
    COUNT(*) AS Frequency,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Breast_Feeding_Rec),
        2
    ) AS Percentage
FROM Breast_Feeding_Rec
GROUP BY Infant_Gender
ORDER BY Frequency DESC;

SELECT
    Infant_Gender,
    Breastfeeding_Status,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Infant_Gender, Breastfeeding_Status
ORDER BY Infant_Gender, Frequency DESC;

SELECT
    Infant_Gender,
    Breastfeeding_Status,
    COUNT(*) AS Frequency,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY Infant_Gender),
        2
    ) AS Percentage_Within_Gender
FROM Breast_Feeding_Rec
GROUP BY Infant_Gender, Breastfeeding_Status
ORDER BY Infant_Gender, Frequency DESC;

SELECT
    Exclusive_Breastfeeding_Days,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Exclusive_Breastfeeding_Days
ORDER BY Exclusive_Breastfeeding_Days;

SELECT
    COUNT(Exclusive_Breastfeeding_Days) AS Non_Null,
    MIN(Exclusive_Breastfeeding_Days) AS Minimum_Days,
    MAX(Exclusive_Breastfeeding_Days) AS Maximum_Days,
    ROUND(AVG(Exclusive_Breastfeeding_Days), 2) AS Mean_Days
FROM Breast_Feeding_Rec;

SELECT
    AVG(Exclusive_Breastfeeding_Days) AS Median_Days
FROM (
    SELECT
        Exclusive_Breastfeeding_Days,
        ROW_NUMBER() OVER (ORDER BY Exclusive_Breastfeeding_Days) AS rn,
        COUNT(*) OVER () AS total_count
    FROM Breast_Feeding_Rec
    WHERE Exclusive_Breastfeeding_Days IS NOT NULL
) AS x
WHERE rn IN (
    FLOOR((total_count + 1) / 2),
    CEIL((total_count + 1) / 2)
);

UPDATE Breast_Feeding_Rec
SET Exclusive_Breastfeeding_Days = NULL
WHERE Exclusive_Breastfeeding_Days > 365;

SELECT
    MIN(Exclusive_Breastfeeding_Days) AS Minimum_Days,
    MAX(Exclusive_Breastfeeding_Days) AS Maximum_Days,
    ROUND(AVG(Exclusive_Breastfeeding_Days), 2) AS Mean_Days,
    COUNT(Exclusive_Breastfeeding_Days) AS Non_Null
FROM Breast_Feeding_Rec;

SELECT
    Exclusive_Breastfeeding_Days,
    COUNT(*) AS Frequency
FROM Breast_Feeding_Rec
GROUP BY Exclusive_Breastfeeding_Days
ORDER BY Exclusive_Breastfeeding_Days DESC
LIMIT 20;

SELECT
    Exclusive_Breastfeeding_Days
FROM (
    SELECT
        Exclusive_Breastfeeding_Days,
        ROW_NUMBER() OVER (
            ORDER BY Exclusive_Breastfeeding_Days
        ) AS rn
    FROM Breast_Feeding_Rec
    WHERE Exclusive_Breastfeeding_Days IS NOT NULL
) AS ranked
WHERE rn = 2428;

SELECT
    ROUND(AVG(Exclusive_Breastfeeding_Days), 2) AS Mean_Exclusive_Days,
    ROUND(AVG(Infant_Age_Days), 2) AS Mean_Infant_Age_Days,
    MIN(Exclusive_Breastfeeding_Days) AS Min_Exclusive_Days,
    MAX(Exclusive_Breastfeeding_Days) AS Max_Exclusive_Days
FROM Breast_Feeding_Rec
WHERE Exclusive_Breastfeeding_Days IS NOT NULL
  AND Infant_Age_Days IS NOT NULL;
  
  SELECT
    CASE
        WHEN Infant_Age_Days BETWEEN 0 AND 29 THEN '0-29 days'
        WHEN Infant_Age_Days BETWEEN 30 AND 59 THEN '30-59 days'
        WHEN Infant_Age_Days BETWEEN 60 AND 89 THEN '60-89 days'
        WHEN Infant_Age_Days BETWEEN 90 AND 179 THEN '90-179 days'
        WHEN Infant_Age_Days BETWEEN 180 AND 269 THEN '180-269 days'
        WHEN Infant_Age_Days BETWEEN 270 AND 365 THEN '270-365 days'
        ELSE 'Unknown'
    END AS Age_Group,
    COUNT(*) AS Frequency,
    ROUND(AVG(Exclusive_Breastfeeding_Days), 2) AS Mean_Exclusive_Days
FROM Breast_Feeding_Rec
WHERE Exclusive_Breastfeeding_Days IS NOT NULL
GROUP BY Age_Group
ORDER BY
    CASE Age_Group
        WHEN '0-29 days' THEN 1
        WHEN '30-59 days' THEN 2
        WHEN '60-89 days' THEN 3
        WHEN '90-179 days' THEN 4
        WHEN '180-269 days' THEN 5
        WHEN '270-365 days' THEN 6
        ELSE 7
    END;
    
    SELECT
    Infant_Age_Days,
    Exclusive_Breastfeeding_Days,
    ROUND(
        Exclusive_Breastfeeding_Days * 100.0 / NULLIF(Infant_Age_Days, 0),
        2
    ) AS Exclusive_Breastfeeding_Percentage
FROM Breast_Feeding_Rec
WHERE Infant_Age_Days IS NOT NULL
  AND Exclusive_Breastfeeding_Days IS NOT NULL
  AND Infant_Age_Days > 0
LIMIT 20;

SELECT
    COUNT(*) AS Total_Records,
    SUM(
        CASE
            WHEN Exclusive_Breastfeeding_Days > Infant_Age_Days
            THEN 1
            ELSE 0
        END
    ) AS Duration_Greater_Than_Age
FROM Breast_Feeding_Rec
WHERE Infant_Age_Days IS NOT NULL
  AND Exclusive_Breastfeeding_Days IS NOT NULL
  AND Infant_Age_Days > 0;
  
  SELECT
    CASE
        WHEN Infant_Age_Days BETWEEN 1 AND 29 THEN '1-29 days'
        WHEN Infant_Age_Days BETWEEN 30 AND 59 THEN '30-59 days'
        WHEN Infant_Age_Days BETWEEN 60 AND 89 THEN '60-89 days'
        WHEN Infant_Age_Days BETWEEN 90 AND 179 THEN '90-179 days'
        WHEN Infant_Age_Days BETWEEN 180 AND 269 THEN '180-269 days'
        WHEN Infant_Age_Days BETWEEN 270 AND 365 THEN '270-365 days'
    END AS Age_Group,
    COUNT(*) AS Frequency,
    ROUND(
        AVG(
            Exclusive_Breastfeeding_Days * 100.0
            / NULLIF(Infant_Age_Days, 0)
        ),
        2
    ) AS Mean_Percentage_Exclusive
FROM Breast_Feeding_Rec
WHERE Infant_Age_Days > 0
  AND Infant_Age_Days <= 365
  AND Exclusive_Breastfeeding_Days IS NOT NULL
GROUP BY Age_Group
ORDER BY
    CASE Age_Group
        WHEN '1-29 days' THEN 1
        WHEN '30-59 days' THEN 2
        WHEN '60-89 days' THEN 3
        WHEN '90-179 days' THEN 4
        WHEN '180-269 days' THEN 5
        WHEN '270-365 days' THEN 6
    END;
    
    SELECT *
    FROM breast_feeding_rec;