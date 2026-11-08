-- 1. Compute the tenure (years of service) of each employee and update the Yrs_service field with the tenure (Tenure is computed by current date minus date hired).
UPDATE sporting_goods
SET Yrs_service = TIMESTAMPDIFF(YEAR, STR_TO_DATE(Date_hired, '%m/%d/%Y'), CURDATE());

/* 2. Generate initial password by concatenating the following:
- first 3 characters of last name, first 2 characters of first name, last 2 characters of city, and employee id
- Update the password field with the concatenated value */
UPDATE sporting_goods
SET Password = CONCAT(
    LEFT(`Last Name`, 3),
    LEFT(`First Name`, 2),
    RIGHT(City, 2),
    EmpID
);

-- 3. Display the concatenated first and last name (with space in the middle), city and the first quarter sale which has a value.
SELECT 
    CONCAT(`First Name`, ' ', `Last Name`) AS `Full Name`,
    City,
    Qtr1
FROM sporting_goods
WHERE Qtr1 IS NOT NULL AND Qtr1 > 0;

-- 4. Sum up the employee salary from each region except those coming from the states of New York (NY), California (CA), and Arkansas (AR). Display only the sums which are in the range of 100k to 200k.
SELECT 
    Region,
    SUM(Salary) AS Total_Salary
FROM sporting_goods
WHERE State NOT IN ('NY', 'CA', 'AR')
GROUP BY Region
HAVING SUM(Salary) BETWEEN 100000 AND 200000;

-- 5. Compute the average quarter 2 sales per region for all employees hired after 1995.
SELECT 
    Region,
    ROUND(AVG(Qtr2), 2) AS Avg_Qtr2_Sales
FROM sporting_goods
WHERE YEAR(STR_TO_DATE(Date_hired, '%m/%d/%Y')) > 1995
GROUP BY Region;