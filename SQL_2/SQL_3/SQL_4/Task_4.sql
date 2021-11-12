SELECT SocialStatuse.Id,COUNT(Cards.Id) AS Count
FROM Statuses
FULL OUTER JOIN SocialStatuse on SocialStatuse.Id = Statuses.SocialStatusId
FULL OUTER JOIN Clients on Clients.Id = Statuses.ClientsId
FULL OUTER JOIN Accounts on Accounts.ClientsId = Clients.Id
FULL OUTER JOIN Cards ON Cards.AccountId = Accounts.Id
GROUP BY SocialStatuse.Id
