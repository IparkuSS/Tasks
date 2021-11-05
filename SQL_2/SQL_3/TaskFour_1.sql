SELECT SocialStatuse.Name,(SELECT COUNT(*) 
							FROM Cards
								JOIN Accounts on Accounts.AccountId = Cards.AccountId
								JOIN Clients on Clients.ClientId = Accounts.ClientsId
								JOIN Statuses on Statuses.ClientsId = Clients.ClientId 
							WHERE SocialStatuse.SocialStatusId = Statuses.SocialStatusId ) AS Count
FROM SocialStatuse