SELECT SocialStatuses.Name,(SELECT COUNT(*) 
							FROM Cards 
							WHERE SocialStatuses.SocialStatusId = Cards.SocialStatusId ) AS Count
FROM SocialStatuses