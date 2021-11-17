SELECT Accounts.Id, MAX(Accounts.Balance) - ISNULL(SUM(Cards.Balance ),0)  AS difference 
FROM Accounts 
	LEFT OUTER JOIN Cards on Cards.AccountId = Accounts.Id
GROUP BY Accounts.Id
HAVING SUM(Accounts.Balance) >  ISNULL(SUM(Cards.Balance ),0) 