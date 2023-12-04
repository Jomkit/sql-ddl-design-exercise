DROP DATABASE IF EXISTS soccer_league;
CREATE DATABASE soccer_league;

\c soccer_league;

--teams (with players?)

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    teamname TEXT,
    city TEXT
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    player TEXT,
    curr_team_id INTEGER REFERENCES teams
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    ref_name TEXT
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    head_referee INTEGER REFERENCES referees,
    referee_1 INTEGER REFERENCES referees,
    referee_2 INTEGER REFERENCES referees,
    team1_id INTEGER REFERENCES teams,
    team2_id INTEGER REFERENCES teams
);

CREATE TABLE league
(
    id SERIAL PRIMARY KEY,
    begin_date DATE,
    end_date DATE
);

CREATE TABLE goals
(
    player_id INTEGER REFERENCES players,
    match_id INTEGER REFERENCES matches
);

--goal or match table

-- referees

-- Maybe join table with teams to league, include league start/end