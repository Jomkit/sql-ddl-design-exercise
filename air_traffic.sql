-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

-- CREATE TABLE tickets
-- (
--   id SERIAL PRIMARY KEY,
--   first_name TEXT NOT NULL,
--   last_name TEXT NOT NULL,
--   seat TEXT NOT NULL,
--   departure TIMESTAMP NOT NULL,
--   arrival TIMESTAMP NOT NULL,
--   airline TEXT NOT NULL,
--   from_city TEXT NOT NULL,
--   from_country TEXT NOT NULL,
--   to_city TEXT NOT NULL,
--   to_country TEXT NOT NULL
-- );

-- INSERT INTO tickets
--   (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
--   ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--   ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--   ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--   ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--   ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--   ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--   ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--   ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--   ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--   ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');

------------------ UPDATED SCHEMA --------------------

CREATE TABLE customers 
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Join table for to and from destinations
CREATE TABLE from_dest 
(
  id SERIAL PRIMARY KEY,
  city_id INTEGER REFERENCES cities,
  country_id INTEGER REFERENCES countries
);

CREATE TABLE to_dest 
(
  id SERIAL PRIMARY KEY,
  city_id INTEGER REFERENCES cities,
  country_id INTEGER REFERENCES countries
);


CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL,
  from_dest_id INTEGER REFERENCES from_dest,
  to_dest_id INTEGER REFERENCES to_dest
);


CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES customers,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  flight_id INTEGER REFERENCES flights
);

------------- INSERTING RECORDS ---------------

INSERT INTO customers (first_name, last_name)
VALUES
('Jennifer', 'Finch'), ('Thadeus', 'Gathercoal'), ('Sonja', 'Pauley'),
('Waneta', 'Skeleton'), ('Berkie', 'Wycliff'), ('Alvin', 'Leathes'),
('Cory', 'Squibbes');

INSERT INTO countries (name)
VALUES
('United States'), ('Japan'), ('United Kingdom'), ('Mexico'),
('Morocco'), ('China'), ('UAE'), ('France'), ('Brazil'), ('Chile');

INSERT INTO cities (name)
VALUES
('Washington DC'), ('Seattle'), ('Los Angeles'), ('Las Vegas'),
('New York'), ('Charlotte'), ('Cedar Rapids'), ('Chicago'), ('New Orleans'), ('Tokyo'), ('London'), ('Mexico City'), ('Casablanca'), ('Beijing'), ('Dubai'), ('Paris'), ('Sao Paolo'), ('Santiago');
--18

INSERT INTO from_dest (city_id, country_id)
VALUES
(1, 1), (10, 2), (3, 1), (2, 1), (16, 8), (15, 7), (5, 1), (7, 1), (6, 1), (17, 9);

INSERT INTO to_dest (city_id, country_id)
VALUES
(2, 1), (11, 3), (4, 1), (12, 4), (13, 5), (14, 6), (6, 1), (8, 1), (9, 1), (18, 10);

INSERT INTO flights (airline, from_dest_id, to_dest_id)
VALUES 
('United', 1, 1), ('British Airways', 2, 2), ('Delta', 3, 3),
('Delta', 4, 4), ('TUI Fly Belgium', 5, 5), ('Air China', 6, 6), ('United', 7, 7), ('American Airlines', 8, 8), ('American Airlines', 9, 9), ('Avianca Brasil', 10, 10);

INSERT INTO tickets (customer_id, seat, departure, arrival, flight_id)
VALUES
(1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1), (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2), (3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3), (1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 4), (4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 5), (2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 6), (5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 7), (6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 8), (5, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 9), (7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 10);

-- SELECT customers.first_name, from_dest.city_id FROM tickets
-- JOIN customers ON customers.id = tickets.customer_id
-- JOIN from_dest ON from_dest.id = tickets.flight

-- INSERT INTO tickets
--   (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
--   ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--   ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--   ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--   ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--   ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--   ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--   ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--   ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--   ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--   ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');