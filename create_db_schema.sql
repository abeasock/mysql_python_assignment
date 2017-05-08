-- This file creates a database named 'hockey' and includes schemas for the following tables: Master, Coaches, & AwardsPlayers

CREATE database hockey;

USE hockey;

CREATE TABLE IF NOT EXISTS master (
	playerID VARCHAR(20),	
	coachID VARCHAR(20),
	hofID VARCHAR(20),
	firstName VARCHAR(32),
	lastName VARCHAR(32),
	nameNote VARCHAR(100),
	nameGiven VARCHAR(64),
	nameNick VARCHAR(64),
	height INT,
	weight INT, 
	shootCatch CHAR(1),
	legendsID VARCHAR(20),
	ihdbID INT,
	hrefID VARCHAR(20),
	firstNHL INT,
	lastNHL INT,
	firstWHA INT,
	lastWHA INT,
	pos VARCHAR(4),
	birthYear INT,
	birthMon INT,
	birthDay INT,
	birthCountry VARCHAR(32),
	birthState VARCHAR(32),
	birthCity VARCHAR(32),
	deathYear INT,
	deathMon INT,
	deathDay INT,
	deathCountry VARCHAR(32),
	deathState VARCHAR(32),
	deathCity VARCHAR(32),
	PRIMARY KEY (playerID, coachID, hofID, ihdbID)
);


CREATE TABLE IF NOT EXISTS coaches (
	coachID VARCHAR(20),
	year INT,
	tmID VARCHAR(3),
	lgID VARCHAR(4),
	stint INT,
	notes VARCHAR(64),
	g INT,
	w INT,
	l INT,
	t INT,
	postg INT,
	postw INT,
	postl INT,
	postt INT,
	PRIMARY KEY (coachID, year, tmID, lgID, stint)
);


CREATE TABLE IF NOT EXISTS awardsplayers (
	playerID VARCHAR(20),
	award VARCHAR(32),
	year INT,
	lgID VARCHAR(4),
	note VARCHAR(64),
	pos VARCHAR(4),
	PRIMARY KEY (playerID, year, award)
);