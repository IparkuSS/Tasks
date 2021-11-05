CREATE PROCEDURE AvailableAmountOfMoney AS
  SELECT Accounts.AccountId, Clients.Surname, Accounts.Balance - (SELECT ISNULL(SUM(Cards.Balance ),0) 
																FROM Cards
																WHERE Accounts.AccountId = Cards.AccountId)
   FROM Clients
   JOIN Accounts on Accounts.ClientsId = Clients.ClientId
  