-- Question 1 -- best_selling_games

SELECT * FROM game_sales
ORDER BY "games_sold" DESC
LIMIT 10;

-- Question 2 -- critics_top_ten_years

WITH CTE AS(
SELECT S."year", COUNT("year") AS "num_games", ROUND(AVG(R."critic_score"),2) AS "avg_critic_score" FROM game_sales AS S
INNER JOIN reviews AS R USING("name")
GROUP BY S."year")

SELECT * FROM CTE
WHERE "num_games" > 3
ORDER BY "avg_critic_score" DESC
LIMIT 10;

-- Question 3 -- golden_years

SELECT U."year", U."num_games", U."avg_user_score", C."avg_critic_score",(U."avg_user_score" - C."avg_critic_score") AS "diff" FROM public.users_avg_year_rating AS U
LEFT JOIN public.critics_avg_year_rating AS C USING("year")
WHERE (U."avg_user_score" > 9) OR (C."avg_critic_score" > 9)
ORDER BY U."year" ASC;

