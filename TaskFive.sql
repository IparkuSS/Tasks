USE [BankingSystem]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_Accrual] AS
BEGIN
    UPDATE Accounts
	SET Balance += 10 * (SELECT COUNT(Statuses.SocialStatusId)
						 FROM Statuses
						 where Clients.ClientId = Statuses.ClientsId)
	FROM Accounts
	JOIN Clients on Clients.ClientId = Accounts.AccountId
	
END;