USE [BankingSystem]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_Balance]
AS
BEGIN
   SELECT Clients.Surname, Accounts.Balance - SUM(Cards.Balance) AS Excess 
   FROM Clients
   JOIN Accounts on Accounts.ClientsId = Clients.ClientId
   JOIN Cards on Cards.AccountId = Accounts.AccountId
   GROUP BY  Clients.Surname,Accounts.Balance
   HAVING Accounts.Balance  - SUM(Cards.Balance) != 0
END;
