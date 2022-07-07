

/*                  
						===========================================================
                       *|SQL Project Name : Buying House Management Systems (BHMS)|*
            	      **|    Trainee Name : Md.Shaon Khalifa                      |** 
				     ***|      Trainee ID : 1269818							      |***    
				    ****|        Batch ID : ESAD-CS/PNTL-A/51/01                  |****
				   *****| Submission Date : 07/06/2022                            |*****
					    ==========================================================

									==>Table of Contents: DDL FILE<==
									   ****************************
         => SECTION 01: Created a Database Name [Buying House Management Systems (BHMS)]
         => SECTION 02: Created Appropriate Tables For The Database
		 => SECTION 03: Created Sequence, Some Clustered & Non-Clustered Index
         => SECTION 04: Apply Some Modifying Statement (ALTER, ADD, DELET, UPDATE,RENAME COLUMN NAME,ADD &  DROP CONSTRANT)
         => SECTION 05: CREATING VIEWS
		 => SECTION 06: STORE PROCEDURE (INSERT, DELETE, UPDATE)
		 => SECTION 07: CREATING TRIGGER (FOR TRIGGER, INSTEAD OF TRIGGER )
         => SECTION 08: CREATING FUNCTION (Scalar Value,Inline Table  Value,Multi-statement Table-valued)
        
*/
----------------------------------------------------------------------------------------------------------
									--DATA DEFINITION LANGUAGE (DDL)--
---------------------------------------------------------------------------------------------------------
							         --SECTION 1--
USE master
GO
DROP DATABASE IF EXISTS BuyingHouseManagementDB
GO

CREATE DATABASE BuyingHouseManagementDB
ON
(
	NAME='BuyingHouseManagementDB_DATA_1',
	FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BuyingHouseManagementDB_DATA_1.mdf',
	SIZE=50MB,
	MAXSIZE=100MB,
	FILEGROWTH=5%
)
LOG ON
(
NAME='BuyingHouseManagementDB_LOG_1',
	FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BuyingHouseManagementDB_LOG_1.ldf',
	SIZE=5MB,
	MAXSIZE=50MB,
	FILEGROWTH=1MB
)
GO
USE BuyingHouseManagementDB
GO
										--SECTION 2--
-----------------------------------------CREATE TABLES-----------------------------------------------------

CREATE TABLE tblBuyer
(
	buyerId       INT PRIMARY KEY IDENTITY (100,1),
	companyName   VARCHAR(40) NOT NULL,
	city	      VARCHAR(40) NOT NULL,
	country       VARCHAR(40) NOT NULL,
	conPerson     VARCHAR(40) NOT NULL,
	cpDesignation VARCHAR(20) NOT NULL,
	phone         VARCHAR(20) NOT NULL CONSTRAINT ck_phone_B CHECK (phone LIKE '+%[0-9]'),
	email         VARCHAR(30) UNIQUE NOT NULL
)
GO

CREATE TABLE tblCatagory
(
	catId	    INT PRIMARY KEY ,
	catName     VARCHAR(40) NOT NULL
)
GO

CREATE TABLE tblItems
(
	itemId	    INT PRIMARY KEY IDENTITY(100,1),
	itemName    VARCHAR(40) NOT NULL
)
GO

CREATE TABLE tblColors
(
	colorId	    INT PRIMARY KEY IDENTITY,
	colorName   VARCHAR(40) NOT NULL
)
GO

CREATE TABLE tblSupplier
(
	supplierId    INT PRIMARY KEY IDENTITY (100,1),
	supplierName  VARCHAR(40) NOT NULL,
	city	      VARCHAR(40) NOT NULL,
	country       VARCHAR(40) NOT NULL,
	conPerson     VARCHAR(40) NOT NULL,
	cpDesignation VARCHAR(20) NOT NULL,
	phone         VARCHAR(20) NOT NULL CONSTRAINT ck_phone_S CHECK (phone LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9]'),
	email         VARCHAR(30) UNIQUE NOT NULL
)
GO

CREATE TABLE tblOrderDeatils
(
	orderId       INT PRIMARY KEY IDENTITY (1,1),
	buyerId       INT REFERENCES tblBuyer(buyerId)  ON DELETE CASCADE  ON UPDATE CASCADE NOT NULL,
	catId	      INT REFERENCES tblCatagory(catId) ON DELETE CASCADE  ON UPDATE CASCADE NOT NULL,
	itemId	      INT REFERENCES tblItems(itemId) ON DELETE CASCADE  ON UPDATE CASCADE NOT NULL,
	colorId	      INT REFERENCES tblColors(colorId) ON DELETE CASCADE  ON UPDATE CASCADE NOT NULL,
	supplierId	  INT REFERENCES tblSupplier(supplierId)ON DELETE CASCADE  ON UPDATE CASCADE NOT NULL,
	[date]        DATETIME DEFAULT GETDATE() NOT NULL,
	unitPrice     MONEY NOT NULL,
	quantity	  INT NOT NULL,
	commission    AS ((unitPrice*quantity)*.30)
)
GO
CREATE TABLE  tblShippers
(
	shipperId     INT IDENTITY PRIMARY KEY,
	companyName   VARCHAR(50) NOT NULL,
	shipNum		  VARCHAR (50) CONSTRAINT ck_phone_ShN CHECK (shipNum LIKE '[A-Z][]A-Z[A-Z]-[0-9][0-9][0-9][0-9]'),
	phone         NVARCHAR(20)CONSTRAINT ck_phone_Sh CHECK (phone LIKE '+%[0-9]')
)
GO

CREATE TABLE tblShipment
(
	shipmentId	   INT IDENTITY(1000,1) ,
	shipperId      INT REFERENCES tblShippers(shipperId) ON DELETE CASCADE  ON UPDATE CASCADE NOT NULL,
	orderId        INT REFERENCES tblOrderDeatils(orderId)ON DELETE CASCADE  ON UPDATE CASCADE NOT NULL,
	[date]         DATETIME DEFAULT GETDATE() NOT NULL,
	shipmentStatus BIT,                                 --*****(0=SHIPMENT DONE,1=SHIPMENT RUNNING)*****--
	PRIMARY KEY (shipmentId,shipperId,orderId)

)
GO




CREATE TABLE tblEmpolyee
(
	emId         INT PRIMARY KEY IDENTITY (100,1),
	emName       VARCHAR(40)  NOT NULL,
	[address]	 VARCHAR(200) NOT NULL,
	designation  VARCHAR(40)  NOT NULL,
	phone        VARCHAR(20)  NOT NULL CONSTRAINT ck_phone CHECK (phone LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9]'),
	EmpImage     VARCHAR(MAX) NULL DEFAULT 'N/A',
	email        VARCHAR(30)   NOT NULL,
	salary       MONEY		  CONSTRAINT df_salary DEFAULT 0.00 
)
GO

CREATE TABLE tblAccounts
(
	trId	    INT   PRIMARY KEY   IDENTITY(1001,1) ,
	orderId     INT      REFERENCES tblOrderDeatils(orderId) ON DELETE NO ACTION  ON UPDATE CASCADE NOT NULL,
	commission  MONEY    CONSTRAINT ck_coms CHECK (commission>0)DEFAULT 0.00 ,
	tax         FLOAT,
	netEarn     AS (commission*(1-tax))
	
)
GO



CREATE TABLE tblexpences
(
	
	Id            INT PRIMARY KEY IDENTITY(200,1),
	exId		  INT,
	exName	      VARCHAR(50)NOT NULL,
	exAmount	  MONEY DEFAULT 0.00 ,
    trId          INT      REFERENCES tblAccounts(trId)  ON UPDATE CASCADE
)
GO
CREATE TABLE balance
(
	ID INT REFERENCES tblexpences(ID) DEFAULT 0 ,
	trId          INT      REFERENCES tblAccounts(trId)  ON UPDATE CASCADE DEFAULT 0
	PRIMARY KEY (ID,trId)
)
GO


CREATE TABLE tblEmpCity
(
	cityId     INT,
	cityName   VARCHAR(30),
	emId       INT REFERENCES tblEmpolyee(emId)  ON DELETE SET NULL ON UPDATE SET NULL ,
)
GO
											--SECTION 3--
-------------------------------------------Create Sequence-------------------------------------------------
CREATE SEQUENCE se_catagory
AS INT
START WITH 101
INCREMENT BY 1
GO

-----------------------------------CREATING A NON-CLUSTERED INDEX----------------------------------------------
CREATE UNIQUE NONCLUSTERED INDEX IX_Ship
ON tblShippers(shipperId)
GO
-----------------------------------CREATING A CLUSTERED INDEX----------------------------------------------
CREATE CLUSTERED INDEX IX_CITY
ON tblEmpCity(cityId)
GO


										--SECTION 4--
-----------------------------------ADD COLUMN TO A EXISTING TABLE ------------------------------------
ALTER TABLE tblEmpCity
ADD Zipcode VARCHAR(10)
GO
------------------------------DELETE COLUMN FROM A EXISTING TABLE------------------------------------
ALTER TABLE tblEmpCity
DROP COLUMN ZipCode
GO

-----------------------------------------DROP A TABLE-------------------------------------------------

DROP TABLE tblEmpCity
GO


------------------------------------------DROP CONSTRINT---------------------------------------------
ALTER TABLE tblShippers
DROP CONSTRAINT ck_phone_ShN
GO
ALTER TABLE tblSupplier
DROP CONSTRAINT ck_phone_S
GO
ALTER TABLE tblEmpolyee
DROP CONSTRAINT ck_phone
GO

----------------------------------------ADD CONSTRANT----------------------------------------------
ALTER TABLE tblShippers
ADD CONSTRAINT ck_SIP_ShN CHECK (shipNum LIKE 'MV %')
GO
ALTER TABLE tblSupplier
ADD CONSTRAINT ck_phone_SS CHECK  (phone LIKE '+%[0-9]')
GO
ALTER TABLE tblShippers
ADD CONSTRAINT ck_phone_SSS CHECK  (phone LIKE '+%[0-9]')
GO
ALTER TABLE tblEmpolyee 
WITH NOCHECK 
ADD CONSTRAINT ck_phone 
CHECK(phone LIKE'+%[0-9]')
GO
-------------------------------------DROP FK CONSTRINT---------------------------------------------
ALTER TABLE [dbo].[tblShipment]
DROP CONSTRAINT FK__tblShipme__order__3E52440B
GO
ALTER TABLE [dbo].[tblShipment]
DROP CONSTRAINT [FK__tblShipme__shipp__5BE2A6F2]
GO

------------------------------------ADD FK CONSTRANT---------------------------------------------------
ALTER TABLE tblShipment
ADD FOREIGN KEY (shipperId) REFERENCES [dbo].[tblShippers](shipperId)ON DELETE CASCADE  ON UPDATE CASCADE
GO


ALTER TABLE tblShipment
ADD FOREIGN KEY (orderId) REFERENCES [dbo].[tblOrderDeatils](orderId)ON DELETE CASCADE  ON UPDATE CASCADE
GO

---------------------------------RENAME COLUMN NAME------------------------------------------------------

IF EXISTS (
        SELECT 1
        FROM sys.columns
        WHERE
            name = 'emId' AND
            object_name(object_id) = 'tblEmpCity'
    ) AND
    NOT EXISTS (
        SELECT 1
        FROM sys.columns
        WHERE
            name = 'empId' AND
            object_name(object_id) = 'tblEmpCity'
    )
 EXEC sp_RENAME 'dbo.tblEmpCity.emId', 'empId', 'COLUMN'

GO


										--SECTION 5--
-----------------------------------------CREATE VIEW---------------------------------------------------


----------------------------1. CREATE VIEW TO INSERT DATA FROM VIEW-------------------------------------
CREATE VIEW vCatagory
WITH ENCRYPTION
AS
SELECT 
	catId,
	catName 
FROM tblCatagory
GO
----------------------------------2------------------------------------------------------------------
CREATE VIEW vOrder
WITH ENCRYPTION
AS
SELECT 
	tblOrderDeatils.orderId,
	tblBuyer.companyName,
	tblOrderDeatils.[date],
	tblOrderDeatils.quantity,
	tblSupplier.supplierName,
	tblShippers.companyName AS 'SHIP COMPANY',
	tblShipment.shipmentStatus,
	tblShipment.[date] AS 'SHIPMENT DATE',
	tblOrderDeatils.commission 
FROM tblOrderDeatils 
	INNER JOIN tblBuyer ON tblBuyer.buyerId=tblOrderDeatils.buyerId
	INNER JOIN tblSupplier ON tblSupplier.supplierId=tblOrderDeatils.supplierId
	INNER JOIN tblShipment ON tblShipment.orderId=tblOrderDeatils.orderId
	INNER JOIN tblShippers ON tblShippers.shipperId=tblShipment.shipperId
go

--------------------------------------------3--------------------------------------------
 CREATE VIEW vEmpolyee
 AS
 SELECT emName,
		[address],
		designation,
		phone,
		email,
		salary 
 FROM tblEmpolyee
 GO






									--SECTION 6--
----------------------------------STORED PROCEDURE-----------------------------------------


-------------------1. CREATE STORED PROCEDURE TO INSERT DATA WITHOUT RETURN AND WITH RETURN---------------------

---------------------------------(1)WITHOUT RETURN-------------------------------------------------
CREATE PROC sp_Inserttblbuyer  
							  @companyName   VARCHAR(40),
							  @city	      VARCHAR(40),
							  @country       VARCHAR(40),
							  @conPerson     VARCHAR(40),
							  @cpDesignation VARCHAR(20),
							  @phone         VARCHAR(20),
							  @email         VARCHAR(30)
AS
BEGIN
INSERT INTO tblBuyer (companyName,city,country,conPerson,cpDesignation,phone,email)VALUES
(@companyName,@city,@country,@conPerson,@cpDesignation,@phone,@email)
END
GO



-------------------------------------------(2)WITH RETURN---------------------------------------------
CREATE PROC sp_ItemsInsertWithReturn 
						@itemName    VARCHAR(40)
AS
DECLARE @itemId INT
INSERT INTO tblItems 
VALUES(@itemName)
SELECT @itemId=IDENT_CURRENT('tblItems')
RETURN @itemId
GO
-------------------------------(3)WITH OUTPUT PARAMETER--------------------------------------------------
CREATE PROC sp_insertintosupplier @supplierName  VARCHAR(40),
								  @city	         VARCHAR(40),
								  @country       VARCHAR(40),
								  @conPerson     VARCHAR(40),
								  @cpDesignation VARCHAR(20),
								  @phone         VARCHAR(20),
								  @email         VARCHAR(30),
								  @id	         INT OUTPUT
AS
INSERT INTO tblSupplier VALUES
(@supplierName, @city, @country , @conPerson,@cpDesignation,@phone,@email)	
SELECT @id=IDENT_CURRENT('tblSupplier')
GO

-----------4  CREATE STORED PROCIDURE WITH TRY.....CATCH--------------------------------------------

CREATE PROC sp_expences  
					
					 @EN     VARCHAR (50),    
					 @EA         MONEY
AS
    BEGIN TRY
    INSERT INTO tblexpences (exName,exAmount)
    VALUES 
        (@EN,@EA)
        RETURN 0
    END TRY
    BEGIN CATCH
        DECLARE @Message NVARCHAR (150)
        SET @Message =ERROR_MESSAGE()
        RAISERROR (@Message,10, 1)
        RETURN ERROR_MESSAGE()
    END CATCH
GO
-----------------------------------DROP STORED PROCEDURE-----------------------------------------------
DROP PROC sp_expences
GO
-----------------------Stored procedure for deleting data ---------------------------------------------
CREATE PROC sp_deleteEmpolyee
							@emId INT
AS 
	DELETE FROM tblEmpolyee 
	WHERE emId=@emId
GO
------------------STORED PROCEDURE IN VIEW FOR UPDATING DATA ----------------------------------------------

CREATE PROCEDURE sp_InsertUpdateData
			(


				@emName		VARCHAR(40),
			    @address	VARCHAR(200),
				@designation  VARCHAR(40),
				@phone        VARCHAR(20),
				@email        VARCHAR(30), 
				@salary       MONEY		 

)
AS
BEGIN

    IF EXISTS (SELECT 1 FROM vEmpolyee
    WHERE email=@email
	)
    BEGIN
        UPDATE vEmpolyee SET 
	       emName = @emName,
	       [address] = @address,
	       designation= @designation,
           phone = @phone,
		   Email = @Email,
		   salary=@salary
		   WHERE email=@email
	PRINT 'New Employee Data Updated'
    END
ELSE
    BEGIN
        INSERT INTO vEmpolyee VALUES 
		(
			@emName,
			@address,
			@designation,
			@phone,
			@email,
			@salary
		)
	PRINT 'New Empolyee Data Inserted'
    END
END
GO
										--SECTION 7--
--------------------------------------TRIGGER--------------------------------------------------------------------
------------------------------1 INSTEAD OF TRIGGER-------------------------------------------------------	
CREATE TRIGGER trAccountofearning
ON tblAccounts
INSTEAD OF INSERT
AS
BEGIN
	IF ((SELECT COUNT(*) FROM inserted)>0)
		BEGIN
		INSERT INTO tblAccounts(orderId,commission,tax)
		SELECT i.orderId,od.commission,i.tax FROM inserted i
		INNER JOIN tblOrderDeatils od ON OD.orderId=I.orderId
		END
	ELSE
	BEGIN
		PRINT 'Error Occered !!!'
	END
END
GO
---------------------2 FOR TRIGGER WITH ROLLBACK TRANSACTION-----------------------------------------------
CREATE TRIGGER tr_catagory
ON tblCatagory
FOR DELETE,UPDATE,INSERT
AS
	BEGIN
			PRINT'YOU CAN NOT DELETE , UPDATE AND INSERT CATAGORY DATA'
			ROLLBACK TRANSACTION
	END
GO

--------------------------------------DDL TRIGGER--------------------------
	CREATE TABLE dbo.TableLog(
   LogID int IDENTITY(101,1) PRIMARY KEY,
   EventVal xml NOT NULL,
   EventDate datetime NOT NULL,
   ChangedBy SYSNAME NOT NULL
)
GO


CREATE TRIGGER trgTablechanges
ON DATABASE
FOR	
    CREATE_TABLE,
    ALTER_TABLE, 
    DROP_TABLE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO TableLog
    (
       EventVal,
       EventDate,
       ChangedBy
     )
        VALUES (
           EVENTDATA(),
           GETDATE(),
           USER
        );
END
GO
--------------------------------SAMPLE TABLE FOR CHECKING DDL TRIGGER-------------------------------------------------------------
CREATE TABLE COMPETITOR
(
ID INT PRIMARY KEY IDENTITY,
[NAME] VARCHAR(40)

)
GO



									--SECTION 8--
--------------------------------UDF USER DEFINE FUNCTION-----------------------------------------------------------------------
---------------------------------Scalar Function Crreated-----------------------------------------------------------

-- To Return BUYER Wise total Commission Amount 
select * from vOrder
go
select * from tblOrderDeatils
go

CREATE FUNCTION fn_buyerwisecommission (@buyerId INT)
RETURNS MONEY
AS 
    BEGIN 
        DECLARE @buyerwisecommission MONEY
        SELECT @buyerwisecommission  = SUM(commission) FROM tblOrderDeatils
        WHERE buyerId = @buyerId
        RETURN @buyerwisecommission
    END
GO


--------------------------------------Scalar Function Crreated---------------------------------------------
-- To Return BUYER Wise total Order Quantity
CREATE FUNCTION fn_orderquntity (@buyerId INT)
RETURNS MONEY
AS
BEGIN
	 DECLARE @quantity MONEY
	 SELECT @quantity= quantity FROM tblOrderDeatils
	 WHERE buyerId=@buyerId
	 RETURN @quantity
END
Go
----------------------------Inline Table Valued Function--------------------------------------------------

---------------------To find order amount and receivable commission-----------------------------

CREATE FUNCTION fnbuyercommission(@orderId INT)
RETURNS TABLE
AS
RETURN
(
	SELECT 
		SUM (quantity*unitPrice) AS 'Order Amount',
		(SUM (quantity*unitPrice)*.30) AS 'Commission'
	FROM tblOrderDeatils
	WHERE orderId=@orderId
)
GO
-------------------------Multi-statement Table-valued Function-------------------------------------------

--TO find order Id ,buyer Name ,supplier Name ,quantity, amount and shipment status of an order

CREATE FUNCTION fn_OrderDetails(@orderId INT)
RETURNS @orderDetails TABLE
(
	orderId		   INT,
	companyName    VARCHAR(40),
	country		   VARCHAR(40),
	supplierName   VARCHAR(40),
	city		   VARCHAR(40),
	quantity       INT,
	orderAmount    MONEY,
	shipmentStatus BIT
	
)
AS
BEGIN
	INSERT INTO @orderDetails
	SELECT 
	od.orderId,
	bu.companyName,
	bu.country,
	su.supplierName,
	su.city,
	od.quantity,
	SUM(od.unitPrice*od.quantity),
	sh.shipmentStatus

	FROM tblOrderDeatils od
	INNER JOIN tblBuyer bu ON bu.buyerId=od.buyerId
	INNER JOIN tblSupplier su ON su.supplierId=od.supplierId
	INNER JOIN tblShipment sh ON sh.orderId=od.orderId
	WHERE od.orderId=@orderId
	GROUP BY od.orderId,bu.companyName,bu.country,su.supplierName,su.city,od.quantity,sh.shipmentStatus
	RETURN
END
GO


GO
							          
							           -----*-----
									   



-------------------------CREATE LOGING ID AND PASSWORD------------------------------------
Create login mdShaon 
with password='Khalifa'