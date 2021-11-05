CREATE PROCEDURE CreditingMoneyToAccount AS
    UPDATE Accounts
	SET Balance += (SELECT ISNULL(SUM(SocialStatuses.Accrual),0)
						 FROM Statuses
						  JOIN SocialStatuses on SocialStatuses.SocialStatusId = Statuses.SocialStatusId
						 WHERE Clients.ClientId = Statuses.ClientsId)
	FROM Accounts
	JOIN Clients on Clients.ClientId = Accounts.AccountId

--Добавление идет без зависимости от количества карт.