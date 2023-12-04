DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    region TEXT
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category TEXT
);

CREATE TABLE users 
(
    id SERIAL PRIMARY KEY,
    real_name TEXT,
    username VARCHAR(15) NOT NULL,
    encrypted_pw VARCHAR(12) NOT NULL,
    pref_region_id INTEGER REFERENCES regions
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users ON DELETE SET NULL,
    title TEXT NOT NULL,
    post_text VARCHAR(150) NOT NULL,
    loc TEXT,
    category_id INTEGER REFERENCES categories ON DELETE SET NULL,
    region_id INTEGER REFERENCES regions ON DELETE SET NULL
);

INSERT INTO regions (region) VALUES ('New England'), ('Atlanta'), ('Seattle'), ('San Francisco');

INSERT INTO categories (category) 
VALUES
('Food'), ('Sports'), ('Movies'), ('Games'), ('News');

INSERT INTO users (name, username, encrypted_pw, pref_region_id)
VALUES
('John','JohnnyBoy12','1234','1'), ('Chris','Kkkris','4321','2'), ('Jennifer','JenTheHen','password', 4);

INSERT INTO posts (user_id, title, post_text, loc, category_id, region_id)
VALUES
(1, 'Bananas', 'Selling bananas', 'Boston', 1, 1),
(2, 'Football', '100 football jersies', 'Town', 2, 2),
(3, 'Batman', 'Entire batman collection of every, and literally all batman movies', 'My House', 3, 4),
(2, 'Halo 9 Review', 'Replica Mr. Chief helmet from mashed potatoes', 'Bungie HQ', 4, 2);