/*
					                             SQL Project Name: IceCream_Parlour Management System
						                        	Trainee Name : Md. Abid Hasan Miad
								                       Trainee ID: 
							                            Batch ID : PNTL-21

--------------------------------------------------------------------------------------

Table of Contents: DDL
				1) SELECTION 01: Created a Database
				2) SELECTION 02: Created Appropriate Tables with column definition related to the project
				3) SELECTION 03: ALTER, DROP AND MODIFY TABLES & COLUMNS
				4) SELECTION 04: CREATE CLUSTERED AND NONCLUSTERED INDEX
				5) SELECTION 05: CREATE SEQUENCE & ALTER SEQUENCE
				6) SELECTION 06: CREATE A VIEW & ALTER VIEW
				7) SELECTION 07: CREATE STORED PROCEDURE & ALTER STORED PROCEDURE 
				8) SELECTION 08: CREATE FUNCTION(SCALAR, SIMPLE TALBLE TABLE VALUED, MULTISTATEMENT TABLE VALUED) & ALTER FUNCTION 
				9) SELECTION 09: CREATE TRIGGER (FOR/AFTER TRIGGER)
			   10) SELECTION 10: CREATE TRIGGER (INSTEAD OF TRIGGER)
*/



/*
  **********************************   SECTION 01  **************************************
                                     ---------------
  ------------ CHECK DATABASE EXISTANCE & CREATE DATABASE WITH ATTRIBUTED ---------------
*/

   


--01: Created a Database

USE master 
GO
IF DB_ID('IceCream_Parlour_ManagementSystem') IS NOT NULL
DROP DATABASE IceCream_Parlour_ManagementSystem
GO
-->
CREATE DATABASE IceCream_Parlour_ManagementSystem
ON
(
  NAME = 'IceCreamParlour_MDF',
  FILENAME = 'D:\Skill 90\Database\Project\IceCreamParlour_MDF.mdf',
  SIZE= 20MB,
  MAXSIZE = 80MB,
  FILEGROWTH =5%
)
LOG ON
(
  NAME = 'IceCreamParlour_LDF',
  FILENAME = 'D:\Skill 90\Database\Project\IceCreamParlour_LDF.ldf',
  SIZE= 20MB,
  MAXSIZE = 80MB,
  FILEGROWTH =5%
)
GO
USE IceCream_Parlour_ManagementSystem;
GO
EXEC sp_helpdb 'IceCream_Parlour_ManagementSystem';


   
/*
  **********************************   SECTION 02  **************************************
                                     ---------------
  ------ Created Appropriate Tables with column definition related to the project -------
*/

 --Table Contains with Primary Key, Foreign Key, Identity, Constraint, Unique Identifier.



  CREATE TABLE ShopOutlet
  (
    ShopID int primary key identity(001,1),
	ShopName varchar(50),
	ShopLocation varchar(80),
	HotlineNumber int,
	EmployeeNo smallint ,
	ShopLicence char(18)
  )
  GO
  SELECT * FROM ShopOutlet;

  CREATE TABLE OwnerTable
  (
    ShareHolderName varchar(50),
	Sh_Id int primary key identity(1,1),
	Phone char(11),
	Email varchar(40),
	ShopID int REFERENCES ShopOutlet(ShopID)
   )
   GO
  Select * from OwnerTable

  CREATE TABLE DepartmentTable
  (
    Dep_ID int primary key identity(1131,10),
	Dep_Name VARCHAR(50) NOT NULL
  )
 GO
 select * from  DepartmentTable
   
  CREATE TABLE SalGrade
  ( 
    SalGarde int primary key,
	SalAmount money,
	--BasicSalary
  )
  GO
  SELECT * FROM SalGrade

  GO
  --DROP TABLE EmployeeData
  CREATE TABLE EmployeeData
  (
    Emp_ID INT PRIMARY KEY IDENTITY(524376,1),
    Emp_Name VARCHAR(40) NOT NULL,
	Phone VARCHAR(11) NOT NULL,
	Gender VARCHAR(4) NOT NULL,
	DateOfBirth DATE,
	Email VARCHAR(20) NOT NULL UNIQUE CONSTRAINT ck_emailCheck CHECK (Email LIKE '%@%'),
	Address  VARCHAR(40) NOT NULL,
	NID_NO INT UNIQUE NOT NULL CHECK(NID_NO LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'), 
	JoinDate date NOT NULL, 
	Religion Varchar(20) NOT NULL,
	BloodGroup VARCHAR(3) NOT NULL ,
	Designation VARCHAR(40),
	WorkingArea int REFERENCES ShopOutlet(ShopID),
	SalaryGrade int REFERENCES SalGrade(SalGarde) ,
	DepartmentID int REFERENCES DepartmentTable(Dep_ID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
  )
  GO

CREATE TABLE EmpWages
(
  WagesID INT IDENTITY(1,1) PRIMARY KEY,
  EmployeeID INT REFERENCES EmployeeData(Emp_ID),
  EmpStartWT DATETIME DEFAULT GETDATE(),
  EmpEndWT DATETIME,
  TotalWorkingHours AS DATEDIFF(HOUR, EmpStartWT, EmpEndWT),
  OvertimeHours AS CASE WHEN DATEDIFF(HOUR, EmpStartWT, EmpEndWT) > 8 THEN DATEDIFF(HOUR, EmpStartWT, EmpEndWT) - 8 ELSE 0 END,
  BasicSalary INT REFERENCES SalGrade(SalGarde),
  HourlyPaymentOT decimal(5,2) default 130.00,
  --OvertimePayment as OvertimeHours*HourlyPaymentOT
);
GO

CREATE TABLE CUSTOMER_DATA
(
  CusID INT PRIMARY KEY IDENTITY(101,1),
  CustomerName NVARCHAR(40),
  Phone VARCHAR(11) NOT NULL,
  Gender VARCHAR(4) NOT NULL,
  DateOfBirth DATE,
  Email VARCHAR(20) NOT NULL UNIQUE CONSTRAINT ck_emailCheckcustomer CHECK (Email LIKE '%@%'),
  Address  VARCHAR(40) NOT NULL,
  NID_NO INT UNIQUE NOT NULL CHECK(NID_NO LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')  
) 
GO 
CREATE TABLE IceCreameMenu
(
  IceCreamID INT PRIMARY KEY IDENTITY(111,1) ,
  IceCreamName VARCHAR(60) NOT NULL,
  Flavour VARCHAR(50)NOT NULL,
  Ingredient VARCHAR(60),
  QuantityInStock INT NOT NULL,
  Discount DECIMAL(4,2) DEFAULT 0.00,
  RetailPrice MONEY  CHECK(RetailPrice>0),
  --DiscountedPrice as  RetailPrice*(1-Discount)
)
GO

CREATE TABLE ShakeMenu
(
  ShakeID INT PRIMARY KEY IDENTITY(333,1) ,
  ShakeName VARCHAR(60) NOT NULL,
  Flavour VARCHAR(50)NOT NULL,
  Ingredient VARCHAR(60),
  QuantityInStock INT NOT NULL,
  Discount DECIMAL(4,2) DEFAULT 0.00,
  RetailPrice MONEY  CHECK(RetailPrice>0)

)
GO
CREATE TABLE DrinksMenu
(
  DrinksID INT PRIMARY KEY IDENTITY(666,1) ,
  DrinksName VARCHAR(60) NOT NULL,
  Flavour VARCHAR(50)NOT NULL,
  QuantityInStock INT NOT NULL,
  Discount DECIMAL(4,2) DEFAULT 0.00,
  RetailPrice MONEY  CHECK(RetailPrice>0)

)
GO
CREATE TABLE StockTable
(
  StrockID int  PRIMARY KEY IDENTITY,
  ProductType VARCHAR(50) NOT NULL, 
  Quantity INT NOT NULL,
  TransactionType VARCHAR(10) NOT NULL, 
  TransactionDate DATETIME NOT NULL,
  ProductID INT not null
  CONSTRAINT FK_Stock_ProductIce FOREIGN KEY (ProductID) REFERENCES IceCreameMenu (IceCreamID),
  CONSTRAINT FK_Stock_ProductShake FOREIGN KEY (ProductID) REFERENCES ShakeMenu (ShakeID),
  CONSTRAINT FK_Stock_ProductDrinks FOREIGN KEY (ProductID) REFERENCES DrinksMenu (DrinksID)
);
GO
SELECT * FROM  StockTable
CREATE TABLE ItemMenu
( 
  MenuID INT PRIMARY KEY IDENTITY,
  ItemID INT NOT NULL UNIQUE,
  Rating CHAR(20) CHECK (Rating LIKE '[0-5]-Star' ),
  CONSTRAINT FK_ProductIce FOREIGN KEY ( ItemID ) REFERENCES IceCreameMenu (IceCreamID),
  CONSTRAINT FK_ProductShake FOREIGN KEY ( ItemID) REFERENCES ShakeMenu (ShakeID),
  CONSTRAINT FK_ProductDrinks FOREIGN KEY (ItemID) REFERENCES DrinksMenu (DrinksID)
  ON DELETE CASCADE
  ON UPDATE CASCADE
)
GO
SELECT * FROM ItemMenu;
GO
CREATE TABLE ItemMenu
(
  ItemID INT PRIMARY KEY IDENTITY(1,1),
  ItemType VARCHAR(50) NOT NULL,
  ItemName VARCHAR(60) NOT NULL,
  ItemDescription VARCHAR(100),
  QuantityInStock INT NOT NULL,
  RetailPrice MONEY CHECK(RetailPrice > 0),
);
GO

CREATE TABLE OrderData
( 
  OrderID INT PRIMARY KEY IDENTITY,
  CusID INT REFERENCES  CUSTOMER_DATA(CusID),
  PurchedBranch  INT REFERENCE ShopOutlet(ShopID),
  ServiceProvider INT REFERENCES EmployeeData(Emp_ID),
  ItemID INT REFERENCES ItemMenu(ItemID),
  Quantity INT,
  PaymentOption VARCHAR(50),
  CardNumber  UNIQUEIDENTIFIER NOT NULL,
  ON DELETE CASCADE
  ON UPDATE CASCADE
)

SELECT * FROM OrderData;
GO
CREATE TABLE CustomerOrders
(
  OrderID INT PRIMARY KEY IDENTITY,
  CustomerID INT NOT NULL,
  ItemID INT NOT NULL,
  QuantityOrdered INT NOT NULL,
  OrderDate DATETIME NOT NULL,
);
GO

/*
  **********************************   SECTION 03  **************************************
                                     ---------------
  ------------------------ ALTER, DROP AND MODIFY TABLLE & COLUMNS ------------------------
*/
--ALTER ADD Computed COLUMN
ALTER TABLE IceCreameMenu
ADD DiscountedPrice as  RetailPrice*(1-Discount)

ALTER TABLE ShakeMenu
ADD DiscountedPrice as  RetailPrice*(1-Discount)

ALTER TABLE DrinksMenu
ADD DiscountedPrice as  RetailPrice*(1-Discount)

--DROP COLUMN
DROP TABLE StocktTable
GO
-- Update column definition 
ALTER TABLE OWERSDATA
ALTER COLUMN PHONE INT NOT NULL

-- ADD column with default CONSTRAINT 

ALTER TABLE EmployeeData
ALTER COLUMN NID_NO INT 
ALTER TABLE EmployeeDat
ADD CONSTRAINT dk DEFAULT 'N/A'
GO
-- DROP CONSTRAINT
ALTER TABLE EmployeeData
DROP CONSTRAINT CK__EmployeeD__NID_N__05D8E0BE
ALTER TABLE EmployeeData
DROP CONSTRAINT UQ__Employee__C070DEFB975EA6BC
--ALTER DATA TYPE
ALTER TABLE EmployeeData
ALTER COLUMN NID_NO BIGINT
ALTER TABLE EmployeeData
ADD CONSTRAINT UNK_ENP UNIQUE(NID_NO)
--CHECK CONSTRAINT
ALTER TABLE EmployeeData
ADD CONSTRAINT CHK_ENP CHECK(NID_NO LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')

ALTER TABLE CUSTOMER_DATA
  
ALTER COLUMN Gender VARCHAR(7) NOT NULL;

-- DROP TABLE 

IF OBJECT_ID('OWERSDATA') IS NOT NULL
DROP TABLE OWERSDATA 
GO
-- DROP SCHEMA 
DROP SCHEMA IceCream_Parlour_ManagementSystem;
GO
-- Rename Table 
 EXEC sp_rename'Menucard','MenuBook';

-- RENAME COLUMN
 EXEC sp_rename 'SalGrade.SalAmount','BasicSalary','COLUMN';
 
SELECT * FROM IceCreameMenu
GO

/*
  **********************************   SECTION 04  **************************************
                                     ---------------
  --------------------- CREATE CLUSTERED AND NONCLUSTERED INDEX -------------------------
*/
   
   --CLUSTERED  INDEX

  CREATE CLUSTERED INDEX CI_Emp ON EmployeeData(Emp_ID);

  GO
   --NONCLUSTERED INDEX

  CREATE UNIQUE NONCLUSTERED INDEX employee  ON  OrderData(OrderID);
  GO
  /*
  **********************************  SELECTION 05  **************************************
                                      -------------
  -----------------------------------CREATE SEQUENCE--------------------------------------
*/
    CREATE SEQUENCE empSEQUENCE AS INT 
	START WITH 1 
	INCREMENT BY 12
	MINVALUE 11
	MAXVALUE 1111
	CYCLE
	CACHE 10
GO

--ALTER SEQUENCE 

    ALTER SEQUENCE empSEQUENCE
	MAXVALUE 111
	INCREMENT BY -2
	CYCLE
	
GO

 /*
  **********************************   SELECTION 06  **************************************
                                     ---------------
  ------------------------------------CREATE A VIEW --------------------------------------
*/

 CREATE VIEW vShopDetails
  AS
  SELECT ShopOutlet.ShopName,
         ShopOutlet.ShopLicence,
		 ShopOutlet.ShopLocation,
		 OwnerTable.ShareHolderName,
		 OwnerTable.Phone,
		 OwnerTable.Email
  FROM ShopOutlet
  JOIN
    OwnerTable
  ON
    ShopOutlet.ShopID=OwnerTable.Sh_Id
  GO

  SELECT * FROM vShopDetails;

  go

 CREATE VIEW vMenuBook
 AS
 SELECT
  
  M.MenuID,
  M.ItemID,
  M.Rating,
  IM.IceCreamName AS IceCreamName,
  IM.RetailPrice AS IceCreamRetailPrice,
  IM.Ingredient AS IceCreamIngredient,
  SM.ShakeName AS ShakeName,
  SM.RetailPrice AS ShakeRetailPrice,
  SM.Ingredient AS ShakeIngredient,
  DM.DrinksName AS DrinksName,
  DM.RetailPrice AS DrinksRetailPrice,
  DM.Flavour AS DrinksFlavour
     
FROM ItemMenu AS M
full JOIN IceCreameMenu AS IM ON M.ItemID = IM.IceCreamID
full JOIN ShakeMenu AS SM ON M.ItemID = SM.ShakeID
full JOIN DrinksMenu AS DM ON M.ItemID = DM.DrinksID;
go

CREATE VIEW EmployeeSalaryView AS
SELECT
    ED.Emp_ID,
    ED.Emp_Name,
    ED.Designation,
    ED.SalaryGrade,
    EW.TotalWorkingHours,
    EW.OvertimeHours,
    EW.BasicSalary,
    EW.HourlyPaymentOT,
    OvertimePayment = EW.OvertimeHours * EW.HourlyPaymentOT,
    TotalSalary = EW.BasicSalary + (EW.OvertimeHours * EW.HourlyPaymentOT)
FROM EmployeeData AS ED
INNER JOIN EmpWages AS EW ON ED.Emp_ID = EW.EmployeeID;

go
SELECT * FROM EmployeeSalaryView;
drop view vMenuBook

select * from vMenuBook
--------------------------------------------------------------------------------
----------------------------------------------------------------------------------
go
-- Create a view that selects all data from CUSTOMER_DATA
CREATE VIEW vw_CUSTOMER_DATA
AS
SELECT *
FROM CUSTOMER_DATA;
GO

-- Enable INSTEAD OF INSERT trigger on the view
CREATE TRIGGER tr_INSERT_CUSTOMER_DATA
ON vw_CUSTOMER_DATA
INSTEAD OF INSERT
AS
BEGIN
  INSERT INTO CUSTOMER_DATA (CustomerName, Phone, Gender, DateOfBirth, Email, Address, NID_NO)
  SELECT CustomerName, Phone, Gender, DateOfBirth, Email, Address, NID_NO
  FROM inserted;
END;
GO

-- Enable INSTEAD OF UPDATE trigger on the view
CREATE TRIGGER tr_UPDATE_CUSTOMER_DATA
ON vw_CUSTOMER_DATA
INSTEAD OF UPDATE
AS
BEGIN
  UPDATE cd
  SET
    cd.CustomerName = i.CustomerName,
    cd.Phone = i.Phone,
    cd.Gender = i.Gender,
    cd.DateOfBirth = i.DateOfBirth,
    cd.Email = i.Email,
    cd.Address = i.Address,
    cd.NID_NO = i.NID_NO
  FROM CUSTOMER_DATA cd
  INNER JOIN inserted i ON cd.CusID = i.CusID;
END;
GO

-- Enable INSTEAD OF DELETE trigger on the view
CREATE TRIGGER tr_DELETE_CUSTOMER_DATA
ON vw_CUSTOMER_DATA
INSTEAD OF DELETE
AS
BEGIN
  DELETE FROM CUSTOMER_DATA
  WHERE CusID IN (SELECT CusID FROM deleted);
END;
GO



 /*
  **********************************   SELECTION 06  **************************************
                                     ---------------
  ------------------------------------STORED PROCEDURE --------------------------------------
*/

  --> STROED PROCEDURE FOR INSERT DATA USING PARAMETER 
go
CREATE PROCEDURE spEmployee @Name VARCHAR(50),
							@phone VARCHAR(11),
							@Gender Varchar(10),
							@dob DATE,
							@email VARCHAR(60),
							@address VARCHAR(60),
							@nid int,
							@joinDte date,
							@religion Varchar(20),
							@bloodgroup VARCHAR(3),
							@designation VARCHAR(40),
							@workingarea int,
							@salGrd int,
							@depId int					
							
    AS
    BEGIN 
    INSERT INTO EmployeeData (Emp_Name, Phone, Gender, DateOfBirth, Email, Address, NID_NO, JoinDate, Religion, BloodGroup, Designation, WorkingArea, SalaryGrade, DepartmentID)
	VALUES(@Name, @phone,@Gender,@dob,@email,@address, @nid,@joinDte,@religion,@bloodgroup,@designation ,@workingarea,@salGrd,@depId)
	END
GO
SELECT * FROM EmployeeData

-- STORED PROCEDURE FOR DELETE TABLE DATA 
GO
CREATE PROCEDURE sp	@ShakeMenuId INT
AS
BEGIN 
	DELETE FROM ShakeMenu 
	WHERE ShakeID  = @ShakeMenuId
END
GO


--Update Data With Store Procedure

CREATE PROCEDURE UpdatePrice
    @p VARCHAR(255) -- Input parameter for item name
AS
BEGIN
    UPDATE IceCreameMenu
    SET RetailPrice = 40
    WHERE IceCreamName = @p;
END;

GO
-- Create a stored procedure for inserting data into CUSTOMER_DATA with try-catch
CREATE PROCEDURE InsertCustomerData
    @CustomerName NVARCHAR(40),
    @Phone VARCHAR(11),
    @Gender VARCHAR(4),
    @DateOfBirth DATE,
    @Email VARCHAR(20),
    @Address VARCHAR(40),
    @NID_NO INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO CUSTOMER_DATA (CustomerName, Phone, Gender, DateOfBirth, Email, Address, NID_NO)
        VALUES (@CustomerName, @Phone, @Gender, @DateOfBirth, @Email, @Address, @NID_NO);

        PRINT 'Data inserted successfully';
    END TRY
    BEGIN CATCH
        -- Error handling
        PRINT 'Error: ' + ERROR_MESSAGE();
    END CATCH;
END;
GO



 /*
  **********************************   SELECTION 06  **************************************
                                      ---------------
  ------------------------------------  FUNCTION --------------------------------------
*/


-- Create a scalar-valued function to calculate total salary
CREATE FUNCTION CalculateTotalSalary
(
    @BasicSalary INT,
    @OvertimePayment DECIMAL(5, 2)
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @TotalSalary DECIMAL(10, 2);

    SET @TotalSalary = @BasicSalary + @OvertimePayment;

    RETURN @TotalSalary;
END;
GO
--IN LINE Table Valued Function
GO
CREATE FUNCTION GetEmployeeSalariesInline()
RETURNS TABLE
AS
RETURN
(
    SELECT
        ED.Emp_ID,
        ED.Emp_Name,
        ED.Designation,
        ED.SalaryGrade,
        EW.TotalWorkingHours,
        EW.OvertimeHours,
        EW.BasicSalary,
        EW.HourlyPaymentOT,
        EW.OvertimeHours * EW.HourlyPaymentOT AS OvertimePayment,
        EW.BasicSalary + (EW.OvertimeHours * EW.HourlyPaymentOT) AS TotalSalary
    FROM EmployeeData AS ED
    INNER JOIN EmpWages AS EW ON ED.Emp_ID = EW.EmployeeID
);

GO
-- MULTI STATEMENT Table Valued Function

CREATE FUNCTION GetEmployeeSalaries()
RETURNS @EmployeeSalaries TABLE
(
    Emp_ID INT,
    Emp_Name NVARCHAR(40),
    Designation VARCHAR(40),
    SalaryGrade INT,
    TotalWorkingHours INT,
    OvertimeHours INT,
    BasicSalary MONEY,
    HourlyPaymentOT DECIMAL(5, 2),
    OvertimePayment MONEY,
    TotalSalary MONEY
)
AS
BEGIN
    INSERT INTO @EmployeeSalaries
    SELECT
        ED.Emp_ID,
        ED.Emp_Name,
        ED.Designation,
        ED.SalaryGrade,
        EW.TotalWorkingHours,
        EW.OvertimeHours,
        EW.BasicSalary,
        EW.HourlyPaymentOT,
        EW.OvertimeHours * EW.HourlyPaymentOT AS OvertimePayment,
        EW.BasicSalary + (EW.OvertimeHours * EW.HourlyPaymentOT) AS TotalSalary
    FROM EmployeeData AS ED
    INNER JOIN EmpWages AS EW ON ED.Emp_ID = EW.EmployeeID;

    RETURN;
END;

GO

/*
  **********************************   SELECTION 07  **************************************
                                      ---------------
  ------------------------------------  TRIGGER --------------------------------------
*/
GO
-- Create an AFTER INSERT trigger to update Ice Cream quantity in stock
CREATE TRIGGER UpdateIceCreamQuantity
ON CustomerOrders
AFTER INSERT
AS
BEGIN
    -- Update the quantity in stock for Ice Cream in the IceCreameMenu table
    UPDATE ic
    SET ic.QuantityInStock = ic.QuantityInStock - i.QuantityOrdered
    FROM IceCreameMenu ic
    INNER JOIN inserted i ON ic.IceCreamID = i.ItemID
    WHERE i.ItemType = 'Ice Cream';
END;
GO


-- Create an INSTEAD OF INSERT trigger for EmpWages
CREATE TRIGGER tr_EmpWages_Insert
ON EmpWages
INSTEAD OF INSERT
AS
BEGIN
  -- Perform salary calculation and insert data into the EmpWages table
  INSERT INTO EmpWages (EmployeeID, EmpStartWT, EmpEndWT, BasicSalary, HourlyPaymentOT)
  SELECT EmployeeID, EmpStartWT, EmpEndWT, BasicSalary, HourlyPaymentOT
  FROM inserted;

  -- Calculate TotalWorkingHours and OvertimeHours
  UPDATE EmpWages
  SET TotalWorkingHours = DATEDIFF(HOUR, EmpStartWT, EmpEndWT),
      OvertimeHours = CASE WHEN DATEDIFF(HOUR, EmpStartWT, EmpEndWT) > 8 THEN DATEDIFF(HOUR, EmpStartWT, EmpEndWT) - 8 ELSE 0 END;
END;




-- Create a trigger to update item quantities when a customer places an order

CREATE TRIGGER UpdateItemQuantity
ON CustomerOrders
AFTER INSERT
AS
BEGIN
    -- Update the quantity in stock for the product based on ItemID
    UPDATE ic
    SET ic.QuantityInStock = ic.QuantityInStock - o.QuantityOrdered
    FROM IceCreameMenu ic
    INNER JOIN inserted o ON ic.IceCreamID = o.ItemID
    WHERE o.ItemID IN (SELECT IceCreamID FROM IceCreameMenu);

    UPDATE sm
    SET sm.QuantityInStock = sm.QuantityInStock - o.QuantityOrdered
    FROM ShakeMenu sm
    INNER JOIN inserted o ON sm.ShakeID = o.ItemID
    WHERE o.ItemID IN (SELECT ShakeID FROM ShakeMenu);

    UPDATE dm
    SET dm.QuantityInStock = dm.QuantityInStock - o.QuantityOrdered
    FROM DrinksMenu dm
    INNER JOIN inserted o ON dm.DrinksID = o.ItemID
    WHERE o.ItemID IN (SELECT DrinksID FROM DrinksMenu);
END;
GO


------------------

-- Create a trigger to insert data into ITEMMENU from IceCreameMenu
CREATE TRIGGER IceCreamMenu_Insert
ON IceCreameMenu
AFTER INSERT
AS
BEGIN
  INSERT INTO ItemMenu (ItemType, ItemName, ItemDescription, QuantityInStock, RetailPrice)
  SELECT 'Ice Cream', IceCreamName, Flavour, QuantityInStock, RetailPrice
  FROM inserted;
END;

-- Create a trigger to insert data into ITEMMENU from ShakeMenu
CREATE TRIGGER ShakeMenu_Insert
ON ShakeMenu
AFTER INSERT
AS
BEGIN
  INSERT INTO ItemMenu (ItemType, ItemName, ItemDescription, QuantityInStock, RetailPrice)
  SELECT 'Shake', ShakeName, Flavour, QuantityInStock, RetailPrice
  FROM inserted;
END;

-- Create a trigger to insert data into ITEMMENU from DrinksMenu
CREATE TRIGGER DrinksMenu_Insert
ON DrinksMenu
AFTER INSERT
AS
BEGIN
  INSERT INTO ItemMenu (ItemType, ItemName, ItemDescription, QuantityInStock, RetailPrice)
  SELECT 'Drinks', DrinksName, Flavour, QuantityInStock, RetailPrice
  FROM inserted;
END;