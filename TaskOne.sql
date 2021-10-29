SELECT NameBank
FROM Branches
	JOIN Banks on Banks.BankId = Branches.BankId
	JOIN Cities on Cities.—ityId = Branches.—ityId
WHERE Cities.Name—ity= 'Minsk'