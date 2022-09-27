USE SHOP;

SELECT * FROM SALES;

-- CREATE OR REPLACE MEANS THAT IF A VIEW HAS ALREADY BEEN CREATED WITH THAT NAME, 
-- IT WILL BE REPLACED WITH THIS ONE:

-- Creates a view of the average sales of the sales people:

CREATE OR REPLACE VIEW v_avg_sales
as
SELECT salesperson, avg(SalesAmount) as AverageSales
from sales1
group by SalesPerson;

select * from v_avg_sales;

-- create a function that decides if a sales person is eligible for a bonus: 

-- make sure the datatype of the new function is the same as the column it will be using
-- in this case, 'bonus' has to be decimal - same as the SalesAmount column

DELIMITER // 
-- this part of the code declares / creates the variable
CREATE FUNCTION bonus(avgsales decimal(6,2))
RETURNS VARCHAR (10)
DETERMINISTIC 
BEGIN
DECLARE bonus_e VARCHAR(10);
-- this part of the code creates the logic:
IF avgsales = 60 THEN
SET bonus_e = 'yes';
ELSEIF avgsales < 60 THEN
SET bonus_e = 'no';
END IF;
RETURN(bonus_e);
END//
DELIMITER ;

-- using the function. This will give the person, their sales average, and it will also
-- use the average sales to run the function and then give the yes/ no answer in a column
-- called 'bonus:

SELECT SalesPerson, AverageSales, bonus(AverageSales)
from v_avg_sales;

-------------

USE BAKERY;

SELECT * FROM sweet;

DELIMITER //

-- DEFINE PROCEDURE:

CREATE PROCEDURE insertvalue(
IN item_id INT, 
IN name VARCHAR(50),
IN price FLOAT 
)

-- PROCEDURE LOGIC - inserting values into specific columns to add new products
-- insert into - the columns . then the values you're inserting - as declared above:
BEGIN
INSERT INTO SWEET(ID, ITEM_NAME, PRICE)
VALUES (item_id, item, price);

END//
DELIMITER ;

-- CALL / RUN THE PROCEDURE: 
-- a function needs to be used inside a query, but a procedure can be ran on its own

call insertvalue(7, 'cookie', 1);

SELECT POW(4,5)




