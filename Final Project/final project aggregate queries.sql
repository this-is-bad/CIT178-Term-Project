USE Gamiverse;

-- Average cost per game
SELECT g.game_name AS Game, COUNT(ga.accessory_name) AS [Number of Accessories], AVG(ga.unit_price) AS [Average Price]
FROM game g
JOIN game_edition ge
	ON g.game_id = ge.game_id
JOIN game_accessory ga
	ON ge.edition_id = ga.edition_id
GROUP BY g.game_name


/****/
-- Percent of total price, by publisher
DECLARE @total_price MONEY = (SELECT SUM(unit_price) FROM game_accessory)

SELECT publisher_name AS [Publisher Name], SUM(unit_price) AS [Publisher Total Price], @total_price AS [Total Price], (SUM(unit_price) / @total_price) * 100 AS [Publisher's Percent of Total]
FROM game_accessory ga
JOIN publisher p
	ON ga.publisher_id = p.publisher_id
GROUP BY publisher_name
ORDER BY [Publisher's Percent of Total] DESC

/****/

-- Most expensive and least expensive price, by publisher
SELECT publisher_name AS [Publisher Name], MIN(unit_price) AS [Minimum Price], MAX(unit_price) AS [Maximum Price]
FROM game_accessory ga
JOIN publisher p
	ON ga.publisher_id = p.publisher_id
GROUP BY publisher_name
ORDER BY publisher_name

-- Average and total price by category of hobby
SELECT gf.format_name AS [Game Format], AVG(unit_price) AS [Format Average Price], SUM(unit_price) AS [Format Total Price]
FROM game_format gf
JOIN game g
	ON gf.format_id = g.format_id
JOIN game_edition ge
	ON g.game_id = ge.game_id
JOIN game_accessory ga
	ON ge.edition_id = ga.edition_id
GROUP BY gf.format_name
ORDER BY [Format Average Price]