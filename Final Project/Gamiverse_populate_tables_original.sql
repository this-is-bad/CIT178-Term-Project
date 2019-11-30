USE Gamiverse;
GO

-- Tables without foreign keys

INSERT accessory_type (type_name)
SELECT type_name
FROM (VALUES ('booster pack'),
	('box set'),
	('card deck'),
	('dice'),
	('figure'),
	('game screen'),
	('module'),
	('rule book')) act (type_name)
WHERE NOT EXISTS (SELECT 1 FROM accessory_type ac WHERE ac.type_name = act.type_name)
GO

INSERT game_format (format_name)
SELECT format_name
FROM (VALUES ('Board Game'),
		('Collectible Card Game'),
		('Roleplaying Game'),
		('Trading Card Game'),
		('Wargame'),
		('Card Game')) gf (format_name)
WHERE NOT EXISTS (SELECT 1 FROM game_format g WHERE gf.format_name = g.format_name) 
GO

INSERT zipcode (zip_code, city, state)
SELECT zip_code, city, state
FROM (VALUES ('01915','Pawtucket','RI'),
	('60608','Chicago','IL'),
	('85252','Scottsdale','AZ'),
	('38141','Memphis','TN'),
	('60076','Skokie','IL'),
	('98052','Redmond','WA'),
	('78760','Austin','TX'),
	('53147','Lake Geneva','WI'),
	('19369','Sadsburyville','PA'),
	('30083','Stone Mountain','GA'),
	('98057','Renton','WA'),
	('61760','Normal','IL')) zip (zip_code, city, state)
WHERE NOT EXISTS (SELECT 1 
				  FROM zipcode z 
				  WHERE z.zip_code = zip.zip_code 
					AND z.city = zip.city
					AND z.state = zip.state)
GO

-- Tables that only depend on tables that have no foreign keys (second tier)

INSERT game (format_id, game_name, game_description)
SELECT format_id, game_name, game_description
FROM (VALUES ('5','BattleTech','A table top war game about interstellar war using piloted robots.'),
	('3','Boot Hill','An Old West-themed role playing game.'),
	('1','Car Wars','A post-apocalytpic board game featuring vehicle combat.'),
	('1','Diplomacy','A board involving the used of strategy and negotiation to gain military control of the world.'),
	('3','Dungeons & Dragons','A fantasy-themed role playing game. '),
	('1','Eurorails','A board game about building railways in Europe.'),
	('3','Gamma World','A post-apocalytpic role playing game.'),
	('6','Hacker','A card game about building and infiltrating computer networks.'),
	('2','Magic: The Gathering','A fantasy-based collectible card game about wizards battling each other with magic and monsters.'),
	('3','Paranoia','A post-apocalyptic sci-fi roleplaying game set in a dystopian future.'),
	('3','Pathfinder','A fantasy-themed role playing game using the D20 rule set.'),
	('4','Pokemon','A collectible card game about trainers using monsters to battle.'),
	('3','Shadowrun','A dystopian sci-fi roleplaying game where technology, magic, and mythology exist on near- future Earth.'),
	('5','Space Marine','A table top war game about interstellar war between various races and extra-dimensional beings.'),
	('3','Star Frontiers','A sci-fi roleplaying game.'),
	('3','Starfinder','A sci-fi roleplaying game using the D20 rule set.'),
	('3','Toon','A roleplaying game set in a cartoon universe.'),
	('3','Traveller','A sci-fi roleplaying game.'),
	('3','Tunnels & Trolls','A fantasy-themed roleplaying game about exploring dungeons.'),
	('3','Vampire: The Masquerade','A roleplaying game about vampires on modern-day Earth.')) ga (format_id, game_name, game_description)
WHERE NOT EXISTS (SELECT 1
				  FROM game g
				  WHERE g.game_name = ga.game_name
					AND g.game_description = ga.game_description)
					
GO

INSERT publisher (publisher_name, address_1, address_2, zip_code)
SELECT publisher_name, address_1, address_2, pub.zip_code
FROM (VALUES ('Avalon Hill','1029 Newport Ave',NULL,'01915'),
	('FASA','1100 W Cermak Rd',NULL,'60608'),
	('Flying Buffalo','PO Box 8467',NULL,'85252'),
	('Games Workshop','6211 East Holmes Road',NULL,'38141'),
	('Mayfair Games','8060 St. Louis Ave',NULL,'60076'),
	('Paizo Publishing','7120 185th Ave NE','# 120','98052'),
	('Steve Jackson Games','PO Box 18957',NULL,'78760'),
	('TSR, Inc','330 Center Street',NULL,'53147'),
	('West End Games','P.O. Box 657',NULL,'19369'),
	('White Wolf Publishing','1554 Litton Dr',NULL,'30083'),
	('Wizards of the Coast','PO Box 707',NULL,'98057'),
	('Game Designer''s Workshop','123 Street Name',NULL,'61760')) pub (publisher_name, address_1, address_2, zip_code)
WHERE NOT EXISTS (SELECT 1 
				  FROM publisher p
				  WHERE p.publisher_name = pub.publisher_name
					AND p.address_1 =pub.address_1
					AND ISNULL(p.address_2, '') = ISNULL(pub.address_2, '')
					AND p.zip_code = pub.zip_code)
GO

-- Tables that depend on second tier tables (third tier)

INSERT game_edition (game_id, edition_name)
SELECT game_id, edition_name 
FROM (VALUES ('6','1st Edition'),
	('6','2nd Edition'),
	('1','1st Edition'),
	('1','2nd Edition'),
	('1','3rd Edition'),
	('9','Alpha'),
	('9','Beta'),
	('9','Unlimited'),
	('5','Basic'),
	('5','Expert'),
	('17','1st Edition')) ge (game_id, edition_name)
WHERE NOT EXISTS (SELECT 1 FROM game_edition g WHERE g.game_id = ge.game_id AND g.edition_name = ge.edition_name)
GO

INSERT publisher_contact (publisher_id, first_name, last_name, title, phone, email)
SELECT publisher_id, first_name, last_name, title, phone, email
FROM (VALUES ('4','Al','Albertson','Sales Manager','1-800-394-4263','custserv@gwplc.com'),
	('3','Bob','Bobbins','','1-480-945-6917', NULL),
	('6','Carl','Carlson','Sales I','1-425-250-0800','customer.service@paizo.com'),
	('7','Dave','Davison','VP Sales','1-512-447-7866','info@sjgames.com'),
	('5',NULL,NULL,'Corporate Line','1-847-677-6655','mayfair@mayfairgames.com')) puc (publisher_id, first_name, last_name, title, phone, email)
WHERE NOT EXISTS (SELECT 1 
				  FROM publisher_contact pc
				  WHERE pc.publisher_id = puc.publisher_id
					AND ISNULL(pc.first_name, '') = ISNULL(puc.first_name, '')
					AND ISNULL(pc.last_name, '') = ISNULL(puc.last_name, '')
					AND ISNULL(pc.title, '') = ISNULL(puc.title, '')
					AND ISNULL(pc.phone, '') = ISNULL(puc.phone, '')
					AND ISNULL(pc.email, '') = ISNULL(puc.email, ''))
GO


-- Tables that depend on third tier tables (fourth tier)

INSERT game_accessory (edition_id, publisher_id, type_id, accessory_name, accessory_description)
SELECT edition_id, publisher_id, type_id, accessory_name, accessory_description
FROM (VALUES ('1','5','2','Eurorails','Contains everything necessary to play the game.'),
	('2','5','2','Eurorails','Contains everything necessary to play the game.'),
	('3','2','2','BattleTech','A box set containing the rules, maps, dice, and other components necessary to play the game.'),
	('4','2','2','BattleTech','A box set containing the rules, maps, dice, and other components necessary to play the game.'),
	('4','2','5','Mad Cat Figure','A figure for use with the BattleTech game.'),
	('6','11','3','Magic:  The Gathering Deck','A deck of cards, with rules.'),
	('8','11','3','Legends booster pack','A pack of 15 M:TG cards'),
	('9','8','2','Dungeons and Dragons Basic Boxed Set','A box containing the rules and dice necessary to play the game.  For character levels 1-3.'),
	('10','8','2','Dungeons and Dragons Expert Boxed Set','A box containing the rules and dice necessary to play the game.  For character levels 4-14.'),
	('9','8','7','B3 Palace of the Silver Princess','An adventure module about exploring a ruined palace.'),
	('11','7','8','Toon rule book','The rulebook for playing the game.')) ga (edition_id, publisher_id, type_id, accessory_name, accessory_description)
WHERE NOT EXISTS (SELECT 1
			  FROM game_accessory g
			  WHERE g.edition_id = ga.edition_id
				AND g.publisher_id = ga.publisher_id
				AND g.type_id = ga.type_id
				AND g.accessory_name = ga.accessory_name
				AND g.accessory_description = ga.accessory_description)