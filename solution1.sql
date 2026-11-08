-- 1. Compute Tenure (Yrs_service)
UPDATE sporting_goods
SET Yrs_service = TIMESTAMPDIFF(YEAR, STR_TO_DATE(Date_hired, '%m/%d/%Y'), CURDATE());

-- 2. Generate Initial Password
UPDATE sporting_goods
SET Password = CONCAT(
    LEFT(`Last Name`, 3),
    LEFT(`First Name`, 2),
    RIGHT(City, 2),
    EmpID
);

-- 3. Display Full Name, City, and Qtr1 Sale (Non-zero / Valid)
SELECT 
    CONCAT(`First Name`, ' ', `Last Name`) AS `Full Name`,
    City,
    Qtr1
FROM sporting_goods
WHERE Qtr1 IS NOT NULL AND Qtr1 > 0;

-- 4. Sum of Salaries per Region (Excluding NY, CA, AR; Range 100k–200k)
SELECT 
    Region,
    SUM(Salary) AS Total_Salary
FROM sporting_goods
WHERE State NOT IN ('NY', 'CA', 'AR')
GROUP BY Region
HAVING SUM(Salary) BETWEEN 100000 AND 200000;

-- 5. Average Quarter 2 Sales per Region (Hired After 1995)
SELECT 
    Region,
    ROUND(AVG(Qtr2), 2) AS Avg_Qtr2_Sales
FROM sporting_goods
WHERE YEAR(STR_TO_DATE(Date_hired, '%m/%d/%Y')) > 1995
GROUP BY Region;
