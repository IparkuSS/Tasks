SELECT Cards.Id, Clients.Name, Cards.Balance, Banks.Name
FROM Cards
	JOIN Accounts on Accounts.Id = Cards.AccountId
	FULL OUTER JOIN Clients on Clients.Id = Accounts.Id
	JOIN Banks on Banks.Id = Accounts.BankId



