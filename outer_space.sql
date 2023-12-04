-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

-- Original schema --
-- CREATE TABLE planets
-- (
--   id SERIAL PRIMARY KEY,
--   name TEXT NOT NULL,
--   orbital_period_in_years FLOAT NOT NULL,
--   orbits_around TEXT NOT NULL,
--   galaxy TEXT NOT NULL,
--   moons TEXT[]
-- );

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');

----------- NEW BELOW ------------

-- Orbited star  table --
CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL
);

-- planets table --
CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  star_id INTEGER REFERENCES stars NOT NULL,
  galaxy TEXT
);

-- moon table --
CREATE TABLE moons 
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL,
  planet_id INTEGER REFERENCES planets
);

-- planet-moon join table --

---------- INSERT RECORDS -----------
INSERT INTO stars
  (name)
VALUES
  ('The Sun'), ('Proxima Centauri'), ('Gliese 876');

INSERT INTO planets
  (name, orbital_period_in_years, star_id, galaxy)
VALUES
  ('Earth', 1.00, 1, 'Milky Way'),
  ('Mars',1.88, 1, 'Milky Way'),
  ('Venus',0.62, 1, 'Milky Way'),
  ('Neptune',164.8, 1, 'Milky Way'),
  ('Proxima Centauri b', 0.03, 2, 'Milky Way'),
  ('Gliese 876 b', 0.23, 3, 'Milky Way');

INSERT INTO moons
  (name, planet_id)
VALUES
  ('The Moon', 1),
  ('Phobos', 2),
  ('Deimos', 2),
  ('Naiad', 4),
  ('Thalassa', 4),
  ('Despina', 4),
  ('Galatea', 4),
  ('Larissa', 4),
  ('S/2004 N 1', 4),
  ('Proteus', 4),
  ('Triton', 4),
  ('Nereid', 4),
  ('Halimede', 4),
  ('Sao', 4),
  ('Laomedeia', 4),
  ('Psamathe', 4),
  ('Neso', 4); 