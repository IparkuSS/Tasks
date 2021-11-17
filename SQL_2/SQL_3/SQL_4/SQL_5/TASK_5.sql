CREATE PROCEDURE CreditingMoneyToAccount 
@socialStatuseId int
AS
UPDATE Accounts
SET Balance += SocialStatuse.Accrual
FROM Accounts
	JOIN Clients on Clients.Id = Accounts.ClientId
	JOIN Statuses on Statuses.ClientId = Clients.Id
	JOIN SocialStatuse on SocialStatuse.Id = Statuses.SocialStatusId
WHERE Statuses.SocialStatusId = @socialStatuseId
--I thought it would not pull up the data without this condition