
# Get the details of a player who won the maximum number of awards for
# a year during which the coach for that team also has the maximum wins

SELECT master.*, awards_wins.tmID, awards_wins.total_awards, awards_wins.coachID AS coaches_most_wins, awards_wins.total_wins as coaches_total_win
FROM
(
	SELECT scoring_awards.playerID, scoring_awards.tmID, scoring_awards.year, scoring_awards.total_awards, coaches_most_wins.coachID, coaches_most_wins.total_wins
	FROM
	(
		SELECT scoring.playerID, scoring.tmID, players_most_awards.year, players_most_awards.total_awards
		FROM 
		( 
			SELECT playerId, year, tmID
			FROM scoring 
			ORDER BY playerID
		) scoring
		JOIN (
			SELECT awards_total_2.playerID, awards_total_2.year, awards_total_2.total_awards
			FROM 
			(
				SELECT year, max(total_awards) as total_awards_max
				FROM 
				(
					SELECT playerID, year, count(award) as total_awards
					FROM awardsplayers
					GROUP BY year, playerID
					ORDER BY year desc, total_awards desc
				) awards_total
				GROUP BY year
			) awards_max
			JOIN (
					SELECT playerID, year, count(award) as total_awards
					FROM awardsplayers
					GROUP BY year, playerID
					ORDER BY year desc, total_awards desc
				) awards_total_2
			ON awards_max.year = awards_total_2.year
			WHERE awards_max.total_awards_max = awards_total_2.total_awards
			ORDER BY year desc
		) players_most_awards
		ON scoring.playerID = players_most_awards.playerID and scoring.year = players_most_awards.year
	) scoring_awards
	JOIN (
		SELECT wins_total_2.coachID, wins_total_2.tmID, wins_total_2.year, wins_total_2.total_wins
		FROM 
		(
			SELECT year, max(total_wins) as total_wins_max
			FROM 
			(
				SELECT coachID, tmID, year, sum(w) as total_wins
				FROM coaches
				GROUP BY year, coachID
				ORDER BY year desc, total_wins desc
			) wins_total
			GROUP BY year
		) wins_max
		JOIN (
				SELECT coachID, tmID, year, sum(w) as total_wins
				FROM coaches
				GROUP BY year, coachID
				ORDER BY year desc, total_wins desc
			) wins_total_2
		ON wins_max.year = wins_total_2.year
		WHERE wins_max.total_wins_max = wins_total_2.total_wins
		ORDER BY year desc
	) coaches_most_wins
	ON scoring_awards.tmID = coaches_most_wins.tmID AND scoring_awards.year = coaches_most_wins.year
	ORDER BY year desc
) awards_wins
JOIN 
( 
	SELECT *
	FROM master 
	WHERE playerID != ''
) master
ON awards_wins.playerID = master.playerID;
