-- get all employee data:
SELECT * FROM comp_2025;

-- questions i want to ask:

-- what's the average base pay/salary?
SELECT 
    department, 
    AVG(base_pay), 
    AVG(total_cash_compensation) F
ROM comp_2025
GROUP BY department
ORDER BY AVG (base_pay) DESC;

-- min/max salary by department?
SELECT 
    department, 
    MIN(total_cash_compensation), 
    MAX(total_cash_compensation) 
FROM comp_2025
GROUP BY department
ORDER BY MIN (total_cash_compensation) DESC;

-- 10 highest overtime jobs?
SELECT 
    job_title, 
    MAX(overtime) AS max_overtime
FROM comp_2025
GROUP BY job_title
ORDER BY max_overtime DESC
LIMIT 10;

-- count employees by department
SELECT 
    department, 
    COUNT(*) 
FROM comp_2025
GROUP BY department
ORDER BY COUNT(*) DESC;

-- which department are the most expensive
SELECT 
    department, 
    SUM(total_cash_compensation) 
FROM comp_2025
GROUP BY department
ORDER BY SUM(total_cash_compensation) DESC;

-- taking into account headcount
SELECT 
    department, COUNT(*) AS headcount,
    SUM(total_cash_compensation) AS total_cost, AVG(total_cash_compensation) AS avg_cost_per_employee
FROM comp_2025
GROUP BY department
ORDER BY total_cost DESC;

-- rank departments based on cost
SELECT 
    department,
    SUM(total_cash_compensation) AS total_cost,
    RANK() OVER (ORDER BY SUM(total_cash_compensation) DESC) AS cost_rank
FROM comp_2025
GROUP BY department;

-- which departments rely the most on overtime?
SELECT
    department,
    AVG(overtime + other_cash_compensation) AS total_extra_pay
FROM comp_2025
GROUP BY department
ORDER BY total_extra_pay DESC;

-- top 10% of earners by department
SELECT *
FROM comp_2025
WHERE total_cash_compensation >= (
    SELECT PERCENTILE_CONT(0.9)
    WITHIN GROUP (ORDER BY total_cash_compensation)
    FROM comp_2025
);

-- overtime as % of total compensation
SELECT
    name,
    department,
    job_title,
    overtime,
    total_cash_compensation,
    (overtime /total_cash_compensation) * 100 AS overtime_percentage
FROM comp_2025
WHERE total_cash_compensation > 0 AND overtime > 0 
ORDER BY overtime_percentage DESC;