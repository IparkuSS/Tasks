SELECT SocialStatuse.Id,MAX(SocialStatuse.Name) AS Name ,COUNT(Cards.Id) AS Count
FROM Statuses
RIGHT OUTER JOIN SocialStatuse on SocialStatuse.Id = Statuses.SocialStatusId
LEFT OUTER JOIN Clients on Clients.Id = Statuses.ClientId
LEFT OUTER JOIN Accounts on Accounts.ClientId = Clients.Id
LEFT OUTER JOIN Cards ON Cards.AccountId = Accounts.Id
GROUP BY SocialStatuse.Id