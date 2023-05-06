Question 1
Check for the employee with a Doctorate degree with an age less than 40

SQL code:
SELECT *
FROM hr_employee
WHERE Age > 40 AND Education = 'Doctor';


Question 2
What is the count of employees by gender?

SQL code:
SELECT Gender,
       COUNT(*) AS gender_count
FROM hr_employee
GROUP BY Gender
ORDER BY gender_count DESC;


Question 3
How is the distribution of employee education across different departments?

SQL code:
SELECT Department,
       Education,
       COUNT(*) AS Count_of_Employees
FROM hr_employee
GROUP BY Department,
         Education
ORDER BY Department,
         Education DESC;
         

Question 4
What is the distribution of employee performance ratings across different departments?

SQL code:
SELECT Department,
       PerformanceRating,
       COUNT(*) AS Count_of_employees
FROM hr_employee
GROUP BY Department,
         PerformanceRating
ORDER BY Department,
         Count_of_employees DESC;
         

Question 5
What is the average monthly rate and income for each job role?

SQL code:
SELECT JobRole,
       ROUND(AVG(MonthlyRate), 2) AS avg_monthly_rate,
       ROUND(AVG(Monthlyincome), 2) AS avg_monthly_income
FROM hr_employee
GROUP BY JobRole
ORDER BY avg_monthly_income DESC;


Question 6
What is the average monthly rate and income for each job role in each department?

SQL code:
SELECT Department,
       JobRole,
       ROUND(AVG(MonthlyRate), 2) AS avg_monthly_rate,
       ROUND(AVG(Monthlyincome), 2) AS avg_monthly_income
FROM hr_employee
GROUP BY Department, 
         JobRole
ORDER BY Department, 
         avg_monthly_income DESC;
         

Question 7
What is the distribution of employee attrition across different age ranges?

SQL code:
SELECT CASE
       WHEN Age BETWEEN 18 AND 24 THEN '18-24'
       WHEN Age BETWEEN 25 AND 34 THEN '25-34'
       WHEN Age BETWEEN 35 AND 44 THEN '35-44'
       WHEN Age BETWEEN 45 AND 54 THEN '45-54'
       WHEN Age BETWEEN 55 AND 60 THEN '55-60'
       ELSE '60+'
       END AS age_range,
       Attrition,
       COUNT(*) AS count_of_employees
FROM hr_employee
GROUP BY age_range,
         Attrition
ORDER BY age_range;


Question 8
Give Environment Satisfaction distribution to the employees.

SQL code:
SSELECT EnvironmentSatisfaction, 
       COUNT(*) AS num_of_employees
FROM hr_employee
GROUP BY EnvironmentSatisfaction
ORDER BY EnvironmentSatisfaction IN('Medium','Satisfied', 'Highly Satisfied');


Question 9
Show the distribution of Job Satisfaction among the employees.

SQL code:
SELECT JobSatisfaction,
       num_of_employees,
       CONCAT(Round(100 * (num_of_employees / (SELECT COUNT(*) FROM hr_employee)), 2), "%") AS Percentage
FROM (SELECT JobSatisfaction,
      COUNT(*) AS num_of_employees
      FROM hr_employee
      GROUP BY JobSatisfaction
      ) AS job_satisfaction_count
GROUP BY JobSatisfaction
ORDER BY Percentage DESC;


Question 10
Show the distribution of work-life balance among the employees.

SQL code:
SELECT WorkLifeBalance,
       num_of_employees,
       CONCAT(Round(100 * (num_of_employees / (SELECT COUNT(*) FROM hr_employee)), 2), "%") AS Percentage
FROM (SELECT WorkLifeBalance,
      COUNT(*) AS num_of_employees
      FROM hr_employee
      GROUP BY WorkLifeBalance
      ) AS WorkLifeBalance_count
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance IN ('Good','Very-Good');


Question 11
Show only the count & percentage of involved and highly-involved employees.

SQL code:
SELECT JobInvolvement,
       num_of_employees,
       CONCAT(Round(100 * (num_of_employees / (SELECT COUNT(*) FROM hr_employee)), 2), "%") AS Percentage
FROM (SELECT JobInvolvement,
      COUNT(*) AS num_of_employees
      FROM hr_employee
      WHERE JobInvolvement IN ('Involved', 'Highly-Involved')
      GROUP BY JobInvolvement
      ) AS JobInvolvement_count
GROUP BY JobInvolvement
ORDER BY JobInvolvement

------------------------------------------------------ END -----------------------------------------------------------------------------------------------------
