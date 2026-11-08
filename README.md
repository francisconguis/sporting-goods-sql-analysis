# Sporting Goods Database Analysis & SQL Operations

This repository contains SQL solutions and data manipulation queries performed on the `Sporting_Goods` employee and regional sales dataset using MySQL.

## Dataset Structure
* **EmpID**: Employee ID
* **Last Name / First Name**: Employee details
* **Region / State / City**: Location classification
* **Qtr1 / Qtr2 / Qtr3**: Quarterly sales figures
* **Date_hired**: Date of onboarding
* **Salary**: Base compensation
* **Yrs_Service**: Calculated employee tenure
* **Password**: System-generated initial credential

## Tasks & Solutions
1. **Tenure Computation**: Dynamically calculated service years from `Date_hired` against current system date.
2. **Password Generation**: Automated string parsing concatenating substrings of employee names, cities, and ID numbers.
3. **Sales Reporting**: Filtered active first-quarter sales along with full names and branch cities.
4. **Targeted Regional Salary Rollup**: Aggregated regional payroll while filtering specific states and bounding total expenditure between $100k and $200k.
5. **Post-1995 Cohort Performance**: Analyzed average Q2 sales per region for staff onboarded after 1995.
