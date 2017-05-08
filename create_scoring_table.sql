CREATE TABLE IF NOT EXISTS scoring (
	playerID VARCHAR(20),	
	year INT, 
	stint INT,
	tmID VARCHAR(5),	
	lgID VARCHAR(4),
	pos VARCHAR(2),
	GP INT,
	G INT,
	A INT, 
	Pts INT, 
	PIM INT, 
	over_under INT, 	
	PPG INT, 
	PPA INT, 
	SHG INT, 
	SHA INT, 
	GWG INT, 
	GTG INT, 
	SOG INT, 
	PostGP INT, 
	PostG INT, 
	PostA INT, 
	PostPts INT, 
	PostPIM INT, 
	Post_Over_Under INT, 
	PostPPG INT, 
	PostPPA INT, 
	PostSHG INT, 
	PostSHA INT, 
	PostGWG INT, 
	PostSOG INT,
	PRIMARY KEY (playerID, year, stint, tmID)
);


LOAD DATA INFILE '/Users/Beasock/Data/hockey_download/scoring.csv'
INTO TABLE scoring 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;