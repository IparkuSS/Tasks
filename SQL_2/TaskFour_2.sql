SELECT SocialStatuses.Name,COUNT(*) AS Count
FROM Cards
JOIN SocialStatuses on SocialStatuses.SocialStatusId = Cards.SocialStatusId
GROUP BY SocialStatuses.Name 

