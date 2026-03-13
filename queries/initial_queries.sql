-- A few simple queries to understand the complexity, length and overall reach of the data.ABORT

-- Total rows
SELECT COUNT(*) AS total_movies FROM movies;

-- Unique users
SELECT COUNT(DISTINCT user_id) AS total_users FROM movies;

-- Unique movie titles
SELECT COUNT(DISTINCT movie_name) AS total_titles FROM movies;

-- Average rating of all the movies
SELECT AVG(rating) AS avg_rating FROM movies;

-- Number of movies per genre:
SELECT genre, COUNT(DISTINCT movie_name) AS num_movies
FROM movies
GROUP BY genre
ORDER BY num_movies DESC;