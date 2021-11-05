CREATE TRIGGER AccountBalanceCheck
ON Accounts
AFTER INSERT, UPDATE
AS 
begin
BEGIN TRY
IF EXISTS   
(
	SELECT inserted.AccountId 
	FROM inserted
	JOIN Cards ON Cards.AccountId = inserted.AccountId 
	GROUP BY inserted.Balance, inserted.AccountId
	HAVING inserted.Balance < SUM(Cards.Balance)
)			
THROW 50000, N'Account balance cannot be less than card balance', 1;
  END TRY
  BEGIN CATCH
    IF (@@TRANCOUNT > 0)
      ROLLBACK;
    THROW; 
  END CATCH;
END;