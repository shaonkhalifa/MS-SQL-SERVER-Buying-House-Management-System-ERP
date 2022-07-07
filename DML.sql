/*
                    	===========================================================
                       *|SQL Project Name : Buying House Management Systems (BHMS)|*
            	      **|    Trainee Name : Md.Shaon Khalifa                      |** 
				     ***|      Trainee ID : 1269818							      |***    
				    ****|        Batch ID : ESAD-CS/PNTL-A/51/01                  |****
				   *****| Submission Date : 07/06/2022                            |*****
					     ==========================================================
						 				==>Table of Contents: DML FILE<==
									   ****************************
         => SECTION 01: INSERTING DATA INTO TABLES
         => SECTION 02: INSERT DATA USEING VIEW , STORED PROCEDURE, TEST VIEW
		 => SECTION 03: TEST USER DEFINE FUNCTION AND TRIGGER
         => SECTION 04: DIFFERENT TYPES OF QUERIES SUCH AS (JOIN QUERIES,SUB-QUERIES WITH DIFFERENT TYPES OF OPERATOR),
						DIFFERENT TYPE OF FUNCTIONS(AGGRAGATE,BUILT-IN FUNCTIONS)
         => SECTION 05: CTE,SELECT INTO STATTEMENT,MERGE,IF..ELSE,TRY....CATCH,ROLLUP,CUBE,GROUPING SETS,CAST,CONVERT
						CASE,OVER,WHILE LOOP,WAIT FOR ,IS NULL AND SO ON,
		 => SECTION 06: TRANSATION
		

*/
--------------------------------------------------------------------------------------------------------
								--DATA MANIPULATION LANGUAGE(DML)--
--------------------------------------------------------------------------------------------------------



USE BuyingHouseManagementDB
GO
											 --SECTION 1--

-------------------------------------INSERTING DATA INTO COLOR TABLE------------- ---------------------------------
INSERT INTO tblColors VALUES
('Red'),
('Green'),
('Blue'),
('Black'),
('White'),
('Purple'),
('Orange'),
('Pink'),
('Gry'),
('Sky Blue'),
('Off White'),
('Nevy Blue'),
('Olive')
GO
------------------------------------------------------CHECK--------------------------------------------------------------

SELECT * FROM tblColors
GO


------------------------------------ INSERT DATA INTO ORDERDETAILS TABLE------------------------------------------

INSERT INTO tblOrderDeatils VALUES
(100,101,100,1,101,'01/05/2020',1200.00,5000),
(101,102,101,2,102,'01/03/2020',1000.00,9000),
(102,103,102,3,103,'01/07/2020',1700.00,4000),
(103,104,103,4,104,'01/08/2020',1500.00,10000),
(104,104,104,5,105,'01/12/2020',1200.00,78000),
(105,103,105,6,101,'01/11/2020',1700.00,34000),
(105,102,106,7,106,'01/01/2021',1500.00,11000),
(106,101,107,8,109,'01/02/2021',1270.00,56000),
(107,104,105,1,101,'01/02/2022',900.00,2000),
(100,101,104,3,103,'01/02/2021',1890.00,8000),
(103,102,104,4,101,'01/02/2020',1200.00,17000)
GO
----------------------------------------------------CHECK---------------------------------------------------------------
SELECT * FROM tblOrderDeatils
GO
-------------------------------------INSERT INTO tblEmployee TABLE--------------------------------------------------

INSERT INTO tblEmpolyee VALUES
('Rafiq Khan','House Building,Uttara,Dhaka','CEO','+01756797547','','rk@gmail.com',400000.00),
('Firoz Hossin','Tongi,GaziPur,Dhaka','Manager','+01556797547','','fh@gmail.com',200000.00),
('Syed Sohel','Bakergonj,Barishal','HR Manager','+01656797547','','SS@gmail.com',100000.00),
('Azmal Hossin','Sastagonj,Shelet','Marketing Manager','+01776797547','','ah@gmail.com',100000.00),
('Anamika Khan Thitli','Keraniginj,Dhaka','Sr.Executive Officer','+01886797547','','akt@gmail.com',70000.00),
('Sarabon Ahamed','Barisal City,Barishal','Executive Officer','+01996797547','','sa@gmail.com',50000.00),
('Kasiq Khan','CoteBari, Cummila','sr.Officer','+01326797547','','kk@gmail.com',650000.00),
('Mahedi Hasan','DaudKandi,Cummila','Jr.Officer','+01446797547','','mh@gmail.com',40000.00),
('Syed Juel','MeherPur City,Meherpur','','+01586797547','','sj@gmail.com',20000.00)
GO

---------------------------------------------CHECK--------------------------------------------------------------------

SELECT * FROM vEmpolyee


---------------------------------INSERT INTO SHIPPERS  TABLE----------------------------------------

INSERT INTO tblShippers (companyName,shipNum,phone)
VALUES ('P. Moller–Maersk','MV H 4563','+036848738983')
INSERT INTO tblShippers (companyName,shipNum,phone)
VALUES ('Mediterranean Shipping Company','MV K 6848','+0184783837')
INSERT INTO tblShippers (companyName,shipNum,phone)
VALUES ('COSCO Shipping Lines','MV W 7838','+01193848939')
INSERT INTO tblShippers (companyName,shipNum,phone)
VALUES ('CMA CGM Group','MV L 7350','+06573838394')
INSERT INTO tblShippers (companyName,shipNum,phone)
VALUES ('Ocean Network Express','MV E 5738','+08474783834')
INSERT INTO tblShippers (companyName,shipNum,phone)
VALUES ('Evergreen Line','MV E 8499','+0849789393')
GO
--------------------------------------CHECK----------------------------------------------
SELECT * FROM tblShippers
GO
-------INSERT INTO TBLSHIPMENT WITH DEFAULT VALUE AND WITHOUT DEFAULT VALUE---------

INSERT INTO tblShipment(shipperId,orderId,shipmentStatus) VALUES
(1,1,1)
INSERT INTO tblShipment(shipperId,orderId,shipmentStatus) VALUES
(2,2,1)
GO
INSERT INTO tblShipment VALUES
(6,5,'01-01-2021',0),
(5,4,'01-02-2022',0),
(4,8,'11-11-2021',0),
(3,6,'04-04-2022',1),
(1,3,'05-05-2022',1)
GO
-------------------------CHECK------------------------------
SELECT * FROM tblShipment
GO
----------------------INSERT INTO ACCOUNTS TABLE-------------------------
INSERT INTO tblAccounts(orderId,tax) VALUES
(1,0.15)
INSERT INTO tblAccounts(orderId,tax) VALUES
(2,0.15)
INSERT INTO tblAccounts(orderId,tax) VALUES
(3,0.15)
INSERT INTO tblAccounts(orderId,tax) VALUES
(4,0.15)
INSERT INTO tblAccounts(orderId,tax) VALUES
(5,0.15)
INSERT INTO tblAccounts(orderId,tax) VALUES
(6,0.15)
INSERT INTO tblAccounts(orderId,tax) VALUES
(7,0.15)
INSERT INTO tblAccounts(orderId,tax) VALUES
(8,0.15)
INSERT INTO tblAccounts(orderId,tax) VALUES
(9,0.15)
INSERT INTO tblAccounts(orderId,tax) VALUES
(10,0.15)
INSERT INTO tblAccounts(orderId,tax) VALUES
(11,0.15)
GO
-----------------------------CHECK---------------------------
SELECT * FROM tblAccounts
GO

							    --SECTION 2--
-------------------------------VIEW TEST--------------------------------
---INSERTING DATA BY USING VIEW-------------
INSERT INTO vCatagory VALUES
(NEXT VALUE FOR se_catagory,'MENS'),
(NEXT VALUE FOR se_catagory,'WOMENS'),
(NEXT VALUE FOR se_catagory,'GIRLS'),
(NEXT VALUE FOR se_catagory,'BOYS')
GO
-----------------------------CHECK--------------------------------
SELECT * FROM tblCatagory
GO
------------TO GET CATAGORY NAMES------------------------
SELECT * FROM vCatagory
GO
----------------TO GET FULL EMPOLYEE DETAILS----------------
SELECT * FROM vEmpolyee
GO
--------------TO GET FULL ORDER DETAILS--------------------------
SELECT * FROM vOrder
GO

--------------------------STORED PROCEDURE-----------------------
------INSERTING DATA BY USING STORED PROCEDURE FOR TESTING-------------

EXEC sp_Inserttblbuyer 'H&M','NewYork','USA','Wiliam Smith','Manager','+01675325699','wsmith@gmail.com'
EXEC sp_Inserttblbuyer 'ZARA','ROME','ITALY','Austin Mugal','Sales Manager','+92474838939','austin.mugal@gmail.com'
EXEC sp_Inserttblbuyer 'Eastasy','Dhaka','Bangladesh','Tazim Hasan','Product Manager','+0175273789','th@gmail.com'
EXEC sp_Inserttblbuyer 'Sultan','Dubai','UAE','Abdulla Rafiq','Product Manager','+65474838939','ar@gmail.com'
EXEC sp_Inserttblbuyer 'Amriacan Egal','NewYork','USA','Jon Haking','Manager','+015675325699','jh@gmail.com'
EXEC sp_Inserttblbuyer 'Gucci','ROME','ITALY','Russil Concode','Sales Manager','+92894838939','rc@gmail.com'
EXEC sp_Inserttblbuyer 'Nike','Houston','USA','Rosi  Khonas','Product Manager','+01135273789','rk@gmail.com'
EXEC sp_Inserttblbuyer 'Adidas','Barlin','Germany','Newton Kadir','Product Manager','+45474838939','nk@gmail.com'
GO
--------------------------------CHECK-----------------------------------------------
SELECT * FROM tblBuyer
GO
-----Test Inserting data with stored procedure with return
DECLARE @id INT
EXEC @id=sp_ItemsInsertWithReturn 'Under Garments'
EXEC @id=sp_ItemsInsertWithReturn 'Half-Shirt'
EXEC @id=sp_ItemsInsertWithReturn 'Full-Shirt'
EXEC @id=sp_ItemsInsertWithReturn 'Jacket'
EXEC @id=sp_ItemsInsertWithReturn 'Shari'
EXEC @id=sp_ItemsInsertWithReturn 'Cap'
EXEC @id=sp_ItemsInsertWithReturn 'Half Pant'
EXEC @id=sp_ItemsInsertWithReturn 'Blazer'
EXEC @id=sp_ItemsInsertWithReturn 'Suite'
PRINT 'New Product inserted with id: '+STR(@id)
GO
-----------------------------CHECK------------------------------
SELECT * FROM tblItems
GO
-----Test Inserting data with stored procedure with Outputs
DECLARE @supplierId INT
EXEC sp_insertintosupplier 'Hina Garments','Dhaka','Bangladesh','Halim Khan','Sales Manager','+01999890969','hk@gmail.com',@supplierId OUTPUT
EXEC sp_insertintosupplier 'Luna Garments','Dhaka','Bangladesh','syed shoel','Sales Manager','+01568890969','ss@gmail.com',@supplierId OUTPUT
EXEC sp_insertintosupplier 'Jina Garments','Saver','Bangladesh','Tanim Khan','Sales Manager','+01779890969','tk@gmail.com',@supplierId OUTPUT
EXEC sp_insertintosupplier 'Juna Garments','GaziPur','Bangladesh','Mehedi Hasan','Sales Manager','+01338890969','mh@gmail.com',@supplierId OUTPUT
EXEC sp_insertintosupplier 'Kina Garments','Chitagonj','Bangladesh','Usnata Akter','Sales Manager','+01449890969','ua@gmail.com',@supplierId OUTPUT
EXEC sp_insertintosupplier 'Ananta Garments','Saver','Bangladesh','Afrin Mim','Sales Manager','+01558890969','am@gmail.com',@supplierId OUTPUT
EXEC sp_insertintosupplier 'Squre Garments','Dhaka','Bangladesh','Anamika Khan','Sales Manager','+01669890969','aka@gmail.com',@supplierId OUTPUT
EXEC sp_insertintosupplier 'Baxcimco Garments','Dhaka','Bangladesh','Sarabon Ahamed','Sales Manager','+01888890969','sa@gmail.com',@supplierId OUTPUT
EXEC sp_insertintosupplier 'Stalye Garments','Barisal','Bangladesh','Amir Khan','Sales Manager','+01679890969','ak@gmail.com',@supplierId OUTPUT
EXEC sp_insertintosupplier 'jibon Garments','Saver','Bangladesh','Salman Khan','Sales Manager','+01667790969','sk@gmail.com',@supplierId OUTPUT
SELECT @supplierId 'New Id'
GO
------------------------------------------CHECK--------------------------------
SELECT * FROM tblSupplier
GO
-------------TEST UPDATE AND DELETE PROCEDURE ON tblEmpolyee---------------------------

EXEC sp_InsertUpdateData 'Syed Harun','MeherPur City,Meherpur','sr.Officer','+01586797547','qik@gmail.com',65000.00
GO
EXEC sp_InsertUpdateData 'Kamal Khan','RanjniPur,SirajGonj','sr.Officer','+01586797547','mh@gmail.com',65000.00
GO
--------------------CHECK-----------------------------------------------
SELECT * FROM tblEmpolyee
GO
-------------DELETE DATA USING STORED PROCEDURE--------------------------- 

EXEC sp_deleteEmpolyee 108
GO
--------------------CHECK-----------------------------------------------
SELECT * FROM tblEmpolyee
GO
-----INSERT DATA BY USING STORED PROCEDURE--------------------
-------INSERT DATA INTO tblexpences USING sp_expences--------------------------


EXEC sp_expences 'Empolyee Salary',1630000.00
GO
EXEC sp_expences 'Ship Rent',163000.00
GO
EXEC sp_expences 'Marketing Cost',100000.00
GO
EXEC sp_expences 'Utility Cost',10000.00
GO
-------------------CHECK--------------------
SELECT * FROM tblexpences
GO
								 --SECTION 3--
--------------------------------TRIGGER------------------------------------------
---------TEST TO DELETE,UPDATE,INSERT TRIGGER------------

DELETE FROM tblCatagory
WHERE catId=1
GO
UPDATE tblCatagory
SET catName=' Baby'
WHERE catId=3
GO
INSERT INTO tblCatagory VALUES
(NEXT VALUE FOR se_catagory,'Baby')

----------------CHECK FOR DDL TRIGGER---------------
SELECT * FROM  TableLog
GO





--------------------------TEST UDF FUNCTIONS-------------------------------

--------------------------Scalar Function---------------------------------
-----------------To find total order quantity of a buyer-----------------
SELECT dbo.fn_orderquntity(100) AS Quantity
GO 
--------------------------To find buyerwise commission--------------------
SELECT [dbo].[fn_buyerwisecommission] (101) 'Amount'
GO

-------------------------------Inline Table Valued Function-----------------------------------------------

-----To find order amount and receivable commission-----------------------------
SELECT * FROM dbo.fnbuyercommission(1)
GO
--------------------Multi-statement Table-valued Function--------------------------------------------------

--TO find order Id ,buyer Name ,supplier Name ,quantity, amount and shipment status of an order
SELECT * FROM dbo.fn_OrderDetails(5)
GO

---------------------insert Data into tblEmpCity---------------
SELECT * FROM tblEmpolyee
GO
INSERT INTO tblEmpCity VALUES
(1,'Dhaka',100),
(2,'Barishal',102),
(3,'Munsigonj',103),
(4,'Cotagaram',104)
GO
--------------------TEST DELETE AND UPDATE DATA IN A TABLE-------------
DELETE FROM tblEmpCity
WHERE cityId=1
GO
UPDATE tblEmpCity
SET cityName ='Ranpur'
WHERE cityId = 3
GO
										 --SECTION 4--
----JOIN QUARY WITH  Aggregate Function ,HAVING ,ORDRR BY AND GROUP BY CLAUSE---------------------------
----Find the buyer who order more than 9000 unit through join quary

SELECT  bu.companyName,od.quantity ,
		SUM(od.commission) AS 'BUYER WISE COMMISSION'
FROM tblOrderDeatils od
	INNER JOIN tblBuyer bu ON bu.buyerId=od.buyerId
	INNER JOIN tblSupplier su ON su.supplierId=od.supplierId
	INNER JOIN tblShipment sh ON sh.orderId=OD.orderId
	INNER JOIN tblShippers shi ON shi.shipperId=sh.shipperId
GROUP BY bu.companyName,od.quantity  
HAVING quantity>9000
ORDER BY quantity DESC


----FULL JOIN of supplier and buyer table WITH ROLLUP


SELECT DISTINCT bu.companyName,
				SUM(OD.unitPrice*OD.quantity) AS 'TOTAL',
				SU.supplierName,SU.phone
FROM tblOrderDeatils od
	FULL OUTER JOIN tblBuyer bu ON bu.buyerId=od.buyerId
	FULL OUTER JOIN tblSupplier SU ON SU.supplierId=OD.supplierId
GROUP BY bu.companyName,od.quantity,SU.supplierName,SU.phone WITH ROLLUP
GO
----------------CUBE WITH LEFT JOIN------------------------------------
SELECT  bu.companyName,od.quantity ,
		SUM(OD.quantity*OD.unitPrice) AS 'TOTAL'
FROM tblOrderDeatils od
	LEFT JOIN tblBuyer bu ON bu.buyerId=od.buyerId
	LEFT JOIN tblSupplier su ON su.supplierId=od.supplierId
	LEFT JOIN tblShipment sh ON sh.orderId=OD.orderId
	LEFT JOIN tblShippers shi ON shi.shipperId=sh.shipperId
GROUP BY bu.companyName,od.quantity WITH CUBE 
ORDER BY quantity DESC
------------GROUPING SETS  WITH RIGHT JOIN---------------
SELECT  bu.companyName,od.quantity ,
		SUM(OD.quantity*OD.unitPrice) AS 'TOTAL'
FROM tblOrderDeatils od
	RIGHT JOIN tblBuyer bu ON bu.buyerId=od.buyerId
	RIGHT JOIN tblSupplier su ON su.supplierId=od.supplierId
	RIGHT JOIN tblShipment sh ON sh.orderId=OD.orderId
	RIGHT JOIN tblShippers shi ON shi.shipperId=sh.shipperId
GROUP BY GROUPING SETS (bu.companyName,od.quantity )
ORDER BY quantity DESC
------------------------CROSS JOIN-----------------
SELECT * FROM tblOrderDeatils 
CROSS JOIN tblBuyer 
GO

--------------------------------------AGGRAGRATE FUNCTION-----------------------------------------------------
-------------------------------Average amount of money of order--------------------------------------------------------

SELECT (SUM(OD.unitPrice*OD.quantity)/COUNT(OD.buyerId)) 'Average Amount'
FROM tblOrderDeatils od
GO
------------------------------MINIMUM AND MAXIMAUM FUNCTION----------------------------------------------
--------------------------------MAXIMUM SALARY OF EMPLOYEE------------------------------
SELECT  
	emName,
	designation ,
	MAX(salary)'Top' 
FROM tblEmpolyee
GROUP BY emName,designation 
ORDER BY MAX(salary) DESC
GO
-------------------------------------MAXIMUM SALARY OF EMPLOYEE--------------------------------------------
SELECT  
	emName,
	designation ,
	MIN(salary)'BOTTOM' 
FROM tblEmpolyee
GROUP BY emName,designation 
ORDER BY MIN(salary) ASC
GO

----------------------------------SUBQURIES WITH NOT IN OPERATOR---------------------------------------
----------Find the supplier name through subquries who did not supply product to any buyer -------------------

SELECT 
	supplierId,
	supplierName 
FROM tblSupplier 
	WHERE supplierId NOT IN 
	(
		SELECT OD.supplierId
		FROM tblOrderDeatils od
		INNER JOIN tblBuyer bu ON bu.buyerId=od.buyerId
		INNER JOIN tblSupplier su ON su.supplierId=od.supplierId
	)
GO
	
--------------------------------SUBQURIES WITH  IN OPERATOR---------------------------------------------
------------Find the supplieres name through subquries who  supply product to  buyer-------------------- 

SELECT 
	supplierId,
	supplierName 
FROM tblSupplier 
WHERE supplierId IN 
	(
		SELECT OD.supplierId
		FROM tblOrderDeatils od
		INNER JOIN tblBuyer bu ON bu.buyerId=od.buyerId
		INNER JOIN tblSupplier su ON su.supplierId=od.supplierId
	)
ORDER BY supplierName ASC
GO

------------------------------SUBQUERY WITH EXISTS OPERATOR-------------------------------------------------

--------------Find the supplieres name through subquries who  supply product to  buyer--------------------

SELECT
	supplierId,
	supplierName 
FROM tblSupplier 
WHERE  EXISTS
	(
		SELECT * FROM tblOrderDeatils od
		INNER JOIN tblSupplier su ON su.supplierId=od.supplierId
		WHERE su.supplierId=od.supplierId
	)
ORDER BY supplierName DESC
GO
---------------------------------SUBQURY WITH ALL KEYWORD------------------------------------------------
----------find the supplier name and buyer name who supply to specific buyer-----------------------------------
SELECT 
	su.supplierId,
	su.supplierName,
	od.orderId,
	od.buyerId,
	bu.companyName 
FROM tblSupplier su
	INNER JOIN tblOrderDeatils OD ON OD.supplierId=su.supplierId
	INNER JOIN tblBuyer bu ON bu.buyerId=od.buyerId
WHERE su.supplierId > ALL
			(
				SELECT OD.supplierId
				FROM tblOrderDeatils od
				WHERE OD.supplierId=101
			)
ORDER BY supplierName ASC
										 --SECTION 5--
---------------------------------CTE(COMMON TABLE EXPRESSIONS)-------------------------------------------
-----------find the  buyer name and order quantity  who order most and lowest-------------------------------
WITH topBuyer
AS
	(
		SELECT TOP 3 bu.companyName,od.quantity ,
					SUM(OD.quantity*OD.unitPrice) AS 'BUYER'
		FROM tblOrderDeatils od
			INNER JOIN tblBuyer bu ON bu.buyerId=od.buyerId
			INNER JOIN tblSupplier su ON su.supplierId=od.supplierId
			INNER JOIN tblShipment sh ON sh.orderId=OD.orderId
			INNER JOIN tblShippers shi ON shi.shipperId=sh.shipperId
		GROUP BY bu.companyName,od.quantity  
		ORDER BY quantity DESC
	),
LowestBuyer
AS
	(
		SELECT TOP 3 bu.companyName,od.quantity ,
					SUM(OD.quantity*OD.unitPrice) AS 'BUYER'
		FROM tblOrderDeatils od
			INNER JOIN tblBuyer bu ON bu.buyerId=od.buyerId
			INNER JOIN tblSupplier su ON su.supplierId=od.supplierId
			INNER JOIN tblShipment sh ON sh.orderId=OD.orderId
			INNER JOIN tblShippers shi ON shi.shipperId=sh.shipperId
		GROUP BY bu.companyName,od.quantity  
		ORDER BY quantity ASC
	)
SELECT * FROM topBuyer
UNION ALL
SELECT * FROM LowestBuyer
GO
-----------------------------CREATE A TABLE WITH INTO STATEMENT-------------------------------------------
------create a table with select into statements and add a calculted column to find buying house balance after tax
SELECT  
	SUM(A.commission)AS 'Total Earning',
	SUM(EX.exAmount)'Total expences',
	AVG(A.tax) 'tax'  
INTO tblBalance 
FROM tblAccounts A
FULL OUTER JOIN balance B ON B.trId=A.trId
FULL OUTER JOIN tblexpences EX ON B.ID=EX.Id
GO
-------------------------------------------CHECK----------------------------------------------------------
SELECT * FROM tblBalance
GO
------------------------------ADD CALCULATE COLUMN--------------------------------------------------------
ALTER TABLE tblBalance
ADD  totalProfit AS (([Total Earning]-[Total expences])*(1-tax))
GO
-------------------------------------------CHECK----------------------------------------------------------
SELECT * FROM tblBalance
GO


---------------------------------------------DROP TABLE ,COLUMN------------------------------------------

DROP TABLE tblBalance
GO
ALTER TABLE tblBlance
DROP COLUMN tax 
GO 
ALTER TABLE tblBlance 
ALTER COLUMN [Total Earning] MONEY;
GO

------------------------------------------CASE---------------------------------------------------------
----Find the buyer name ,order quantity and order amount then add comment column with CASE fauntion ------
SELECT  bu.companyName,od.quantity ,
		SUM(OD.quantity*OD.unitPrice) AS Total,
	CASE
		od.quantity WHEN 78000 THEN 'THE TOP CLIENT'
		ELSE 'MODARET CLIENT'
		END AS COMMENTS
		FROM tblOrderDeatils od
			INNER JOIN tblBuyer bu ON bu.buyerId=od.buyerId
			INNER JOIN tblSupplier su ON su.supplierId=od.supplierId
			INNER JOIN tblShipment sh ON sh.orderId=OD.orderId
			INNER JOIN tblShippers shi ON shi.shipperId=sh.shipperId
		GROUP BY bu.companyName,od.quantity  
		ORDER BY quantity DESC
GO

------------------------------------CAST AND CONVERT-------------------------------------------------------

----------------------------------Shipment Date convert into varchar--------------------------------------

DECLARE @shipmentdate DATETIME
SET @shipmentdate=
				(
					SELECT [date] FROM tblShipment
					WHERE shipmentId=1004
				)
SELECT CONVERT (VARCHAR,@shipmentdate,107) AS [Date]
GO

----------------------------------------------CAST ------------------------------------------------------
SELECT 
	cityName,
	empId,
	CAST(cityName AS nvarchar(50)) AS location,
	CAST(empId AS nchar(5)) AS ID
FROM tblEmpCity
GO

---------------------USE LIKE OPERATOR AND LENTH FUNCTION--------------------------------------------------
SELECT
	emName,
	email,
	phone 
FROM tblEmpolyee
WHERE designation LIKE ('%Manager')
ORDER BY LEN(emName)
GO



----------------------------------ISNULL AND COLAESCE FUNCTION-----------------------------------------------

SELECT  
	emName,
	designation ,
	ISNULL(designation,'Officer') AS 'NEW Designation'
FROM tblEmpolyee
GO
--------------------------GROUPING FUNCTION--------------------------------------------------
SELECT  
	CASE
		WHEN GROUPING(country)=1 THEN 'ALL'
		ELSE country
	END AS country,
	COUNT (buyerId) AS buyer	
FROM tblBuyer
GROUP BY country WITH ROLLUP
GO
------------------------------------MERGE----------------------------------------------------------
MERGE tblOrderDeatils AS Target
USING tblShipment AS Source
ON Source.orderId = Target.orderId
WHEN MATCHED  THEN
UPDATE SET Target.date=Source.date
WHEN NOT MATCHED BY Target THEN
    INSERT (date) 
    VALUES (Source.date)
WHEN NOT MATCHED BY Source 
THEN DELETE;
------------------------------------------WHILE LOOP--------------------------------------------------------
SELECT * FROM tblSupplier
DECLARE @Counter INT , @MaxId INT, 
        @cityName VARCHAR(40)
SELECT @Counter = min(supplierId) , @MaxId = max(supplierId) 
FROM tblSupplier
 
WHILE(@Counter IS NOT NULL
      AND @Counter <= @MaxId)
BEGIN
   SELECT @cityName = city
   FROM tblSupplier WHERE supplierId = @Counter
    
   PRINT CONVERT(VARCHAR,@Counter) + '. city name is ' + @cityName  
   SET @Counter  = @Counter  + 1        
END
-------------------------------------IF......ELSE STATEMENT----------------------------------------------
DECLARE @quantity INT,
		@amount MONEY,
		@name varchar(40)
SELECT  @name=bu.companyName,@quantity=SUM(od.quantity) ,
		@amount=SUM(od.quantity*od.unitPrice) 
FROM tblOrderDeatils od
	INNER JOIN tblBuyer bu ON bu.buyerId=od.buyerId
	WHERE  BU.country LIKE 'USA'
GROUP BY bu.companyName  

ORDER BY SUM(od.quantity) DESC
IF @quantity >=50000
	BEGIN
		PRINT 'Top Buyer'
	END
ELSE IF @quantity <= 2000
	BEGIN
		PRINT 'Lowest Buyer'
	END
ELSE
	PRINT 'Modarate Buyer'
GO
----------------------------------WAITFOR---------------------------------------------


DECLARE @waitfortime DATETIME

SET @waitfortime = DATEADD(second,15,GETDATE())

SELECT GETDATE() As timethen

WAITFOR TIME @waitfortime

SELECT GETDATE() As timeNow
GO
------------------------------------------------OVER-------------------------------------------------
SELECT  
		bu.companyName,
	    SUM(od.quantity) OVER (PARTITION BY 'companyName')AS 'TOTAL Quantity',
		SUM(OD.quantity*OD.unitPrice) OVER (ORDER BY quantity)AS Total
		FROM tblOrderDeatils od
			INNER JOIN tblBuyer bu ON bu.buyerId=od.buyerId
			INNER JOIN tblSupplier su ON su.supplierId=od.supplierId
			INNER JOIN tblShipment sh ON sh.orderId=OD.orderId
			INNER JOIN tblShippers shi ON shi.shipperId=sh.shipperId
GO


										 --SECTION 6--
---------------------------------------TRANSACTION---------------------------------------------------------
------------------------------ROLLBACK TRANSACTION---------------------------------------------------
BEGIN TRAN
UPDATE tblEmpolyee 
SET    emName= 'Himesh Khanna' 
          WHERE emId=109
 
 
SELECT * FROM tblEmpolyee 
	WHERE emId=109
 
ROLLBACK TRAN 
 
SELECT * FROM tblEmpolyee 
	WHERE emId=109
GO
----------------------------COMMIT TRANSACTION-------------------------------------------------------

BEGIN TRAN
INSERT INTO tblEmpCity 
VALUES(5,'JOSIR',107)
    
UPDATE tblEmpCity SET empId='UNKNOWN' WHERE cityId=4
SELECT * FROM tblEmpCity
 COMMIT TRAN
GO

---------3
BEGIN TRAN;
DELETE tblEmpCity
WHERE cityId=5
IF @@ROWCOUNT<=1
	BEGIN
		ROLLBACK TRAN
		PRINT 'City is inserted once '
	END
ELSE 
	BEGIN 
		COMMIT TRAN
		PRINT'Deletion Committed'
	END
GO
	

	---------------------**********************************************---------------------------------------