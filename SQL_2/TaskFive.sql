USE BankingSystem;
GO
CREATE PROCEDURE AccrualMoney AS
    UPDATE Accounts
	SET Balance += (SELECT ISNULL(SUM(SocialStatuses.Accrual),0)
						 FROM Statuses
						 JOIN SocialStatuses on SocialStatuses.SocialStatusId = Statuses.SocialStatusId
						 where Clients.ClientId = Statuses.ClientsId)
	FROM Accounts
	JOIN Clients on Clients.ClientId = Accounts.AccountId
	