DROP DATABASE IF EXISTS  craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
  id SERIAL PRIMARY KEY,
  region_name TEXT NOT NULL
);

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  username TEXT UNIQUE,
  preferred_region INTEGER REFERENCES regions
);

CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  poster INTEGER REFERENCES users,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  location TEXT NOT NULL,
  region INTEGER REFERENCES regions
);

CREATE TABLE categories
(
  id SERIAL PRIMARY KEY,
  category TEXT NOT NULL
);

CREATE TABLE posts_categories
(
  id SERIAL PRIMARY KEY,
  post_id INTEGER REFERENCES posts,
  category_id INTEGER REFERENCES categories
);

INSERT INTO regions (region_name)
VALUES ('Chicago'), ('Atlanta'), ('Denver'), ('Philadelphia');

INSERT INTO users 
  (username, preferred_region)
VALUES
  ('first_cat', 1),
  ('midnight',  1),
  ('moonlight', 2),
  ('tire_track', 3),
  ('little_grey', 4),
  ('bubblegum', 4);

INSERT INTO posts
 (poster, title, content, location, region)
VALUES
  (1, 'food bowl', 'really cool', 'Maple St', 1),
  (1, 'water bowl', 'holds water', 'Maple St', 1),
  (2, 'forks', 'shiny', 'Laurel St', 1),
  (3, 'couch', 'brown and comfy', 'Ash St', 3),
  (4, 'tires', '4 tires in good condition', 'Oak St.', 3),
  (5, 'arm chair', 'sea green, pretty', 'Birch St', 4),
  (5, '4 table chairs', 'sturdy', 'Birch St', 4),
  (5, 'table', '60x90 oval wood', 'Birch St', 4),
  (6, 'car radio', 'it used to work', 'Beech St', 4),
  (6, 'chair', 'good for sitting', 'Beech St', 4),
  (6, 'horse trailer', 'sitting in my sisters garage', 'Aspen St', 3);

INSERT INTO categories (category)
VALUES ('Automotive'), ('Household'), ('Furniture'), ('Kitchen');

INSERT INTO posts_categories 
  (post_id, category_id)
VALUES
  (1, 2),
  (1, 4),
  (2, 2),
  (2, 4),
  (3, 4),
  (4, 3),
  (5, 1),
  (6, 3),
  (7, 3),
  (7, 4),
  (8, 3),
  (9, 1),
  (10, 3),
  (11, 1);