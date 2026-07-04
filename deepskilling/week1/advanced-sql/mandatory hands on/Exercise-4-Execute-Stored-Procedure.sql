-- ==========================================
-- Exercise 4 : Execute Stored Procedure
-- ==========================================

CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2)
);

INSERT INTO Employees VALUES
(1,'John','Doe',1,5000),
(2,'Jane','Smith',2,6000),
(3,'Michael','Johnson',1,7000),
(4,'Emily','Davis',3,5500);

-- Create Procedure

CREATE PROCEDURE sp_GetEmployeesByDepartment
(
    @DepartmentID INT
)
AS
BEGIN

    SELECT *
    FROM Employees
    WHERE DepartmentID = @DepartmentID;

END;
GO

-- Execute Procedure

EXEC sp_GetEmployeesByDepartment 1;