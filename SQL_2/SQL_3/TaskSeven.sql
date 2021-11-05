create procedure AccountToCardTransaction 
@accountId int,  
@CardId int, 
@transferAmount float
as
declare @accountUpdateErr int  
declare @cardUpdateErr int  
declare @maxerr int  
set @maxerr = 0 
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; 
BEGIN TRANSACTION 
BEGIN TRY 
	UPDATE Accounts
	SET Balance -= @transferAmount
	FROM Accounts
	WHERE Accounts.AccountId = @accountId
		AND @accountId = (SELECT Cards.AccountId
						  FROM Cards
						  WHERE Cards.IdCard = @CardId)
set @accountUpdateErr = @@error  
	if @accountUpdateErr > @maxerr  
set @maxerr = @accountUpdateErr
	if @maxerr <> 0  
begin  
	ROLLBACK  
		print 'Transaction rolled back'  
end 
	UPDATE Cards
	SET Balance += @transferAmount 
	WHERE IdCard = @CardId
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
print 'SETACCOUNT error number:' + cast(@accountUpdateErr as nvarchar(8))  
print 'SETCARD error number:' + cast(@cardUpdateErr as nvarchar(8))
return @maxerr
END TRY  
	BEGIN CATCH  
		ROLLBACK  
			print 'Transaction rolled back, exception was thrown'  
END CATCH;  