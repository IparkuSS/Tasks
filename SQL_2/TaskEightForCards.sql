USE BankingSystem;
GO
CREATE TRIGGER AddBalanceForCards
ON Cards
AFTER INSERT, UPDATE
AS
begin
BEGIN TRY
IF EXISTS   
(
	SELECT inserted.IdCard 
	FROM inserted
	WHERE ((inserted.Balance + (SELECT isnull(SUM(Cards.Balance),0) 
								FROM Cards 
								WHERE Cards.AccountId = inserted.AccountId
								AND Cards.IdCard != inserted.IdCard )) > (SELECT Accounts.Balance
																		FROM Accounts 
																		WHERE inserted.AccountId = Accounts.AccountId))
)

THROW 50000, N'card balance is greater than account balance!', 1;
  END TRY
  BEGIN CATCH
    IF (@@TRANCOUNT > 0)
      ROLLBACK;
    THROW; 
  END CATCH;
END;