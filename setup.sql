-- create database: 
CREATE DATABASE "EmployeeComp2025";

-- connect to the database:
\c "EmployeeComp2025";

-- create the table for the employee data:
CREATE TABLE comp_2025(
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(100),
    DEPARTMENT VARCHAR(100),
    JOB_TITLE VARCHAR(100),
    TOTAL_CASH_COMPENSATION DECIMAL(15, 2),
    BASE_PAY DECIMAL(15, 2),
    OVERTIME DECIMAL(15, 2),
    SICK_VACATION_PAYOUTS DECIMAL(15, 2),
    OTHER_CASH_COMPENSATION DECIMAL(15, 2),
    MEDICAL_DENTAL_VISION DECIMAL(15, 2),
    RETIREMENT_CONTRIBUTION DECIMAL(15, 2),
    LONG_TERM_DISABILITY_LIFE_MEDICARE DECIMAL(15, 2),
    MISC_COSTS DECIMAL(15, 2) 
);

-- add data to table from csv:
COPY comp_2025(id, name, department, job_title, total_cash_compensation, base_pay, overtime, sick_vacation_payouts, other_cash_compensation, medical_dental_vision, retirement_contribution, long_term_disability_life_medicare, misc_costs)
FROM '/Desktop/SJ Employee Comp/Employee_Comp_2025_clean.csv'
DELIMITER ',' CSV HEADER;

-- check the data:
SELECT * FROM comp_2025;