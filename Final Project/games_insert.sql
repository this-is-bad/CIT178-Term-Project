select stuff((
select ', ' + column_name
from INFORMATION_SCHEMA.COLUMNS
where table_name = 'game'
for xml path ('')), 1, 1, '')


select *
from game_publisher p
left join game_format f
on p.id = f.id

insert game (name, publisher_id, minimum_player_count, maximum_player_count, release_date, discontinued, rating, comment, format_id)
values ('Dungeons & Dragons', 8, 1, NULL, '04/04/1974', 0, 4, 'This is the original role-playing game.', 3),
	('Gamma World', 8, 3, NULL, '08/08/1978', 0, 4, 'I always wanted to play this game but never met anyone who played it.', 3),
	('Boot Hill', 8, 3, NULL, '05/05/1975', 0, 3, 'This game set in the old west never gained much popularity.', 3),   
	('Star Frontiers', 8, 3, NULL, '02/02/1982', 0, 3, 'This science fiction RPG is the second TSR game I played.', 3),
	('Shadowrun', 2, 2, NULL, '09/09/1989', 0, 5, 'While Dungeons and Dragons was my first RPG, Shadowrun is my favorite.', 3),
	('BattleTech', 2, 2, NULL, '04/04/1984', 0, 4, 'This mech combat table top wargame spawned some great mech combat video games.', 5),
	('Diplomacy', 1, 2, 7, '09/09/1959', 0, 4, 'If you can''t stomach betrayal, don''t play this game.', 1),
	('Traveller', 12, 2, NULL, '07/07/1977', 0, 3, 'As far as I know, this is the first sci-fi RPG.', 3),
	('Space Marine', 4, 2, NULL, '09/09/1989', 1, 4, 'This table top wargame featured 6mm scale figures.', 5),
	('Magic: The Gathering', 11, 2, 2, '03/03/1993', 0, 4, 'I tried not to dwell on the current value of the cards I sold from the Alpha and Beta sets.', 2),
	('Pokemon', 11, 2, 2, '06/06/1996', 0, 4, 'This trading card game featured monsters or something.', 4),
	('Eurorails', 5, 2, 6, '01/01/1990', 1, 3, 'This board game let you draw your own rail lines on the board with a grease pencil.', 1),
	('Hacker', 7, 3, 6, '02/02/1992', 1, 4, 'This game was created as a response to a Secret Service raid on the publisher''s office.', 6),
	('Car Wars', 7, 2, NULL, '01/01/1980', 1, 3, 'This post-apocalyptic vehicle combat game was a product of the Zeitgeist of the late 70s and early 80s.', 1),
	('Toon', 7, 2, NULL, '04/04/1984', 1, 3, 'This game required a strong ability to improvise.  It was a very chaotic game.', 3),
	('Tunnels & Trolls', 3, 1, NULL, '05/05/1975', 1, 3, 'This game is almost as old as Dungeons & Dragons.', 3),
	('Vampire: The Masquerade', 10, 2, NULL, '01/01/1991', 0, 3, 'For a while, this RPG had an active LARP community.', 3),
	('Pathfinder', 6, 2, NULL, '09/09/2009', 0, 5, 'Pathfinder was the top-selling RPG throughout the lifespan of 4th edition Dungeons & Dragons.', 3),
	('Starfinder', 6, 2, NULL, '08/08/2017', 0, 4, 'Starfinder uses the same d20 rule system that Pathfinder uses, but has a space setting.', 3),
	('Paranoia', 9, 2, NULL, '04/04/1984', 1, 3, 'This sci-fi RPG portrayed the light side of dystopia.', 3)








