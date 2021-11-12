CREATE PROCEDURE CreditingMoneyToAccount 
@socialStatuseId int
AS
UPDATE Accounts
SET Balance += SocialStatuse.Accrual
FROM Accounts
	JOIN Clients on Clients.Id = Accounts.ClientsId
	JOIN Statuses on Statuses.ClientsId = Clients.Id
	JOIN SocialStatuse on SocialStatuse.Id = Statuses.SocialStatusId
WHERE SocialStatuse.Id = @socialStatuseId
		AND Statuses.SocialStatusId = @socialStatuseId