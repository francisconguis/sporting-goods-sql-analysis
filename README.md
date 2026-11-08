# Sporting Goods Database Analysis & SQL Operations

This repository contains SQL solutions and data manipulation queries performed on the `Sporting_Goods` employee and regional sales dataset using MySQL.

## Repository Structure
- `Sporting_Goods.csv` - Raw employee records and quarterly sales dataset
- `01_employee_tenure_and_regional_payroll.sql` - Complete implementation script for Task 1 (Questions 1–5)
- `02_sales_performance_and_tier_appraisal.sql` - Complete implementation script for Task 2 (Questions 1–9)

## Dataset Structure
- **EmpID**: Employee ID
- **Last Name / First Name**: Employee details
- **Region / State / City**: Location classification
- **Qtr1 / Qtr2 / Qtr3**: Quarterly sales figures
- **Date_hired**: Date of onboarding
- **Salary**: Base compensation
- **Yrs_Service**: Calculated employee tenure
- **Password**: System-generated initial credential

---

## Task 1
1. Compute the tenure (years of service) of each employee and update the Yrs_service field with the tenure (Tenure is computed by current date minus date hired).
2. Generate initial password by concatenating the following:
   - first 3 characters of last name, first 2 characters of first name, last 2 characters of city, and employee id
   - Update the password field with the concatenated value
3. Display the concatenated first and last name (with space in the middle), city and the first quarter sale which has a value.
4. Sum up the employee salary from each region except those coming from the states of New York (NY), California (CA), and Arkansas (AR). Display only the sums which are in the range of 100k to 200k.
5. Compute the average quarter 2 sales per region for all employees hired after 1995.

### Solution Overview (`01_employee_tenure_and_regional_payroll.sql`)
1. **Tenure Computation**: Dynamically calculated service years from `Date_hired` against current system date.
2. **Password Generation**: Automated string parsing concatenating substrings of employee names, cities, and ID numbers.
3. **Sales Reporting**: Filtered active first-quarter sales along with full names and branch cities.
4. **Targeted Regional Salary Rollup**: Aggregated regional payroll while filtering specific states and bounding total expenditure between $100k and $200k.
5. **Post-1995 Cohort Performance**: Analyzed average Q2 sales per region for staff onboarded after 1995.

---

## Task 2
1. Display the region and the lastnames of the salesmen in each region. Output the salemen’ last name side by side with the region. There should be 4 output rows on the basis of the 4 regions. Write the names in alphabetical order
2. Count how many salesmen from each region averaged between 200k to 300k in sales
3. Display the name, region and average sales of those who averaged between 200k to 300k in sales
4. For those who have a qtr2 sales higher than qtr1 sales, write ‘Nominee’ beside the concatenated name of the salesman (firstname, lastname)
5. Display the concatenated name of salesmen with the sum of their q1, q2, q3 sales (formatted) and their total years with the company. Include in the selection only those who had been with the company for 25 yrs and above.
6. Count how many salesmen per region have consistent decreasing sales from q1 to q3
7. Write the concatenated name of the salesman (firstname, lastname) and a remark beside it, the remark depending on the following conditions:
   - 7.1 For those with average sales of 500k and above, write ‘For promotion as regional head’.
   - 7.2 For those with average sales of 200k to 499k, write ‘For promotion as state head’.
   - 7.3 For those who have consistent increasing sales from q1 to q3 sales, write ‘For 100% bonus’.
   - 7.4 For those who has q2 higher than q1 but q3 lower than q2 and higher than q1, write ‘For 50% bonus’.
   - 7.5 For those who has q2 higher than q1 but q3 lower than q1, write ‘For continued probation’.
   - 7.6 For consistent decreasing sales, ‘For contract termination’.
8. Identify those who where hired from Oct to Dec starting year 2005 and adjust their salary by 10% (increase of 10% to their current salary).
9. Count how many were hired each year from each region.

### Solution Overview (`02_sales_performance_and_tier_appraisal.sql`)
1. **Regional Salesmen Aggregation**: Grouped and alphabetized sales personnel surnames side-by-side per geographic region using `GROUP_CONCAT`.
2. **Mid-Tier Sales Performance Headcount**: Quantified regional personnel achieving average quarterly sales between $200k and $300k.
3. **Mid-Tier Sales Distribution Profiling**: Extracted names, territorial assignments, and computed average sales for representatives within the $200k to $300k range.
4. **Quarter-over-Quarter Growth Candidacy**: Flagged performance nominees displaying positive quarter-over-quarter momentum from Q1 to Q2.
5. **Senior Tenured Performance Audit**: Aggregated cumulative multi-quarter revenue with currency formatting for personnel with 25 or more years of service.
6. **Consistent Downward Trend Analysis**: Evaluated consecutive quarterly contractions (Q1 > Q2 > Q3) to identify regional attrition risks.
7. **Multi-Tier Performance Appraisal & Action Routing**: Formulated a conditional multi-tier evaluation system mapping average volume and trend trajectories to promotion, bonus
