SELECT Clients.Name, Accounts.Balance - SUM(Cards.Balance) AS difference 
FROM Accounts 
	JOIN Cards on Cards.AccountId = Accounts.AccountId
	JOIN Clients on Clients.ClientId = Accounts.ClientsId
GROUP BY Clients.Name, Accounts.Balance
HAVING Accounts.Balance  - SUM(Cards.Balance) != 0