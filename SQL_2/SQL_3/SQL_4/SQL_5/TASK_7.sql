create procedure AccountToCardTransaction 
@accountId int,  
@CardId int, 
@transferAmount float
AS
declare @err_message nvarchar(max)
declare @checkAmount float
declare @checkId int

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; 
BEGIN TRANSACTION 

SELECT @checkAmount = 
	(SELECT Accounts.Balance - (SELECT ISNULL(SUM(Cards.Balance ),0) 
								FROM Cards
								WHERE @accountId = Cards.AccountId)
	FROM Accounts
	WHERE Accounts.Id = @accountId)

SELECT @checkId = 
	(SELECT Id
	 FROM Cards
	 WHERE Id = @CardId
		 AND  AccountId = @accountId)

IF  @checkId IS NULL
    BEGIN
        SET @err_message = 'transferring money to the wrong card'
        RAISERROR(@err_message, 16, 1)
		ROLLBACK
			RETURN
	END;

IF  @transferAmount > @checkAmount
    BEGIN
        SET @err_message = 'amount transferred is more than the amount on the card!'
        RAISERROR(@err_message, 16, 1)
		ROLLBACK
			RETURN
	END;

UPDATE Cards
SET Balance += @transferAmount 
WHERE Id = @CardId
	AND  AccountId = @accountId
 
BEGIN  
	COMMIT  
		PRINT 'Transaction committed'  
END;  
