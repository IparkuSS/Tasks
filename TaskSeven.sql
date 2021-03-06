USE [BankingSystem]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_MoneyTransfer]
@accountId int,  
@CardId int, 
@transferAmount float
AS
declare @setAcc int  
declare @setCard int  
declare @maxerr int  
set @maxerr = 0 
BEGIN TRANSACTION 

	UPDATE Accounts
	SET Balance -= @transferAmount
	WHERE AccountId = @accountId
			

set @setAcc = @@error  
	if @setAcc > @maxerr  
set @maxerr = @setAcc

	UPDATE Cards
	SET Balance += @transferAmount
	WHERE IdCard = @CardId
		 AND  AccountId = @accountId

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
print 'SETACCOUNT error number:' + cast(@setAcc as nvarchar(8))  
print 'SETCARD error number:' + cast(@setCard as nvarchar(8))
return @maxerr