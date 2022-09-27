USE BANK;

START TRANSACTION;

SELECT 
	@moneyavailable :=IF(balance > 0, balance,0) AS MONEY
    -- if the balance is greater than 0, we want the balance. But if it isn't greater than 0, it's the second argument (0) 
    FROM 
		accounts 
    WHERE 
		account_number = 111112
        AND account_holder_name = 'Julie';

-- the following code takes the £50 from julies account         
SET @transferamount = 50;
-- this sets however much you want to transfer

UPDATE accounts
SET 
	balance = balance - @transferamount
-- so their balance, minus the transferamount 
WHERE 
	account_number = 111112
and account_holder_name = 'Julie';

-- the followind code gives that £50 to jasper:
UPDATE accounts
SET 
	balance = balance + @transferamount
WHERE
account_number = 11115
and account_holder_name = 'Jasper';

-- if autocommit is on, the above code would be autocommited (turn this off!!)

-- if you want to not do the above code, or you want to avoid the autocommit put/ end the code with:
-- ROLLBACK;

-- but if autocommit is off, to commit the code put:
-- COMMIT; 
