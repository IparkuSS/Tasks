CREATE TRIGGER AccountBalanceCheck
ON Accounts
AFTER INSERT, UPDATE
AS 
BEGIN
IF EXISTS   
(
	SELECT inserted.Id 
	FROM inserted
	JOIN Cards ON Cards.AccountId = inserted.Id 
	GROUP BY inserted.Id 
	HAVING MAX(inserted.Balance) < SUM(Cards.Balance)
)			
RAISERROR ('Account balance cannot be less than card balance', 16,1);  
END;