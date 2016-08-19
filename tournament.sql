-- Table definitions for the tournament project.
--

-- creating database and drop the db if exists already
DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;

-- connecting to db
\c tournament;

-- create players table
CREATE TABLE players(
    id serial PRIMARY KEY,
    reg_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    name VARCHAR(60),
);

-- create matches table to store each match records
CREATE TABLE matches(
    id serial PRIMARY KEY,
    time_played TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    winner int REFERENCES players(id),
    loser int REFERENCES players(id)
);

-- create view combining matches and players for easier queries
CREATE VIEW matchescomb AS
SELECT players.id, players.name,
    (SELECT count(*) as wins from matches where players.id=matches.winner),
    (SELECT count(*) as matches from matches where players.id=matches.winner or players.id=matches.loser)
FROM players;
