/*                            
																	
					                                  SQL Project Name: IceCream_Parlour Management System
							                             Trainee Name : Md. Abid Hasan Miad
								                            Trainee ID: 
							                                 Batch ID : PNTL-21

                                      --------------------------------------------------------------------------------------


            1) SECTION 01: INSERT DATA USING INSERT INTO KEYWORD

			2) SECTION 02 : INSERT DATA THROUGH VIEW 
				            UPDATE DATA THROUGH VIEW
				            DELETE DATA THROUGH VIEW
			
			2) SECTION 03: INSERT DATA THROUGH STORED PROCEDURE 
				           INSERT DATA THROUGH STORED PROCEDURE WITH AN OUTPUT PARAMETER
				           UPDATE THROUGH STORED PROCEDURE
				           DELETE DATA THROUGH STORED PROCEDURE	  
	                     
				            
			5) SECTION 04: FUNCTION
			               SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED)
			6) SECTION 05: TEST TRIGGER 
			               FOR/AFTER TRIGGER ON TABLE 
						   INSTEAD OF TRIGGER ON TABLE VIEW



			
*/






 /*
  **********************************   SELECTION 01  **************************************
                                     ---------------
  ------------------------  INSERT DATA USING INSERT INTO KEYWORD --------------------------
*/




-- Inserting data into the ShopOutlet table
INSERT INTO ShopOutlet (ShopName, ShopLocation, HotlineNumber, EmployeeNo, ShopLicence)
VALUES ('Sweet Creamery', 'Dhaka, Bangladesh', 01712345678, 50, 'ICECREAM001');

INSERT INTO ShopOutlet (ShopName, ShopLocation, HotlineNumber, EmployeeNo, ShopLicence)
VALUES ('Chill & Swirl', 'Chittagong, Bangladesh', 01812345678, 60, 'ICECREAM002');

INSERT INTO ShopOutlet (ShopName, ShopLocation, HotlineNumber, EmployeeNo, ShopLicence)
VALUES ('Frozen Delights', 'Sylhet, Bangladesh', 01912345678, 40, 'ICECREAM003');

INSERT INTO ShopOutlet (ShopName, ShopLocation, HotlineNumber, EmployeeNo, ShopLicence)
VALUES ('Sundae Oasis', 'Khulna, Bangladesh', 01512345678, 70, 'ICECREAM004');

INSERT INTO ShopOutlet (ShopName, ShopLocation, HotlineNumber, EmployeeNo, ShopLicence)
VALUES ('Frosty Delights', 'Rajshahi, Bangladesh', 01612345678, 45, 'ICECREAM005');

INSERT INTO ShopOutlet (ShopName, ShopLocation, HotlineNumber, EmployeeNo, ShopLicence)
VALUES ('Creamy Corner', 'Barisal, Bangladesh', 01912345679, 50, 'ICECREAM006');

INSERT INTO ShopOutlet (ShopName, ShopLocation, HotlineNumber, EmployeeNo, ShopLicence)
VALUES ('Gelato Heaven', 'Comilla, Bangladesh', 01812345680, 61, 'ICECREAM007');


GO

-- Insert data into the OwnerTable with foreign key relationships
INSERT INTO OwnerTable (ShareHolderName, Phone, Email, ShopID)
VALUES ('Rahim Rahman', '01712345678', 'rahim@email.com', 6);

INSERT INTO OwnerTable (ShareHolderName, Phone, Email, ShopID)
VALUES ('Rahim Rahman', '01712345678', 'rahim@email.com', 7);

INSERT INTO OwnerTable (ShareHolderName, Phone, Email, ShopID)
VALUES ('Rahim Rahman', '01712345678', 'rahim@email.com', 1);

INSERT INTO OwnerTable (ShareHolderName, Phone, Email, ShopID)
VALUES ('Ayesha Akhtar', '01812345678', 'ayesha@email.com', 2);

INSERT INTO OwnerTable (ShareHolderName, Phone, Email, ShopID)
VALUES ('Kamal Ahmed', '01912345678', 'kamal@email.com', 3);

INSERT INTO OwnerTable (ShareHolderName, Phone, Email, ShopID)
VALUES ('Nazia Nasrin', '01512345678', 'nazia@email.com', 4);

INSERT INTO OwnerTable (ShareHolderName, Phone, Email, ShopID)
VALUES ('Jamil Islam', '01612345678', 'jamil@email.com', 5);
GO


-- Insert data into the DepartmentTable
INSERT INTO DepartmentTable (Dep_Name)
VALUES ('Manager');
INSERT INTO DepartmentTable (Dep_Name)
VALUES ('Accounts');
INSERT INTO DepartmentTable (Dep_Name)
VALUES ('Marketing');
INSERT INTO DepartmentTable (Dep_Name)
VALUES ('Sales');
INSERT INTO DepartmentTable (Dep_Name)
VALUES ('IT');
INSERT INTO DepartmentTable (Dep_Name)
VALUES ('DelivaryMan');

GO

-- Insert data into the SalGrade table
INSERT INTO SalGrade (SalGarde, BasicSalary)
VALUES (1, 30000.00);
INSERT INTO SalGrade (SalGarde,BasicSalary)
VALUES (2, 45000.00);
INSERT INTO SalGrade (SalGarde, BasicSalary)
VALUES (3, 60000.00);
INSERT INTO SalGrade (SalGarde, BasicSalary)
VALUES (4, 75000.00);
INSERT INTO SalGrade (SalGarde, BasicSalary)
VALUES (5, 90000.00);

GO
-- Insert data into the EmployeeData table with proper foreign key references

INSERT INTO EmployeeData (Emp_Name, Phone, Gender, DateOfBirth, Email, Address, NID_NO, JoinDate, Religion, BloodGroup, Designation, SalaryGrade, DepartmentID)
VALUES ('Mehnaz Rahman', '01712345678', 'Female', '1990-05-15', 'mehnaz@email.com', 'Dhaka', 1234567890, '2000-01-15', 'Islam', 'O+', 'HR Manager', 3, 1131);

INSERT INTO EmployeeData (Emp_Name, Phone, Gender, DateOfBirth, Email, Address, NID_NO, JoinDate, Religion, BloodGroup, Designation, WorkingArea, SalaryGrade, DepartmentID)
VALUES ('Ali Khan', '01812345678', 'Male', '1985-08-20', 'ali@email.com', 'Chittagong', 9876543210, '2005-02-10', 'Islam', 'A-', 'Finance Analyst',1, 2, 1141);

INSERT INTO EmployeeData (Emp_Name, Phone, Gender, DateOfBirth, Email, Address, NID_NO, JoinDate, Religion, BloodGroup, Designation,WorkingArea, SalaryGrade, DepartmentID)
VALUES ('Alvi Khan', '01812345678', 'Male', '1985-08-20', 'alvi@email.com', 'Chittagong', 5476543210, '2005-12-11', 'Islam', 'AB-', 'DelivaryMan',1, 1, 1181);

INSERT INTO EmployeeData (Emp_Name, Phone, Gender, DateOfBirth, Email, Address, NID_NO, JoinDate, Religion, BloodGroup, Designation,WorkingArea, SalaryGrade, DepartmentID)
VALUES ('Sara Ahmed', '01912345678', 'Female', '1993-04-25', 'sara@email.com', 'Dhaka', 5555555555, '2010-07-05', 'Hindu', 'B+', 'Marketing Coordinator',3, 1, 1151);

INSERT INTO EmployeeData (Emp_Name, Phone, Gender, DateOfBirth, Email, Address, NID_NO, JoinDate, Religion, BloodGroup, Designation,WorkingArea, SalaryGrade, DepartmentID)
VALUES ('Rafiq Hasan', '01512345678', 'Male', '1987-11-12', 'rafiq@email.com', 'Sylhet', 9876541210, '2015-03-20', 'Islam', 'AB-', 'Sales Supervisor',2, 4, 1161);

INSERT INTO EmployeeData (Emp_Name, Phone, Gender, DateOfBirth, Email, Address, NID_NO, JoinDate, Religion, BloodGroup, Designation, SalaryGrade, DepartmentID)
VALUES ('Tasnim Akhtar', '01612345678', 'Female', '1998-06-30', 'tasnim@email.com', 'Dhaka', 1239867890, '2019-09-10', 'Islam', 'O-', 'IT Specialist', 5, 1171);

INSERT INTO EmployeeData (Emp_Name, Phone, Gender, DateOfBirth, Email, Address, NID_NO, JoinDate, Religion, BloodGroup, Designation, SalaryGrade, DepartmentID)
VALUES ('Aklima Akhtar', '01912345678', 'Female', '1999-09-20', 'aklima@email.com', 'Dhaka', 1298567899, '2019-09-01', 'Islam', 'O+', 'IT Specialist', 5, 1171);

GO
--Insert data into the  EmpWages

INSERT INTO EmpWages (EmployeeID, EmpEndWT, BasicSalary)
VALUES (524383, '2023-10-14 21:45:00', 3);
INSERT INTO EmpWages (EmployeeID, EmpEndWT, BasicSalary)
VALUES (524389, '2023-10-14 18:15:00', 5);
INSERT INTO EmpWages (EmployeeID, EmpEndWT, BasicSalary)
VALUES (524395, '2023-10-14 19:00:00', 5);
INSERT INTO EmpWages (EmployeeID, EmpEndWT, BasicSalary)
VALUES (524399, '2023-10-14 06:30:00', 2);
INSERT INTO EmpWages (EmployeeID, EmpEndWT, BasicSalary)
VALUES (524400, '2023-10-14 18:30:00', 1);
INSERT INTO EmpWages (EmployeeID, EmpEndWT, BasicSalary)
VALUES (524401, '2023-10-14 11:45:00', 1);
INSERT INTO EmpWages (EmployeeID, EmpEndWT, BasicSalary)
VALUES (524403, '2023-10-14 19:30:00', 4);



-- Insert data into the CUSTOMER_DATA table

INSERT INTO CUSTOMER_DATA (CustomerName, Phone, Gender, DateOfBirth, Email, Address, NID_NO)
VALUES ('Munirul Islam', '01712345678', 'Male', '1990-03-12', 'munirul@email.com', 'Dhaka', 1234567890);

INSERT INTO CUSTOMER_DATA (CustomerName, Phone, Gender, DateOfBirth, Email, Address, NID_NO)
VALUES ('Fahima Akhtar', '01812345678', 'Female', '1985-09-18', 'fahima@email.com', 'Chittagong', 1211543210);

INSERT INTO CUSTOMER_DATA (CustomerName, Phone, Gender, DateOfBirth, Email, Address, NID_NO)
VALUES ('Sakib Rahman', '01912345678', 'Male', '1995-07-25', 'sakib@email.com', 'Dhaka', 1212155555);

INSERT INTO CUSTOMER_DATA (CustomerName, Phone, Gender, DateOfBirth, Email, Address, NID_NO)
VALUES ('Rita Banu', '01512345678', 'Female', '1998-12-10', 'rita@email.com', 'Sylhet', 1111143210);

INSERT INTO CUSTOMER_DATA (CustomerName, Phone, Gender, DateOfBirth, Email, Address, NID_NO)
VALUES ('Kamal Ahmed', '01612345678', 'Male', '1987-05-30', 'kamal@email.com', 'Dhaka', 1234567891);

GO

-- Insert data into IceCreamMenu
INSERT INTO IceCreameMenu (IceCreamName, Flavour, Ingredient, QuantityInStock, Discount, RetailPrice)
VALUES
('Vanilla Ice Cream', 'Vanilla', 'Milk, Sugar', 50, 0.10, 2.99),
('Chocolate Ice Cream', 'Chocolate', 'Milk, Sugar, Cocoa', 45, 0.15, 3.49),
('Strawberry Ice Cream', 'Strawberry', 'Milk, Sugar, Strawberry', 40, 0.10, 3.29),
('Mint Chocolate Chip', 'Mint', 'Milk, Sugar, Chocolate Chips', 55, 0.10, 3.59),
('Butter Pecan Ice Cream', 'Butter Pecan', 'Milk, Sugar, Pecans', 30, 0.20, 3.79);
GO

-- Insert data into ShakeMenu
INSERT INTO ShakeMenu (ShakeName, Flavour, Ingredient, QuantityInStock, Discount, RetailPrice)
VALUES
('Vanilla Shake', 'Vanilla', 'Milk, Ice Cream, Sugar', 20, 0.10, 4.99),
('Chocolate Shake', 'Chocolate', 'Milk, Ice Cream, Cocoa', 18, 0.15, 5.49),
('Strawberry Shake', 'Strawberry', 'Milk, Ice Cream, Strawberry', 15, 0.10, 5.29),
('Oreo Shake', 'Oreo', 'Milk, Ice Cream, Oreo Cookies', 22, 0.10, 5.59),
('Banana Shake', 'Banana', 'Milk, Ice Cream, Banana', 25, 0.20, 5.79);
GO

-- Insert data into DrinksMenu
INSERT INTO DrinksMenu (DrinksName, Flavour, QuantityInStock, Discount, RetailPrice)
VALUES
('Coca-Cola', 'Regular', 100, 0.20, 1.99),
('Pepsi', 'Regular', 90, 0.15, 1.79),
('Sprite', 'Lemon-Lime', 80, 0.10, 1.89),
('Iced Tea', 'Unsweetened', 70, 0.10, 1.49),
('Lemonade', 'Regular', 60, 0.15, 1.69);


-- Insert data into StockTable
-- Used the ProductID values from IceCreamMenu, ShakeMenu, and DrinksMenu
INSERT INTO StockTable (ProductType, Quantity, TransactionType, TransactionDate, ProductID)
VALUES
('Ice Cream', 20, 'Purchase', '2023-10-13 10:00:00', 111), -- Use the IceCreamID for Vanilla Ice Cream
('Vanila Shake', 15, 'Purchase', '2023-10-13 10:30:00', 333), -- Use the ShakeID for Vanilla Shake
('Ice Cream', 10, 'Purchase', '2023-10-13 11:00:00', 114), -- Use the IceCreamID for Mint Chocolate Chip
('Drinks', 30, 'Purchase', '2023-10-13 11:30:00', 666), -- Use the DrinksID for Sprite
('Chocolat Shake', 8, 'Sale', '2023-10-13 12:00:00', 334), -- Use the ShakeID for Banana Shake
('Ice Cream', 5, 'Sale', '2023-10-13 12:30:00', 112), -- Use the IceCreamID for Chocolate Ice Cream
('Drinks', 15, 'Purchase', '2023-10-13 13:00:00', 667), -- Use the DrinksID for Coca-Cola
('Ice Cream', 12, 'Sale', '2023-10-13 13:30:00', 115), -- Use the IceCreamID for Butter Pecan Ice Cream
('Drinks', 10, 'Sale', '2023-10-13 14:00:00', 668), -- Use the DrinksID for Pepsi
('Oreo Shake', 6, 'Sale', '2023-10-13 14:30:00', 336); -- Use the ShakeID for Oreo Shake

GO

/*
  **********************************   SELECTION 02  **************************************
                                     ---------------
  -----------------------------------     VIEW        ------------------------------------------
*/
--Insert
INSERT INTO vw_CUSTOMER_DATA (CustomerName, Phone, Gender, DateOfBirth, Email, Address, NID_NO)
VALUES ('John Doe', '12345987098', 'Male', '1990-01-15', 'john@example.com', '123 Main St', 1234567990);

--Update
UPDATE vw_CUSTOMER_DATA
SET CustomerName = 'Jane Smith'
WHERE CusID = 102;

--Delete
DELETE FROM vw_CUSTOMER_DATA
WHERE CusID = 102;




 /*
  **********************************   SELECTION 03  **************************************
                                     ---------------
           ------------------------   STROED PROCEDURE --------------------------
*/

--Insert

EXEC spEmployee 'Safiq Hasan', '01712345678', 'Male', '1989-08-12', 'safiq@email.com', 'Dhaka', 1276541210, '2015-03-20', 'Islam', 'B-', 'Sales Supervisor',2, 4, 1161;
GO

---
EXEC InsertCustomerData
    @CustomerName = N'John Doe',
    @Phone = '1234567890',
    @Gender = 'Male',
    @DateOfBirth = '1990-01-15',
    @Email = 'johndoe@email.com',
    @Address = '123 Main St',
    @NID_NO = 1234567890;
GO

--Delete
EXEC sp 2;
GO

--Update
EXEC UpdatePrice 'Vanilla';
GO




 /*
  **********************************   SELECTION 04  **************************************
                                      ---------------
  -----------------------------------  FUNCTION  ------------------------------------------
*/
GO
--Test Function
GO
DECLARE @BasicSalary INT = 2000;
DECLARE @OvertimePayment DECIMAL(5, 2) = 150.50;
SELECT dbo.CalculateTotalSalary(@BasicSalary, @OvertimePayment) AS TotalSalary;
GO
-- Test the GetEmployeeSalariesInline function
SELECT *
FROM GetEmployeeSalariesInline();



 /*
  **********************************   SELECTION 05  **************************************
                                      ---------------
  -----------------------------------  TRIGGER   ------------------------------------------
*/

-- Insert customer orders

INSERT INTO CustomerOrders (CustomerID, ItemID, QuantityOrdered, OrderDate)
VALUES (1, 111, 3, GETDATE());

-- Order Shake
INSERT INTO CustomerOrders (CustomerID, ItemID, QuantityOrdered, OrderDate)
VALUES (2, 333, 2, GETDATE());

-- Order Drink
INSERT INTO CustomerOrders (CustomerID, ItemID, QuantityOrdered, OrderDate)
VALUES (3, 666, 5, GETDATE());

SELECT * FROM IceCreameMenu; --50

SELECT * FROM ShakeMenu; --20

SELECT * FROM DrinksMenu; --100


-- Insert data into IceCreameMenu
INSERT INTO IceCreameMenu (IceCreamName, Flavour, Ingredient, QuantityInStock, RetailPrice)
VALUES ('Vanilla Ice Cream', 'Vanilla', 'Milk, Sugar, Flavorings', 100, 5.99);

-- Insert data into ShakeMenu
INSERT INTO ShakeMenu (ShakeName, Flavour, Ingredient, QuantityInStock, RetailPrice)
VALUES ('Chocolate Shake', 'Chocolate', 'Milk, Chocolate Syrup', 50, 4.99);

-- Insert data into DrinksMenu
INSERT INTO DrinksMenu (DrinksName, Flavour, QuantityInStock, RetailPrice)
VALUES ('Cola', 'Cola', 200, 1.99);

-- Check the data in ItemMenu
SELECT * FROM ItemMenu;
