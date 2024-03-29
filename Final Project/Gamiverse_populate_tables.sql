USE [Gamiverse]
GO
SET IDENTITY_INSERT [dbo].[accessory_type] ON 

INSERT [dbo].[accessory_type] ([type_id], [type_name]) VALUES (1, N'booster pack')
INSERT [dbo].[accessory_type] ([type_id], [type_name]) VALUES (2, N'box set')
INSERT [dbo].[accessory_type] ([type_id], [type_name]) VALUES (3, N'card deck')
INSERT [dbo].[accessory_type] ([type_id], [type_name]) VALUES (4, N'dice')
INSERT [dbo].[accessory_type] ([type_id], [type_name]) VALUES (5, N'figure')
INSERT [dbo].[accessory_type] ([type_id], [type_name]) VALUES (6, N'game screen')
INSERT [dbo].[accessory_type] ([type_id], [type_name]) VALUES (7, N'module')
INSERT [dbo].[accessory_type] ([type_id], [type_name]) VALUES (8, N'rule book')

SET IDENTITY_INSERT [dbo].[accessory_type] OFF

INSERT [dbo].[zipcode] ([zip_code], [city], [state]) VALUES (N'01915', N'Pawtucket', N'RI')
INSERT [dbo].[zipcode] ([zip_code], [city], [state]) VALUES (N'19369', N'Sadsburyville', N'PA')
INSERT [dbo].[zipcode] ([zip_code], [city], [state]) VALUES (N'30083', N'Stone Mountain', N'GA')
INSERT [dbo].[zipcode] ([zip_code], [city], [state]) VALUES (N'38141', N'Memphis', N'TN')
INSERT [dbo].[zipcode] ([zip_code], [city], [state]) VALUES (N'53147', N'Lake Geneva', N'WI')
INSERT [dbo].[zipcode] ([zip_code], [city], [state]) VALUES (N'60076', N'Skokie', N'IL')
INSERT [dbo].[zipcode] ([zip_code], [city], [state]) VALUES (N'60608', N'Chicago', N'IL')
INSERT [dbo].[zipcode] ([zip_code], [city], [state]) VALUES (N'61760', N'Normal', N'IL')
INSERT [dbo].[zipcode] ([zip_code], [city], [state]) VALUES (N'78760', N'Austin', N'TX')
INSERT [dbo].[zipcode] ([zip_code], [city], [state]) VALUES (N'85252', N'Scottsdale', N'AZ')
INSERT [dbo].[zipcode] ([zip_code], [city], [state]) VALUES (N'98052', N'Redmond', N'WA')
INSERT [dbo].[zipcode] ([zip_code], [city], [state]) VALUES (N'98057', N'Renton', N'WA')

SET IDENTITY_INSERT [dbo].[publisher] ON 

INSERT [dbo].[publisher] ([publisher_id], [publisher_name], [address_1], [address_2], [zip_code]) VALUES (1, N'Avalon Hill', N'1029 Newport Ave', NULL, N'01915')
INSERT [dbo].[publisher] ([publisher_id], [publisher_name], [address_1], [address_2], [zip_code]) VALUES (2, N'FASA', N'1100 W Cermak Rd', NULL, N'60608')
INSERT [dbo].[publisher] ([publisher_id], [publisher_name], [address_1], [address_2], [zip_code]) VALUES (3, N'Flying Buffalo', N'PO Box 8467', NULL, N'85252')
INSERT [dbo].[publisher] ([publisher_id], [publisher_name], [address_1], [address_2], [zip_code]) VALUES (4, N'Games Workshop', N'6211 East Holmes Road', NULL, N'38141')
INSERT [dbo].[publisher] ([publisher_id], [publisher_name], [address_1], [address_2], [zip_code]) VALUES (5, N'Mayfair Games', N'8060 St. Louis Ave', NULL, N'60076')
INSERT [dbo].[publisher] ([publisher_id], [publisher_name], [address_1], [address_2], [zip_code]) VALUES (6, N'Paizo Publishing', N'7120 185th Ave NE', N'# 120', N'98052')
INSERT [dbo].[publisher] ([publisher_id], [publisher_name], [address_1], [address_2], [zip_code]) VALUES (7, N'Steve Jackson Games', N'PO Box 18957', NULL, N'78760')
INSERT [dbo].[publisher] ([publisher_id], [publisher_name], [address_1], [address_2], [zip_code]) VALUES (8, N'TSR, Inc', N'330 Center Street', NULL, N'53147')
INSERT [dbo].[publisher] ([publisher_id], [publisher_name], [address_1], [address_2], [zip_code]) VALUES (9, N'West End Games', N'P.O. Box 657', NULL, N'19369')
INSERT [dbo].[publisher] ([publisher_id], [publisher_name], [address_1], [address_2], [zip_code]) VALUES (10, N'White Wolf Publishing', N'1554 Litton Dr', NULL, N'30083')
INSERT [dbo].[publisher] ([publisher_id], [publisher_name], [address_1], [address_2], [zip_code]) VALUES (11, N'Wizards of the Coast', N'PO Box 707', NULL, N'98057')
INSERT [dbo].[publisher] ([publisher_id], [publisher_name], [address_1], [address_2], [zip_code]) VALUES (12, N'Game Designer''s Workshop', N'123 Street Name', NULL, N'61760')

SET IDENTITY_INSERT [dbo].[publisher] OFF

SET IDENTITY_INSERT [dbo].[game_format] ON 

INSERT [dbo].[game_format] ([format_id], [format_name]) VALUES (1, N'Board Game')
INSERT [dbo].[game_format] ([format_id], [format_name]) VALUES (2, N'Collectible Card Game')
INSERT [dbo].[game_format] ([format_id], [format_name]) VALUES (3, N'Roleplaying Game')
INSERT [dbo].[game_format] ([format_id], [format_name]) VALUES (4, N'Trading Card Game')
INSERT [dbo].[game_format] ([format_id], [format_name]) VALUES (5, N'Wargame')
INSERT [dbo].[game_format] ([format_id], [format_name]) VALUES (6, N'Card Game')

SET IDENTITY_INSERT [dbo].[game_format] OFF

SET IDENTITY_INSERT [dbo].[game] ON 

INSERT [dbo].[game] ([game_id], [format_id], [game_name], [game_description]) VALUES (1, 5, N'BattleTech', N'A table top war game about interstellar war using piloted robots.')
INSERT [dbo].[game] ([game_id], [format_id], [game_name], [game_description]) VALUES (2, 3, N'Boot Hill', N'An Old West-themed role playing game.')
INSERT [dbo].[game] ([game_id], [format_id], [game_name], [game_description]) VALUES (3, 1, N'Car Wars', N'A post-apocalytpic board game featuring vehicle combat.')
INSERT [dbo].[game] ([game_id], [format_id], [game_name], [game_description]) VALUES (4, 1, N'Diplomacy', N'A board involving the used of strategy and negotiation to gain military control of the world.')
INSERT [dbo].[game] ([game_id], [format_id], [game_name], [game_description]) VALUES (5, 3, N'Dungeons & Dragons', N'A fantasy-themed role playing game. ')
INSERT [dbo].[game] ([game_id], [format_id], [game_name], [game_description]) VALUES (6, 1, N'Eurorails', N'A board game about building railways in Europe.')
INSERT [dbo].[game] ([game_id], [format_id], [game_name], [game_description]) VALUES (7, 3, N'Gamma World', N'A post-apocalytpic role playing game.')
INSERT [dbo].[game] ([game_id], [format_id], [game_name], [game_description]) VALUES (8, 6, N'Hacker', N'A card game about building and infiltrating computer networks.')
INSERT [dbo].[game] ([game_id], [format_id], [game_name], [game_description]) VALUES (9, 2, N'Magic: The Gathering', N'A fantasy-based collectible card game about wizards battling each other with magic and monsters.')
INSERT [dbo].[game] ([game_id], [format_id], [game_name], [game_description]) VALUES (10, 3, N'Paranoia', N'A post-apocalyptic sci-fi roleplaying game set in a dystopian future.')
INSERT [dbo].[game] ([game_id], [format_id], [game_name], [game_description]) VALUES (11, 3, N'Pathfinder', N'A fantasy-themed role playing game using the D20 rule set.')
INSERT [dbo].[game] ([game_id], [format_id], [game_name], [game_description]) VALUES (12, 4, N'Pokemon', N'A collectible card game about trainers using monsters to battle.')
INSERT [dbo].[game] ([game_id], [format_id], [game_name], [game_description]) VALUES (13, 3, N'Shadowrun', N'A dystopian sci-fi roleplaying game where technology, magic, and mythology exist on near- future Earth.')
INSERT [dbo].[game] ([game_id], [format_id], [game_name], [game_description]) VALUES (14, 5, N'Space Marine', N'A table top war game about interstellar war between various races and extra-dimensional beings.')
INSERT [dbo].[game] ([game_id], [format_id], [game_name], [game_description]) VALUES (15, 3, N'Star Frontiers', N'A sci-fi roleplaying game.')
INSERT [dbo].[game] ([game_id], [format_id], [game_name], [game_description]) VALUES (16, 3, N'Starfinder', N'A sci-fi roleplaying game using the D20 rule set.')
INSERT [dbo].[game] ([game_id], [format_id], [game_name], [game_description]) VALUES (17, 3, N'Toon', N'A roleplaying game set in a cartoon universe.')
INSERT [dbo].[game] ([game_id], [format_id], [game_name], [game_description]) VALUES (18, 3, N'Traveller', N'A sci-fi roleplaying game.')
INSERT [dbo].[game] ([game_id], [format_id], [game_name], [game_description]) VALUES (19, 3, N'Tunnels & Trolls', N'A fantasy-themed roleplaying game about exploring dungeons.')
INSERT [dbo].[game] ([game_id], [format_id], [game_name], [game_description]) VALUES (20, 3, N'Vampire: The Masquerade', N'A roleplaying game about vampires on modern-day Earth.')

SET IDENTITY_INSERT [dbo].[game] OFF

SET IDENTITY_INSERT [dbo].[game_edition] ON 

INSERT [dbo].[game_edition] ([edition_id], [game_id], [edition_name]) VALUES (1, 6, N'1st Edition')
INSERT [dbo].[game_edition] ([edition_id], [game_id], [edition_name]) VALUES (2, 6, N'2nd Edition')
INSERT [dbo].[game_edition] ([edition_id], [game_id], [edition_name]) VALUES (3, 1, N'1st Edition')
INSERT [dbo].[game_edition] ([edition_id], [game_id], [edition_name]) VALUES (4, 1, N'2nd Edition')
INSERT [dbo].[game_edition] ([edition_id], [game_id], [edition_name]) VALUES (5, 1, N'3rd Edition')
INSERT [dbo].[game_edition] ([edition_id], [game_id], [edition_name]) VALUES (6, 9, N'Alpha')
INSERT [dbo].[game_edition] ([edition_id], [game_id], [edition_name]) VALUES (7, 9, N'Beta')
INSERT [dbo].[game_edition] ([edition_id], [game_id], [edition_name]) VALUES (8, 9, N'Unlimited')
INSERT [dbo].[game_edition] ([edition_id], [game_id], [edition_name]) VALUES (9, 5, N'Basic')
INSERT [dbo].[game_edition] ([edition_id], [game_id], [edition_name]) VALUES (10, 5, N'Expert')
INSERT [dbo].[game_edition] ([edition_id], [game_id], [edition_name]) VALUES (11, 17, N'1st Edition')

SET IDENTITY_INSERT [dbo].[game_edition] OFF

SET IDENTITY_INSERT [dbo].[game_accessory] ON 

INSERT [dbo].[game_accessory] ([accessory_id], [edition_id], [publisher_id], [type_id], [accessory_name], [accessory_description], [unit_price]) VALUES (1, 1, 5, 2, N'Eurorails', N'Contains everything necessary to play the game.', 49.9900)
INSERT [dbo].[game_accessory] ([accessory_id], [edition_id], [publisher_id], [type_id], [accessory_name], [accessory_description], [unit_price]) VALUES (2, 2, 5, 2, N'Eurorails', N'Contains everything necessary to play the game.', 49.9900)
INSERT [dbo].[game_accessory] ([accessory_id], [edition_id], [publisher_id], [type_id], [accessory_name], [accessory_description], [unit_price]) VALUES (3, 3, 2, 2, N'BattleTech', N'A box set containing the rules, maps, dice, and other components necessary to play the game.', 35.9900)
INSERT [dbo].[game_accessory] ([accessory_id], [edition_id], [publisher_id], [type_id], [accessory_name], [accessory_description], [unit_price]) VALUES (4, 4, 2, 2, N'BattleTech', N'A box set containing the rules, maps, dice, and other components necessary to play the game.', 35.9900)
INSERT [dbo].[game_accessory] ([accessory_id], [edition_id], [publisher_id], [type_id], [accessory_name], [accessory_description], [unit_price]) VALUES (5, 4, 2, 5, N'Mad Cat Figure', N'A figure for use with the BattleTech game.', 10.9900)
INSERT [dbo].[game_accessory] ([accessory_id], [edition_id], [publisher_id], [type_id], [accessory_name], [accessory_description], [unit_price]) VALUES (6, 6, 11, 3, N'Magic:  The Gathering Deck', N'A deck of cards, with rules.', 8.9900)
INSERT [dbo].[game_accessory] ([accessory_id], [edition_id], [publisher_id], [type_id], [accessory_name], [accessory_description], [unit_price]) VALUES (7, 8, 11, 3, N'Legends booster pack', N'A pack of 15 M:TG cards', 2.9900)
INSERT [dbo].[game_accessory] ([accessory_id], [edition_id], [publisher_id], [type_id], [accessory_name], [accessory_description], [unit_price]) VALUES (8, 9, 8, 2, N'Dungeons and Dragons Basic Boxed Set', N'A box containing the rules and dice necessary to play the game.  For character levels 1-3.', 29.9900)
INSERT [dbo].[game_accessory] ([accessory_id], [edition_id], [publisher_id], [type_id], [accessory_name], [accessory_description], [unit_price]) VALUES (9, 10, 8, 2, N'Dungeons and Dragons Expert Boxed Set', N'A box containing the rules and dice necessary to play the game.  For character levels 4-14.', 29.9900)
INSERT [dbo].[game_accessory] ([accessory_id], [edition_id], [publisher_id], [type_id], [accessory_name], [accessory_description], [unit_price]) VALUES (10, 9, 8, 7, N'B3 Palace of the Silver Princess', N'An adventure module about exploring a ruined palace.', 12.9900)
INSERT [dbo].[game_accessory] ([accessory_id], [edition_id], [publisher_id], [type_id], [accessory_name], [accessory_description], [unit_price]) VALUES (11, 11, 7, 8, N'Toon rule book', N'The rulebook for playing the game.', 24.9900)

SET IDENTITY_INSERT [dbo].[game_accessory] OFF

SET IDENTITY_INSERT [dbo].[publisher_contact] ON 

INSERT [dbo].[publisher_contact] ([contact_id], [publisher_id], [first_name], [last_name], [title], [phone], [email]) VALUES (1, 4, N'Al', N'Albertson', N'Sales Manager', N'1-800-394-4263', N'custserv@gwplc.com')
INSERT [dbo].[publisher_contact] ([contact_id], [publisher_id], [first_name], [last_name], [title], [phone], [email]) VALUES (2, 3, N'Bob', N'Bobbins', N'', N'1-480-945-6917', NULL)
INSERT [dbo].[publisher_contact] ([contact_id], [publisher_id], [first_name], [last_name], [title], [phone], [email]) VALUES (3, 6, N'Carl', N'Carlson', N'Sales I', N'1-425-250-0800', N'customer.service@paizo.com')
INSERT [dbo].[publisher_contact] ([contact_id], [publisher_id], [first_name], [last_name], [title], [phone], [email]) VALUES (4, 7, N'Dave', N'Davison', N'VP Sales', N'1-512-447-7866', N'info@sjgames.com')
INSERT [dbo].[publisher_contact] ([contact_id], [publisher_id], [first_name], [last_name], [title], [phone], [email]) VALUES (5, 5, NULL, NULL, N'Corporate Line', N'1-847-677-6655', N'mayfair@mayfairgames.com')

SET IDENTITY_INSERT [dbo].[publisher_contact] OFF
