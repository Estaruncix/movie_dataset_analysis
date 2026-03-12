-- This code is run in psql (SQL SHELL)

-- Creation and connection to the database:
CREATE DATABASE movie_database;

\c movie_database
-- Establishing data types
CREATE TABLE movies (
    user_id INTEGER,
    movie_name TEXT,
    rating NUMERIC(3,1),
    genre TEXT
);
-- Introducing the data from the csv into the database
\copy movies(user_id, movie_name, rating, genre) FROM 'C:\Users\RositaRos\git_practice\movie_dataset_analysis\data\movies_dataset_clean.csv' DELIMITER ',' CSV HEADER;
-- checking the contents to be correct

--
