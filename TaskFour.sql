SELECT SocialStatuses.Name, 
		(SELECT COUNT(Cards.SocialStatusId) 
		FROM Cards 
		WHERE SocialStatuses.SocialStatusId = Cards.SocialStatusId ) AS Count
FROM SocialStatuses