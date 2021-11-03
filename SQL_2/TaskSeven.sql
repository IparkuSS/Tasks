create procedure MoneyTransfer 
@accountId INT,  
@CardId INT, 
@transferAmount FLOAT
as
declare @setAccount INT  
declare @setCard INT  
declare @maxerr INT  
set @maxerr = 0 

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; 
BEGIN TRANSACTION 
BEGIN TRY 
	UPDATE Accounts
	SET Balance -= @transferAmount
	WHERE AccountId = @accountId
	set @setAccount = @@error  
		if @setAccount > @maxerr  
	set @maxerr = @setAccount
		if @maxerr <> 0  
	begin  
		ROLLBACK  
		print 'Transaction rolled back'  
	end 
	UPDATE Cards
	SET Balance += @transferAmount 
	WHERE IdCard = @CardId
		 and  AccountId = @accountId

	set @setCard = @@error  
		if @setCard > @maxerr  
	set @maxerr = @setCard
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
		print 'SETACCOUNT error number:' + cast(@setAccount as nvarchar(8))  
		print 'SETCARD error number:' + cast(@setCard as nvarchar(8))
		return @maxerr
END TRY  
	BEGIN CATCH  
		ROLLBACK  
		print 'Transaction rolled back, exception was thrown'  
END CATCH;  