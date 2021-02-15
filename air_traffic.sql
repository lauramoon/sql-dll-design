-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL,
  country TEXT NOT NULL
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline TEXT NOT NULL,
  from_city INTEGER REFERENCES cities,
  to_city INTEGER REFERENCES cities
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger INTEGER REFERENCES passengers,
  seat TEXT,
  flight INTEGER REFERENCES flights
);

INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

INSERT INTO cities
  (city, country)
VALUES
  ('Washington DC', 'United States'),
  ('Seattle', 'United States'),
  ('Tokyo', 'Japan'),
  ('London', 'United Kingdom'),
  ('Los Angeles', 'United States'),
  ('Las Vegas', 'United States'),
  ('Mexico City', 'Mexico'),
  ('Paris', 'France'),
  ('Casablanca', 'Morocco'),
  ('Dubai', 'UAE'),
  ('Beijing', 'China'),
  ('New York', 'United States'),
  ('Charlotte', 'United States'),
  ('Cedar Rapids', 'United States'),
  ('Chicago', 'United States'),
  ('New Orleans', 'United States'),
  ('Sao Paolo', 'Brazil'),
  ('Santiago', 'Chile');

INSERT INTO flights
  (departure, arrival, airline, from_city, to_city)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 1, 2),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 3, 4),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 5, 6),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 2, 7),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 8, 9),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 10, 11),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 12, 13),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 14, 15),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 13, 16),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 17, 18);

INSERT INTO tickets
  (passenger, seat, flight)
VALUES
  (1, '33B', 1),
  (2, '8A', 2),
  (3, '12F', 3),
  (1, '20A', 4),
  (4, '23D', 5),
  (2, '18C', 6),
  (5, '9E', 7),
  (6, '1A', 8),
  (5, '32B', 9),
  (7, '10D', 10);