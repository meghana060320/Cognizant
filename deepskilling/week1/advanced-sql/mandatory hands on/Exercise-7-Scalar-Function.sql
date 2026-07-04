-- ==========================================
-- Exercise 7 : Scalar Function
-- ==========================================

CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees VALUES
(1,'John','Doe',5000),
(2,'Jane','Smith',6000),
(3,'Michael','Johnson',7000),
(4,'Emily','Davis',5500);

-- Scalar Function

CREATE FUNCTION fn_CalculateAnnualSalary
(
    @Salary DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN

    RETURN @Salary * 12;

END;
GO

-- Execute Function

SELECT
    EmployeeID,
    FirstName,
    Salary,
    dbo.fn_CalculateAnnualSalary(Salary)
        AS AnnualSalary
FROM Employees;