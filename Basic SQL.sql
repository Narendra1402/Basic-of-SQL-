#Print all the movies with indusrty
 SELECT title, industry FROM movies;
# print all the bollywood movies 
 SELECT * FROM movies where industry = "bollywood";
# print the all movies which released in year 2022
 SELECT * FROM movies where release_year = 2022;
# print the all marvel movies  
 SELECT * FROM movies where studio = "Marvel Studios";
# print movies names  
 SELECT distinct title from movies ;
# count the thor movies  
 SELECT count(*) from movies where title like  "%THOR%";
# print all the movie Contain thor name
 SELECT * from movies where title like  "%THOR%";
#which movie have no studio name 
 SELECT * FROM movies where studio ="";
# Print movie name with releasig year of Marvel studios 
 select title, release_year from movies where studio ="marvel studios";
# print all the movie Contain avenger name  
 select * from movies where title like "%avenger%";
#print the year of The godfather movies is released
 SELECT release_year from movies where title like "The Godfather";
# Print all type studio in bollywood industry   
  SELECT DISTINCT studio from movies where industry="Bollywood";
# Print all the movie with imdbrating between 6 and 9  
  SELECT * FROM movies where imdb_rating >6 and imdb_rating <9;
# count the movies which having rating between 5 and 8
  SELECT COUNT(*) FROM movies WHERE imdb_rating between 5 and 8 ;
# Print all the movie with imdbrating between 5 and 8  
  SELECT * FROM movies WHERE imdb_rating between 5 and 8 ;
# Print all the movies of release year in 2022
  SELECT * FROM Movies where release_year = 2022;
# Print all the movies of release year be 2020,2021,2022
  SELECT * FROM MOVIES WHERE release_year = 2022 or release_year = 2021 or release_year = 2020;
# Print all the movies of release year be 2020,2021,2022  
  SELECT * FROM movies where release_year in (2020, 2021, 2022);
# print all the movies of Marvel and zee studios movies   
  SELECT * FROM MOVIES WHERE studio in ("Marvel studios", "Zee studios");
# Print all the movies with imdbrating when noting is null consider   
  SELECT * from movies where imdb_rating is not null;
# Print all the movies with highest rating to lowest 
  SELECT * FROM MOVIEs order by imdb_rating desc ; 
# print top 5 bollywood movies with high imdb_rating 
  SELECT * FROM MOVIEs where industry = "bollywood" order by imdb_rating desc limit 5;
  #print all movies by the order of their release year (latest first)
  SELECT * FROM MOVIES order by release_year desc;
  #ok now all the movies released after 2020
  SELECT * FROM movies where release_year >= 2020;
  #ok now all the movies released in 2022
  SELECT * FROM movies where release_year like 2022;
  #all movies after year 2020 that has more than 8 rating
  SELECT * FROM movies where release_year >= 2020 and imdb_rating >8;
  #select all movies that are by marvel studios and hombale films
  SELECT * FROM movies where studio in ( "Marvel studios", "Hombale Films");
  #select all thor movies by their release year
  SELECT title, release_year FROM movies where title like "%THOR%" order by release_year;
  #select all movies that are not from marvel studios
  SELECT * FROM movies where studio!="marvel studios";
  #Print MIN rating of imdb_rating of bollywood movies 
 SELECT MIN(imdb_rating) from movies where industry = "Bollywood";
  #Print average rating of imdb_rating of marvel studio  
  SELECT round(avg(imdb_rating),1) as Average  from movies where studio = "Marvel Studios";
  #print min, max , average imdb_rating of marvel studio
  SELECT MIN(imdb_rating) as min_rating,
		 MAX(imdb_rating) as max_rating,
	     ROUND(avg(imdb_rating),1) as Avg_rating
  from movies where studio = "Marvel Studios";
# Print number of movies 
Select Count(*) FROM movies;
# Print all studio with number of movies
SELECT 
	studio, count(*) AS Num_Movies
FROM movies
GROUP BY studio
order by Num_movies desc;
# Print all studio with number of movies and highest average rating , avoid the null value
SELECT 
  studio , count(*) as Num_movies,
  Round(AVG(imdb_rating ),1) as Avg_rating 
FROM movies 
where studio!=""
GROUP BY studio
order by avg_rating desc;
#how many movies were released between 2015 and 2022
SELECT 
	Count(*) 
FROM movies 
WHERE release_year between 2015 and 2022 ;
#print the max and min movie release year
SELECT 
	MIN(release_year),
    MAX(release_year)
FROM movies;
#print a year and how many movies were released in that year starting with latest year
SELECT 
	release_year, count(*) as Num_movies 
FROM movies
GROUP BY release_year
ORDER BY Num_movies DESC;
#print a year and how many movies were released in that year starting with latest year and having Greater the 5 imdb_rating 
SELECT 
	release_year, count(*) as Num_movies,
    imdb_rating 
FROM movies
where imdb_rating>5
GROUP BY release_year
HAVING NUM_movies>2
ORDER BY Num_movies DESC;
# Print the current date
SELECT curdate();
# Print the current year
SELECT YEAR(curdate());
# Print the age of the actor 
SELECT *, YEAR(curdate())-birth_year as Age  FROM actors;
# Print  profit  for all the movies
SELECT *,(revenue-budget) as Profit from financials;
# Print revenue of all the movies in millions with using Condition based 
SELECT *,
CASE
	WHEN unit = "Thousands" THEN revenue/1000
    WHEN unit = "billions" THEN revenue*1000
    WHEN unit = "Millions" THEN revenue
END as Revenue_Mln
FROM financials;
#Print the financials table 
SELECT * FROM financials;
#Print profit % for all the movies
 select 
        *, 
    (revenue-budget) as profit, 
    (revenue-budget)*100/budget as profit_pct 
   from financials;