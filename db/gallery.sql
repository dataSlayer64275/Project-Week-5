DROP TABLE exhibitions;
DROP TABLE categories;
DROP TABLE artists;

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  year_of_birth INT4,
  year_of_death INT4,
  biography TEXT
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  type VARCHAR
);

CREATE TABLE exhibitions (
  id SERIAL PRIMARY KEY,
  title VARCHAR,
  artist_id INT REFERENCES artists(id) ON DELETE CASCADE,
  category_id INT REFERENCES categories(id) ON DELETE CASCADE,
  date_of_exhibition DATE,
  time_of_exhibition TIME,
  description TEXT
);
