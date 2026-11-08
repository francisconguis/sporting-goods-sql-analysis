-- 1. Salesmen Last Names by Region (Alphabetical)
SELECT 
    Region,
    GROUP_CONCAT(`Last Name` ORDER BY `Last Name` ASC SEPARATOR ', ') AS `Salesmen Last Names`
FROM sporting_goods
GROUP BY Region
ORDER BY Region;

-- 2. Count of Salesmen Averaging 200k to 300k in Sales
SELECT 
    Region,
    COUNT(*) AS `Salesmen Count`
FROM sporting_goods
WHERE ((Qtr1 + Qtr2 + Qtr3) / 3) BETWEEN 200000 AND 300000
GROUP BY Region;

-- 3. Salesmen Details for 200k to 300k Sales Average
SELECT 
    CONCAT(`First Name`, ' ', `Last Name`) AS `Name`,
    Region,
    ROUND((Qtr1 + Qtr2 + Qtr3) / 3, 2) AS `Average Sales`
FROM sporting_goods
WHERE ((Qtr1 + Qtr2 + Qtr3) / 3) BETWEEN 200000 AND 300000
ORDER BY `Average Sales` DESC;

-- 4. Nominees with Qtr2 Sales Higher than Qtr1
SELECT 
    CONCAT(`First Name`, ' ', `Last Name`) AS `Salesman Name`,
    Qtr1,
    Qtr2,
    CASE 
        WHEN Qtr2 > Qtr1 THEN 'Nominee'
        ELSE ''
    END AS `Status`
FROM sporting_goods
WHERE Qtr2 > Qtr1;

-- 5. Salesmen with 25+ Years of Service and Formatted Total Sales SQL
SELECT 
    CONCAT(`First Name`, ' ', `Last Name`) AS `Salesman Name`,
    CONCAT('$', FORMAT(Qtr1 + Qtr2 + Qtr3, 2)) AS `Total Sales (Q1-Q3)`,
    TIMESTAMPDIFF(YEAR, STR_TO_DATE(Date_hired, '%m/%d/%Y'), CURDATE()) AS `Total Years`
FROM sporting_goods
WHERE TIMESTAMPDIFF(YEAR, STR_TO_DATE(Date_hired, '%m/%d/%Y'), CURDATE()) >= 25
ORDER BY `Total Years` DESC;

-- 6. Count of Salesmen per Region with Consistent Decreasing Sales (Q1 > Q2 > Q3)
SELECT 
    Region,
    COUNT(*) AS `Consistent Decreasing Count`
FROM sporting_goods
WHERE Qtr1 > Qtr2 AND Qtr2 > Qtr3
GROUP BY Region;

-- 7. Performance Remarks Based on Rules (7.1 to 7.6)
SELECT 
    CONCAT(`First Name`, ' ', `Last Name`) AS `Salesman Name`,
    ROUND((Qtr1 + Qtr2 + Qtr3) / 3, 2) AS `Average Sales`,
    CASE 
        WHEN ((Qtr1 + Qtr2 + Qtr3) / 3) >= 500000 
            THEN 'For promotion as regional head'
        WHEN ((Qtr1 + Qtr2 + Qtr3) / 3) >= 200000 AND ((Qtr1 + Qtr2 + Qtr3) / 3) < 500000 
            THEN 'For promotion as state head'
        WHEN Qtr1 < Qtr2 AND Qtr2 < Qtr3 
            THEN 'For 100% bonus'
        WHEN Qtr2 > Qtr1 AND Qtr3 < Qtr2 AND Qtr3 > Qtr1 
            THEN 'For 50% bonus'
        WHEN Qtr2 > Qtr1 AND Qtr3 < Qtr1 
            THEN 'For continued probation'
        WHEN Qtr1 > Qtr2 AND Qtr2 > Qtr3 
            THEN 'For contract termination'
        ELSE 'No Remark'
    END AS `Remark`
FROM sporting_goods;

-- 8. 10% Salary Adjustment (Hired Oct–Dec Starting Year 2005)
-- Disable safe updates for session
SET SQL_SAFE_UPDATES = 0;

-- Preview qualified records before updating
SELECT 
    EmpID,
    CONCAT(`First Name`, ' ', `Last Name`) AS `Name`,
    Date_hired,
    Salary AS `Current Salary`,
    ROUND(Salary * 1.10, 2) AS `Adjusted Salary`
FROM sporting_goods
WHERE YEAR(STR_TO_DATE(Date_hired, '%m/%d/%Y')) >= 2005
  AND MONTH(STR_TO_DATE(Date_hired, '%m/%d/%Y')) IN (10, 11, 12);

-- Perform the update
UPDATE sporting_goods
SET Salary = Salary * 1.10
WHERE YEAR(STR_TO_DATE(Date_hired, '%m/%d/%Y')) >= 2005
  AND MONTH(STR_TO_DATE(Date_hired, '%m/%d/%Y')) IN (10, 11, 12);

-- Re-enable safe updates
SET SQL_SAFE_UPDATES = 1;

-- 9. Count Hired Each Year from Each Region
SELECT 
    Region,
    YEAR(STR_TO_DATE(Date_hired, '%m/%d/%Y')) AS `Hire Year`,
    COUNT(*) AS `Hired Count`
FROM sporting_goods
GROUP BY Region, `Hire Year`
ORDER BY Region, `Hire Year`;