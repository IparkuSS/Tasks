USE [BankingSystem]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[ADD_BalanceCard]
ON [dbo].[Cards]
AFTER  INSERT, UPDATE
AS 
begin
	DECLARE @BalanceAccount FLOAT
	DECLARE @Id int
	DECLARE @BalanceCard float
	DECLARE @BalanceAllCards float

	SELECT @Id = (Select AccountId 
	FROM deleted)

	SELECT @BalanceAccount = (Select Accounts.Balance 
	FROM Accounts
	WHERE Accounts.AccountId = @Id)
	
	SELECT @BalanceCard = (SELECT Balance 
	FROM inserted
	where  AccountId = @Id )

	SELECT @BalanceAllCards = (SELECT SUM(Balance) 
	FROM Cards
	where  AccountId = @Id)

	IF @BalanceAccount < @BalanceAllCards 
	 BEGIN
        PRINT 'error'
        ROLLBACK TRANSACTION
    END
    ELSE
        PRINT 'change completed'
END
