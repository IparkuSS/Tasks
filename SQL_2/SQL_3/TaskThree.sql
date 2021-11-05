SELECT Clients.Name, Accounts.Balance - (SELECT ISNULL(SUM(Cards.Balance ),0) 
									   	FROM Cards
										WHERE Accounts.AccountId = Cards.AccountId) AS difference 
FROM Accounts 
	JOIN Clients on Clients.ClientId = Accounts.ClientsId
WHERE  Accounts.Balance - (SELECT ISNULL(SUM(Cards.Balance ),0)  
							FROM Cards
							WHERE Accounts.AccountId = Cards.AccountId)!=0