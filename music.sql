-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  album INTEGER REFERENCES albums
);

CREATE TABLE songs_artists
(
  id SERIAL PRIMARY KEY,
  song INTEGER REFERENCES songs ON DELETE CASCADE,
  artist INTEGER REFERENCES artists ON DELETE CASCADE
);

CREATE TABLE songs_producers
(
  id SERIAL PRIMARY KEY,
  song INTEGER REFERENCES songs ON DELETE CASCADE,
  producer INTEGER REFERENCES producers ON DELETE CASCADE
);

INSERT INTO artists (name)
VALUES ('Hanson'), ('Queen'), ('Mariah Cary'), ('Boyz II Men'), ('Lady Gaga'), ('Brasley Cooper'),
  ('Nickelback'), ('Jay Z'), ('Alicia Keys'), ('Katy Perry'), ('Juicy J'), ('Maroon 5'), ('Christina Aguilera'),
  ('Avril Lavigne'), ('Destiny''s Child');

INSERT INTO producers (name)
VALUES ('Dust Brothers'), ('Stephen Lironi'), ('Roy Thomas Baker'), ('Walter Afanasieff'), ('Benjamin Rice'), ('Rick Parashar'),
  ('Al Shux'), ('Max Martin'), ('Cirkut'), ('Shellback'), ('Benny Blanco'), ('The Matrix'), ('Darkchild');

INSERT INTO albums 
  (title, release_date)
VALUES 
  ('Middle of Nowhere', '04-15-1997'), 
  ('A Night at the Opera', '10-31-1975'), 
  ('Daydream', '11-14-1995'), 
  ('A Star Is Born', '09-27-2018'), 
  ('Silver Side Up', '08-21-2001'), 
  ('The Blueprint 3', '10-20-2009'),
  ('Prism', '12-17-2013'), 
  ('Hands All Over', '06-21-2011'), 
  ('Let Go', '05-14-2002'), 
  ('The Writing''s on the Wall', '11-07-1999');

INSERT INTO songs
  (title, duration_in_seconds, album)
VALUES
  ('MMMBop', 238, 1),
  ('Bohemian Rhapsody', 355, 2),
  ('One Sweet Day', 282, 3),
  ('Shallow', 216, 4),
  ('How You Remind Me', 223, 5),
  ('New York State of Mind', 276, 6),
  ('Dark Horse', 215, 7),
  ('Moves Like Jagger', 201, 8),
  ('Complicated', 244, 9),
  ('Say My Name', 240, 10);

INSERT INTO songs_artists (song, artist)
VALUES (1, 1), (2, 2), (3, 3), (3, 4), (4, 5), (4, 6), (5, 7), (6, 8), (6, 9), (7, 10), (7, 11), (8, 12), (8, 13), (9, 14), (10, 15);

INSERT INto songs_producers (song, producer)
VALUES (1, 1), (1, 2), (2, 3), (3, 4), (4, 5), (5, 6), (6, 7), (7, 8), (7, 9), (8, 10), (8, 11), (9, 12), (10, 13);