create procedure AccountToCardTransaction 
@accountId int,  
@CardId int, 
@transferAmount float
as
declare @accountUpdateErr int  
declare @cardUpdateErr int  
declare @err_message nvarchar(max)
declare @checkAmount int  
declare @maxerr int  
set @maxerr = 0 
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; 
BEGIN TRANSACTION 

SELECT @checkAmount  = (SELECT Accounts.Balance - (SELECT ISNULL(SUM(Cards.Balance ),0) 
											FROM Cards
											WHERE @accountId = Cards.AccountId)
						FROM Accounts
						WHERE Accounts.Id = @accountId)

IF  @transferAmount > @checkAmount
    BEGIN
        SET @err_message = 'Transaction rolled back'
        RAISERROR(@err_message, 16, 1)
END;

	UPDATE Cards
	SET Balance += @transferAmount 
	WHERE Id = @CardId
		 AND  AccountId = @accountId

set @cardUpdateErr = @@error  
	if @cardUpdateErr > @maxerr  
set @maxerr = @cardUpdateErr

	if @maxerr <> 0  
begin  
	ROLLBACK  
		print 'Transaction rolled back'  
end  
else  
begin  
	COMMIT  
		print 'Transaction committed'  
end  
print 'SETCARD error number:' + cast(@cardUpdateErr as nvarchar(8))
return @maxerr