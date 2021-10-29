SELECT Banks.NameBank, Cards.OwnerName, Cards.Balance
FROM Cards
	JOIN Banks on Banks.BankId = Cards.BankId