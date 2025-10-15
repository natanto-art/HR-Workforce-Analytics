-- ============================================
-- SECTION 1: Workforce Composition
-- ============================================

DROP TABLE IF EXISTS workforce_composition_v2;

CREATE TABLE workforce_composition_v2 (
    JobRole VARCHAR(100) PRIMARY KEY,
    EmployeeCount INT
);

INSERT INTO workforce_composition_v2 (JobRole, EmployeeCount)
VALUES 
('Sales Executive', 342656),
('Research Scientist', 293018),
('Laboratory Technician', 258793),
('Healthcare Representative', 140797),
('Manufacturing Director', 114820),
('Manager (Human Resources)', 32218),
('Manager (Research & Development)', 32174),
('Manager (Sales)', 32163),
('Sales Representative', 86341),
('Research Director', 79183),
('Human Resources', 64289);

SELECT * FROM workforce_composition_v2
ORDER BY EmployeeCount DESC;

-- ============================================
-- SECTION 2: Compensation Summary
-- ============================================

DROP TABLE IF EXISTS compensation_summary_v3;

CREATE TABLE compensation_summary_v3 (
    JobRole VARCHAR(100) PRIMARY KEY,
    AvgMonthlyIncome DECIMAL(18,2)
);

INSERT INTO compensation_summary_v3 (JobRole, AvgMonthlyIncome)
VALUES
('Human Resources', 13292.00),
('Laboratory Technician', 14066.00),
('Manager (Human Resources)', 14441.00),
('Manager (Research & Development)', 15289.00),
('Manager (Sales)', 15129.00),
('Manufacturing Director', 14479.00),
('Research Director', 15081.00),
('Research Scientist', 13927.00),
('Sales Executive', 14471.00),
('Sales Representative', 14278.00);

SELECT * FROM compensation_summary_v3
ORDER BY AvgMonthlyIncome DESC;

-- ============================================
-- SECTION 3: Join Workforce + Compensation
-- ============================================

SELECT 
    w.JobRole,
    w.EmployeeCount,
    c.AvgMonthlyIncome
FROM workforce_composition_v2 w
LEFT JOIN compensation_summary_v3 c
    ON w.JobRole = c.JobRole
ORDER BY c.AvgMonthlyIncome DESC;
-- ============================================
-- SECTION 4: Age Demographics
-- ============================================

-- 1️⃣  Drop old table if it exists
DROP TABLE IF EXISTS age_demographics_v1;

-- 2️⃣  Create new table
CREATE TABLE age_demographics_v1 (
    JobRole VARCHAR(100) PRIMARY KEY,
    AvgAge DECIMAL(5,2)
);

-- 3️⃣  Insert real average ages by job role
INSERT INTO age_demographics_v1 (JobRole, AvgAge)
VALUES
('Human Resources', 35.00),
('Healthcare Representative', 39.00),
('Laboratory Technician', 34.00),
('Manager (Human Resources)', 38.00),
('Manager (Research & Development)', 38.00),
('Manager (Sales)', 38.00),
('Manufacturing Director', 38.00),
('Research Director', 44.00),
('Research Scientist', 34.00),
('Sales Executive', 36.00),
('Sales Representative', 30.00);

-- 4️⃣  View results
SELECT * FROM age_demographics_v1 ORDER BY AvgAge DESC;

-- 5️⃣  Combine Workforce + Compensation + Age
SELECT 
    w.JobRole,
    w.EmployeeCount,
    c.AvgMonthlyIncome,
    a.AvgAge
FROM workforce_composition_v2 w
LEFT JOIN compensation_summary_v3 c
    ON w.JobRole = c.JobRole
LEFT JOIN age_demographics_v1 a
    ON w.JobRole = a.JobRole
ORDER BY a.AvgAge DESC;
