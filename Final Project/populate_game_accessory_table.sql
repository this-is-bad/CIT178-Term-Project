USE Gamiverse
GO

IF COL_LENGTH('dbo.game_accessory', 'unit_price') IS NULL
BEGIN
	TRUNCATE TABLE game_accessory

	ALTER TABLE dbo.game_accessory ADD unit_price MONEY
END

SET IDENTITY_INSERT dbo.game_accessory ON
GO

INSERT dbo.game_accessory (accessory_id, edition_id, publisher_id, [type_id], accessory_name, accessory_description, unit_price) 
SELECT accessory_id, edition_id, publisher_id, [type_id], accessory_name, accessory_description, unit_price
FROM (VALUES (1, 1, 5, 2, N'Eurorails', N'Contains everything necessary to play the game.', 49.9900),	
			 (2, 2, 5, 2, N'Eurorails', N'Contains everything necessary to play the game.', 49.9900),
			 (3, 3, 2, 2, N'BattleTech', N'A box set containing the rules, maps, dice, and other components necessary to play the game.', 35.9900),
			 (4, 4, 2, 2, N'BattleTech', N'A box set containing the rules, maps, dice, and other components necessary to play the game.', 35.9900),
			 (5, 4, 2, 5, N'Mad Cat Figure', N'A figure for use with the BattleTech game.', 10.9900),
			 (6, 6, 11, 3, N'Magic:  The Gathering Deck', N'A deck of cards, with rules.', 8.9900),
			 (7, 8, 11, 3, N'Legends booster pack', N'A pack of 15 M:TG cards', 2.9900),
			 (8, 9, 8, 2, N'Dungeons and Dragons Basic Boxed Set', N'A box containing the rules and dice necessary to play the game.  For character levels 1-3.', 29.9900),
			 (9, 10, 8, 2, N'Dungeons and Dragons Expert Boxed Set', N'A box containing the rules and dice necessary to play the game.  For character levels 4-14.', 29.9900),
			 (10, 9, 8, 7, N'B3 Palace of the Silver Princess', N'An adventure module about exploring a ruined palace.', 12.9900),
			 (11, 11, 7, 8, N'Toon rule book', N'The rulebook for playing the game.', 24.9900)) g (accessory_id, edition_id, publisher_id, [type_id], accessory_name, accessory_description, unit_price)
WHERE NOT EXISTS (SELECT 1 FROM game_accessory ga WHERE ga.accessory_id = g.accessory_id)
GO

SET IDENTITY_INSERT dbo.game_accessory OFF
GO
