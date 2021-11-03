USE BankingSystem;
GO
CREATE TRIGGER AddBalanceForAccaunt
ON Accounts
AFTER INSERT, UPDATE
AS
begin
BEGIN TRY
IF EXISTS   
(
	SELECT inserted.AccountId 
	FROM inserted
	WHERE ((inserted.Balance <	(SELECT SUM(Cards.Balance)
								FROM Cards
								WHERE inserted.AccountId = Cards.AccountId)))
)			
THROW 50000, N'card balance is less than account balance', 1;
  END TRY
  BEGIN CATCH
    IF (@@TRANCOUNT > 0)
      ROLLBACK;
    THROW; 
  END CATCH;
END;