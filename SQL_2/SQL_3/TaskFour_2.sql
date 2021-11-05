SELECT SocialStatuse.Name,COUNT(Cards.IdCard) AS Count
FROM Statuses
JOIN SocialStatuse on SocialStatuse.SocialStatusId= Statuses.SocialStatusId
JOIN Clients on Clients.ClientId = Statuses.ClientsId
JOIN Accounts on Accounts.AccountId = Clients.ClientId
JOIN Cards ON Cards.AccountId = Accounts.AccountId 
GROUP BY SocialStatuse.Name