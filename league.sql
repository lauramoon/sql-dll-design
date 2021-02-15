DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE team_affiliation (
    id SERIAL PRIMARY KEY,
    player INTEGER REFERENCES players ON DELETE CASCADE,
    team INTEGER REFERENCES teams ON DELETE CASCADE,
    season INTEGER REFERENCES seasons ON DELETE CASCADE
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    team_1 INTEGER REFERENCES teams ON DELETE CASCADE,
    team_2 INTEGER REFERENCES teams ON DELETE CASCADE,
    winner INTEGER REFERENCES teams,
    loser INTEGER REFERENCES teams
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    match INTEGER REFERENCES matches ON DELETE CASCADE,
    player INTEGER REFERENCES players,
    game_minutes INTEGER
);

INSERT INTO teams (name)
VALUES ('Apples'), ('Bananas'), ('Coconuts'), ('Dates');

INSERT INTO players (first_name, last_name)
VALUES
    ('Allen', 'Adams'),
    ('Abby', 'Anderson'),
    ('Bobby', 'Bai'),
    ('Bev', 'Buck'),
    ('Casper', 'Cane'),
    ('Calvin', 'Chin'),
    ('Doris', 'Dent'),
    ('Dale', 'Drink');

INSERT INTO seasons (start_date, end_date) VALUES ('2020-08-15', '2021-05-15');

INSERT INTO team_affiliation (player, team, season)
VALUES  (1, 1, 1), (2, 1, 1), (3, 2, 1), (4, 2, 1), (5, 3, 1), (6, 3, 1), (7, 4, 1), (8, 4, 1);

INSERT INTO matches (date, team_1, team_2, winner, loser)
VALUES
    ('2020-08-15', 1, 2, 1, 2),
    ('2020-08-15', 3, 4, 4, 3),
    ('2020-08-22', 2, 4, 4, 2);

INSERT INTO matches (date, team_1, team_2)
VALUES ('2020-08-22', 1, 3);

INSERT INTO goals (match, player, game_minutes)
VALUES (1, 2, 25), (2, 7, 15), (2, 8, 58), (4, 8, 69);

SELECT name, 
    SUM(CASE WHEN teams.id = winner THEN 1 else 0 END) wins,
    SUM(CASE WHEN teams.id = loser THEN 1 else 0 END) losses
FROM teams JOIN matches ON (teams.id = team_1 OR teams.id = team_2)
GROUP BY teams.id
ORDER BY (SUM(CASE WHEN teams.id = winner THEN 1 else 0 END) - SUM(CASE WHEN teams.id = loser THEN 1 else 0 END)) DESC;