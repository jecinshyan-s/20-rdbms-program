create database jecin;
USE jecin;

CREATE TABLE IF NOT EXISTS Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Salary DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS Employee_Message (
    Message VARCHAR(255)
);

DROP TRIGGER IF EXISTS after_employee_insert;

DELIMITER //

CREATE TRIGGER after_employee_insert
AFTER INSERT ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO Employee_Message (Message)
    VALUES ('New employee record inserted successfully');
END //

DELIMITER ;

INSERT INTO Employee
VALUES (101, 'Karthik', 25000);

SELECT * FROM Employee_Message;
