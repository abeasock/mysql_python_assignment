LOAD DATA INFILE '/Users/Beasock/Data/hockey_download/master.csv'
INTO TABLE master 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA INFILE '/Users/Beasock/Data/hockey_download/coaches.csv'
INTO TABLE coaches 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA INFILE '/Users/Beasock/Data/hockey_download/awardsplayers.csv'
INTO TABLE awardsplayers 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;