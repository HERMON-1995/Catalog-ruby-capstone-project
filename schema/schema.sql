--------- Create book table ----------------
CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  publisher VARCHAR,
  cover_state VARCHAR,
  genre_id INT NULL REFERENCES genres(id), -- To be created later
  author_id INT NULL REFERENCES authors(id),-- To be created later
  label_id INT NULL REFERENCES labels(id),-- To be created later
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL
);

----------- Create labels table ------------------
CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  color VARCHAR(50) NOT NULL
);

----------- Create music albums table ------------------
CREATE TABLE musicalbums(
  id INT,
  name VARCHAR(255),
  published_date DATE,
  on_spotify BOOLEAN,
  archived BOOLEAN,
  genre_id INT REFERENCES genres(id),
  PRIMARY KEY(id)
);

