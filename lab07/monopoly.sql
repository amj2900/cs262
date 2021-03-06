﻿--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS Property;
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY, 
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	score integer,
	cash integer,
	pieceLocation varchar
	);

CREATE TABLE Property (
	PRIMARY KEY (propertyName, gameID, playerID),
	playerID integer REFERENCES Player(ID),
	gameID integer REFERENCES Game(ID),
	propertyName varchar(50),
	houses integer,
	hotel integer
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON Property TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO PlayerGame VALUES (1, 1, 0.00,100,'Illinois Ave');
INSERT INTO PlayerGame VALUES (1, 2, 0.00,3232,'Kentuckey Ave');
INSERT INTO PlayerGame VALUES (1, 3, 2350.00,2133,'Free Parking');
INSERT INTO PlayerGame VALUES (2, 1, 1000.00,976,'Jail');
INSERT INTO PlayerGame VALUES (2, 2, 0.00,0,'Jail');
INSERT INTO PlayerGame VALUES (2, 3, 500.00,22,'Boardwalk');
INSERT INTO PlayerGame VALUES (3, 2, 0.00,123,'Reading Railroad');
INSERT INTO PlayerGame VALUES (3, 3, 5500.00,500,'Oriental Ave');

INSERT INTO Property VALUES (1, 1, 'Reading Railroad',0,0 );
INSERT INTO Property VALUES (1, 2, 'Boardwalk',3,0);
INSERT INTO Property VALUES (1, 3, 'Park Place',0,1);
INSERT INTO Property VALUES (2, 1, 'Illinois Ave',0,0);
INSERT INTO Property VALUES (2, 2, 'Oriental Ave',4,0);
INSERT INTO Property VALUES (2, 3, 'Vermont Ave',2,0);
INSERT INTO Property VALUES (3, 2, 'Maryland Ave',0,1);
INSERT INTO Property VALUES (3, 3, 'Baltic Ave',4,0);


