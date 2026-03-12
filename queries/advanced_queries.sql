-- A few more complex queries aimed at understanding specific details of the data

-- Rating distribution
SELECT rating, COUNT(*) AS count
FROM movies
GROUP BY rating
ORDER BY rating;
-- Movies with the highest average rating
SELECT movie_name, AVG(rating) AS avg_rating, COUNT(*) AS num_ratings
FROM movies
GROUP BY movie_name
HAVING COUNT(*) >= 10
ORDER BY avg_rating DESC
LIMIT 10;

-- Most active users: 
SELECT user_id, COUNT(*) AS num_ratings
FROM movies
GROUP BY user_id
ORDER BY num_ratings DESC
LIMIT 10;

-- Average rating per user:
SELECT user_id, AVG(rating) AS avg_rating
FROM movies
GROUP BY user_id
ORDER BY avg_rating DESC
LIMIT 10;

-- Most active user per genre 
WITH genre_split AS (
    SELECT 
        user_id,
        unnest(string_to_array(genre, '|')) AS single_genre
    FROM movies
)
SELECT 
    user_id,
    COUNT(DISTINCT single_genre) AS genres_rated,
    COUNT(*) AS total_ratings
FROM genre_split
GROUP BY user_id
ORDER BY genres_rated DESC, total_ratings DESC
LIMIT 10;

-- Highly polarizing movies

SELECT 
    movie_name,
    COUNT(*) AS num_ratings,
    AVG(rating) AS avg_rating,
    STDDEV(rating) AS rating_stddev
FROM movies
GROUP BY movie_name
HAVING COUNT(*) >= 20
ORDER BY rating_stddev DESC
LIMIT 10;

-- A high/lower with no mid button 
SELECT 
    user_id,
    COUNT(*) AS num_ratings,
    AVG(rating) AS avg_rating,
    MIN(rating) AS min_rating,
    MAX(rating) AS max_rating
FROM movies
GROUP BY user_id
HAVING COUNT(*) >= 50
ORDER BY avg_rating DESC
LIMIT 10;
