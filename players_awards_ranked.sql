-- The code below creates a stored procedure to rank the players for each year for number of awards


-- List Stored Procedures
-- show procedure status;


-- Drop Stored Procedure
-- drop procedure players_awards_ranked;

DELIMITER //
CREATE PROCEDURE players_awards_ranked ()
BEGIN
	SELECT 
		@rank:=CASE
			WHEN @year = year and @total_awards != total_awards THEN @rank  + 1
			WHEN @year = year and @total_awards = total_awards THEN @rank
			ELSE 1
		END AS rank,
		@year:=year as year,
		playerID,
		@total_awards:=total_awards as total_awards
	FROM 
	(
		SELECT playerID, 
		   	   year,
		   	   count(award) as total_awards
		FROM awardsplayers
		GROUP BY year, playerID
		ORDER BY year desc, total_awards desc
	) a
	JOIN (SELECT @rank:=0) b;
END //
DELIMITER ;


/*
-- This is a simplier query that orders the players by their total awards for that year
DELIMITER //
CREATE PROCEDURE players_awards_ranked ()
BEGIN
	SELECT playerID, year, count(award) as total_awards
    FROM awardsplayers
    GROUP BY year, playerID
    ORDER BY year desc, total_awards desc;
END //
DELIMITER ;
*/

-- CALL players_awards_ranked();
