USE [BankingSystem]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[ADD_BALANCE] ON [dbo].[Accounts] AFTER  INSERT, UPDATE
AS 
begin
	DECLARE @BalanceCard FLOAT
	DECLARE @Id int
	DECLARE @BalanceAcc FLOAT

	SELECT @Id = (Select AccountId 
	FROM deleted)
    
	SELECT @BalanceAcc =  (Select SUM(Balance)
	FROM inserted)
	
	SELECT @BalanceCard = (SELECT SUM(Cards.Balance) 
	FROM Cards
	where  Cards.AccountId = @Id )



	IF @BalanceAcc < @BalanceCard
	 BEGIN
        PRINT 'error'
        ROLLBACK TRANSACTION
    END
    ELSE
        PRINT 'change completed'
END

