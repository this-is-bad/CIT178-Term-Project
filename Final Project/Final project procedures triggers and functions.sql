/*  
	Shayne Jones
	CIT178
*/

/* Final Project Procedures */


USE Gamiverse;

GO
CREATE PROCEDURE dbo.spAllGames

AS

SELECT ga.accessory_name, act.type_name, ga.accessory_description, ga.unit_price, g.game_name, ge.edition_name, p.publisher_name
FROM game_accessory ga 
JOIN accessory_type act
	ON ga.type_id = act.type_id
JOIN game_edition ge
	ON ga.edition_id = ge.edition_id
JOIN game g
	ON ge.game_id = g.game_id
JOIN game_format gf
	ON g.format_id = gf.format_id
JOIN publisher p
	ON ga.publisher_id = p.publisher_id

GO
CREATE PROCEDURE dbo.spPublisherCatalog
	@publisher VARCHAR(100)

AS

SELECT ga.accessory_name, act.type_name, ga.accessory_description, ga.unit_price, g.game_name, ge.edition_name
FROM game_accessory ga 
JOIN accessory_type act
	ON ga.type_id = act.type_id
JOIN game_edition ge
	ON ga.edition_id = ge.edition_id
JOIN game g
	ON ge.game_id = g.game_id
JOIN game_format gf
	ON g.format_id = gf.format_id
JOIN publisher p
	ON ga.publisher_id = p.publisher_id
WHERE p.publisher_name = @publisher
ORDER BY accessory_name, edition_name
GO

/*
-- Test the spPublisherCatalog procedure

EXEC spPublisherCatalog 'Mayfair Games'

*/

GO
CREATE PROCEDURE dbo.spVerboseGameDesc
	@accessory_name VARCHAR(100)
   ,@edition_name VARCHAR(100)
   ,@publisher VARCHAR(100)
   ,@game_description VARCHAR(MAX) OUTPUT

AS

SELECT @game_description = 'Name:  ' + ISNULL(ga.accessory_name, '') + CHAR(13) +  CHAR(10) +
	'Type:  ' + ISNULL(act.type_name, '') + CHAR(13) +  CHAR(10) +
	'For use with:  ' + ISNULL(ge.edition_name, '') + CHAR(32) + g.game_name + CHAR(13) +  CHAR(10) +
	'Published by:  ' + ISNULL(p.Publisher_name, '') + CHAR(13) +  CHAR(10) +
	'Retail cost:  $' + ISNULL(CAST(ga.unit_price AS VARCHAR(10)), '') + CHAR(13) +  CHAR(10) +
	'Description:  ' + ISNULL(ga.accessory_description, '')
FROM game_accessory ga 
JOIN accessory_type act
	ON ga.type_id = act.type_id
JOIN game_edition ge
	ON ga.edition_id = ge.edition_id
JOIN game g
	ON ge.game_id = g.game_id
JOIN game_format gf
	ON g.format_id = gf.format_id
JOIN publisher p
	ON ga.publisher_id = p.publisher_id
WHERE p.publisher_name = @publisher
	AND ga.accessory_name = @accessory_name
	AND ge.edition_name = @edition_name
ORDER BY accessory_name, edition_name

GO

/*

/* generate statements for testing spVerboseGameDesc  */
--SELECT 'EXEC spVerboseGameDesc ' + '''' +  ga.accessory_name + ''', ''' +  ge.edition_name + ''', ''' + p.publisher_name + ''',  @result OUTPUT'
--FROM game_accessory ga 
--JOIN accessory_type act
--	ON ga.type_id = act.type_id
--JOIN game_edition ge
--	ON ga.edition_id = ge.edition_id
--JOIN game g
--	ON ge.game_id = g.game_id
--JOIN game_format gf
--	ON g.format_id = gf.format_id
--JOIN publisher p
--	ON ga.publisher_id = p.publisher_id

DECLARE @result VARCHAR(MAX)

EXEC spVerboseGameDesc 'Eurorails', '1st Edition', 'Mayfair Games',  @result OUTPUT
EXEC spVerboseGameDesc 'Eurorails', '2nd Edition', 'Mayfair Games',  @result OUTPUT
EXEC spVerboseGameDesc 'BattleTech', '1st Edition', 'FASA',  @result OUTPUT
EXEC spVerboseGameDesc 'BattleTech', '2nd Edition', 'FASA',  @result OUTPUT
EXEC spVerboseGameDesc 'Mad Cat Figure', '2nd Edition', 'FASA',  @result OUTPUT
EXEC spVerboseGameDesc 'Magic:  The Gathering Deck', 'Alpha', 'Wizards of the Coast',  @result OUTPUT
EXEC spVerboseGameDesc 'Legends booster pack', 'Unlimited', 'Wizards of the Coast',  @result OUTPUT
EXEC spVerboseGameDesc 'Dungeons and Dragons Basic Boxed Set', 'Basic', 'TSR, Inc',  @result OUTPUT
EXEC spVerboseGameDesc 'Dungeons and Dragons Expert Boxed Set', 'Expert', 'TSR, Inc',  @result OUTPUT
EXEC spVerboseGameDesc 'B3 Palace of the Silver Princess', 'Basic', 'TSR, Inc',  @result OUTPUT
EXEC spVerboseGameDesc 'Toon rule book', '1st Edition', 'Steve Jackson Games',  @result OUTPUT


PRINT @result
*/


GO
CREATE PROCEDURE dbo.spPublisherGameAccCount
	@game_name VARCHAR(100)
   ,@publisher VARCHAR(100)

AS

DECLARE @result INT

SET @result = ISNULL(
	(SELECT SUM(1)
	FROM game_accessory ga 
	JOIN game_edition ge
		ON ga.edition_id = ge.edition_id
	JOIN game g
		ON ge.game_id = g.game_id
	JOIN publisher p
		ON ga.publisher_id = p.publisher_id
	WHERE p.publisher_name = @publisher
		AND g.game_name = @game_name), 0)

RETURN @result
GO

/*
-- Test the spPublisherGameAccCount procedure

DECLARE @pub_count INT
	   ,@publisher VARCHAR(100) = 'TSR, inc'
	   ,@game_name VARCHAR(100) = 'Dungeons & Dragons'

EXEC @pub_count = spPublisherGameAccCount @game_name, @publisher

Print @publisher + CHAR(32) + 'has' +CHAR(32) + CAST(@pub_count AS VARCHAR(10)) + CHAR(32) + 'products' + CHAR(32) + 'for' + CHAR(32) + @game_name + '.'
*/

/* Final Project User Defined Functions */

GO
CREATE FUNCTION fnAverageCost
    (@game_id INT
   ,@publisher_id INT)
    RETURNS DECIMAL(16, 2)

AS 

BEGIN
    RETURN (SELECT AVG(unit_price)
			FROM game_accessory ga 
			JOIN game_edition ge
				ON ga.edition_id = ge.edition_id
			JOIN game g
				ON ge.game_id = g.game_id
			JOIN publisher p
				ON ga.publisher_id = p.publisher_id
			WHERE p.publisher_id = @publisher_id
				AND g.game_id = @game_id);
END;
GO

/* Test the spAverageCost function 
-- the function ignores game_edition when calculating average cost, 
--	but game_edition is required to link game to game_accessory
--	 so DISTINCT must be used prevent duplicate records
SELECT DISTINCT publisher_name AS [Publisher], game_name AS Game, dbo.fnAverageCost(g.game_id, p.publisher_id) AS [Average Cost of Game Accessories]
FROM game_accessory ga 
JOIN game_edition ge
	ON ga.edition_id = ge.edition_id
JOIN game g
	ON ge.game_id = g.game_id
JOIN publisher p
	ON ga.publisher_id = p.publisher_id
*/


GO
CREATE FUNCTION fnGameAccessories
	(@edition_id INT
	,@game_id INT)
    RETURNS TABLE

AS

RETURN
(SELECT ga.accessory_name, ge.edition_name, act.type_name, ga.accessory_description, ga.unit_price, p.publisher_name
FROM game_accessory ga 
JOIN accessory_type act
	ON ga.type_id = act.type_id
JOIN game_edition ge
	ON ga.edition_id = ge.edition_id
JOIN publisher p
	ON ga.publisher_id = p.publisher_id
WHERE ge.game_id = @game_id
	AND ge.edition_id = @edition_id);
GO

/* Test the fnGameAccessories function

SELECT game_name, ac.*
FROM game g
JOIN game_edition ge
	ON g.game_id = ge.game_id
CROSS APPLY dbo.fnGameAccessories (ge.edition_id, g.game_id) ac

*/
/* Final Project Triggers */


IF OBJECT_ID('dbo.game_accessory_archive') IS NULL
BEGIN
	CREATE TABLE game_accessory_archive(
		accessory_id INT,
		edition_id INT,
		publisher_id INT,
		[type_id] INT,
		accessory_name VARCHAR(150),
		accessory_description VARCHAR(MAX),
		unit_price MONEY);
END

GO
CREATE TRIGGER game_accessory_DELETE
	ON game_accessory
	AFTER DELETE

AS

INSERT game_accessory_archive (accessory_id, edition_id, publisher_id, [type_id], accessory_name, accessory_description, unit_price)
SELECT accessory_id, edition_id, publisher_id, [type_id], accessory_name, accessory_description, unit_price
FROM Deleted;
GO

/* Test the game_accessory_DELETE trigger

SELECT *
FROM game_accessory_archive

INSERT game_accessory (edition_id, publisher_id, [type_id], accessory_name, accessory_description, unit_price)
SELECT 1, 1, 1, 'Test Delete', 'Test', 0.00
WHERE NOT EXISTS (SELECT 1 FROM game_accessory_archive WHERE accessory_name = 'Test Delete')

DELETE game_accessory
WHERE accessory_name = 'Test Delete'

SELECT *
FROM game_accessory_archive

*/

GO
CREATE TRIGGER accessory_type_INSERT
	ON accessory_type
	INSTEAD OF INSERT

AS

BEGIN 
	IF 1 = (SELECT COUNT(*) FROM Inserted)
		BEGIN
			DECLARE @string VARCHAR(100) = (SELECT [type_name] FROM Inserted)
				   ,@new_string VARCHAR(100) = ''
				   ,@i INT = 1
	  
			DECLARE @substring TABLE (sub CHAR(1), ind INT)

			WHILE @i <= LEN(@string)
			BEGIN

				INSERT @substring (sub, ind)
				SELECT CASE WHEN SUBSTRING(@string, @i - 1, 1) = CHAR(32) THEN UPPER(SUBSTRING(@string, @i, 1)) 
				ELSE SUBSTRING(@string, @i, 1) END AS sub, @i AS ind;
				
				SET @i += 1;

			END


			SELECT @new_string += sub
			FROM @substring
			ORDER BY ind;

			INSERT accessory_type (type_name)
			SELECT @new_string;
		END
	ELSE
		BEGIN
			RAISERROR('A maximum of 1 record can be inserted at a single time', 1, 1);

		END
END
GO

/* Test the accessory_type_INSERT trigger

INSERT accessory_type (type_name)
VALUES ('this is a test value')

SELECT *
FROM accessory_type

*/
IF OBJECT_ID('game_changelog') IS NULL
BEGIN
	CREATE TABLE game_changelog(
		change_id INT IDENTITY(1, 1),
		game_id INT,
		format_id INT,
		game_name VARCHAR(100),
		game_description VARCHAR(100))	
END
GO

CREATE TRIGGER game_INSERT_UPDATE
	ON game
	AFTER INSERT, UPDATE

AS

BEGIN
	INSERT game_changelog (game_id, format_id, game_name, game_description)
	SELECT game_id, format_id, game_name, game_description
	FROM Inserted
END
GO

/* Test the game_INSERT_UPDATE trigger
SELECT *
FROM game_changelog
GO

INSERT game(format_id, game_name, game_description)
VALUES (1, 'Trigger test', 'test description')
GO

SELECT *
FROM game_changelog
GO

UPDATE game 
SET game_description = 'This is a test of the update trigger.'
WHERE game_name = 'Trigger Test'
	AND format_id = 1
	AND game_description = 'test description'
GO


SELECT *
FROM game_changelog
GO

*/