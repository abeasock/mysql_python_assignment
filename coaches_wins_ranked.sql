-- Query to rank the coaches for each year by number of wins

SELECT 
	@rank:=CASE
		WHEN @year = year and @total_wins != total_wins THEN @rank  + 1
		WHEN @year = year and @total_wins = total_wins THEN @rank
		ELSE 1
	END AS rank,
	@year:=year as year,
	coachID,
	@total_wins:=total_wins as total_wins
FROM 
(
	SELECT coachID, 
	   	   year,
	   	   sum(w) as total_wins
	FROM coaches
	GROUP BY year, coachID
	ORDER BY year desc, total_wins desc
) a
JOIN (SELECT @rank:=0) b


/*
-- This is a simplier query that orders the coaches by their total wins for that year
SELECT coachID, year, sum(w) as wins
FROM coaches
GROUP BY year, coachID
ORDER BY year desc, wins desc;
*/