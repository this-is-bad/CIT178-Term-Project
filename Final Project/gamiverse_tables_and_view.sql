ALTER TABLE [dbo].[game] DROP CONSTRAINT [FK_GamePublisher_Game]
GO
ALTER TABLE [dbo].[game] DROP CONSTRAINT [FK_GameFormat_Game]
GO
/****** Object:  Index [PK_Game]    Script Date: 11/18/2018 1:04:03 PM ******/
ALTER TABLE [dbo].[game] DROP CONSTRAINT [PK_Game]
GO
/****** Object:  View [dbo].[GameView]    Script Date: 11/18/2018 1:04:03 PM ******/
DROP VIEW [dbo].[GameView]
GO
/****** Object:  Table [dbo].[game_format]    Script Date: 11/18/2018 1:04:03 PM ******/
DROP TABLE [dbo].[game_format]
GO
/****** Object:  Table [dbo].[game_publisher]    Script Date: 11/18/2018 1:04:03 PM ******/
DROP TABLE [dbo].[game_publisher]
GO
/****** Object:  Table [dbo].[game]    Script Date: 11/18/2018 1:04:03 PM ******/
DROP TABLE [dbo].[game]
GO
/****** Object:  Table [dbo].[game]    Script Date: 11/18/2018 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[game](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[publisher_id] [int] NULL,
	[minimum_player_count] [int] NULL,
	[maximum_player_count] [int] NULL,
	[release_date] [date] NULL,
	[discontinued] [bit] NULL,
	[rating] [int] NULL,
	[comment] [varchar](max) NULL,
	[format_id] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[game_publisher]    Script Date: 11/18/2018 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[game_publisher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
 CONSTRAINT [PK_GamePublisher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[game_format]    Script Date: 11/18/2018 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[game_format](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[format] [varchar](100) NOT NULL,
 CONSTRAINT [PK_GameFormat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[game] ON

INSERT [dbo].[game] ([id], [name], [publisher_id], [minimum_player_count], [maximum_player_count], [release_date], [discontinued], [rating], [comment], [format_id]) VALUES (2, N'Dungeons & Dragons', 8, 1, NULL, CAST(N'1974-04-04' AS Date), 0, 4, N'This is the original role-playing game.', 3)
INSERT [dbo].[game] ([id], [name], [publisher_id], [minimum_player_count], [maximum_player_count], [release_date], [discontinued], [rating], [comment], [format_id]) VALUES (3, N'Gamma World', 8, 3, NULL, CAST(N'1978-08-08' AS Date), 0, 4, N'I always wanted to play this game but never met anyone who played it.', 3)
INSERT [dbo].[game] ([id], [name], [publisher_id], [minimum_player_count], [maximum_player_count], [release_date], [discontinued], [rating], [comment], [format_id]) VALUES (4, N'Boot Hill', 8, 3, NULL, CAST(N'1975-05-05' AS Date), 0, 3, N'This game set in the old west never gained much popularity.', 3)
INSERT [dbo].[game] ([id], [name], [publisher_id], [minimum_player_count], [maximum_player_count], [release_date], [discontinued], [rating], [comment], [format_id]) VALUES (5, N'Star Frontiers', 8, 3, NULL, CAST(N'1982-02-02' AS Date), 0, 3, N'This science fiction RPG is the second TSR game I played.', 3)
INSERT [dbo].[game] ([id], [name], [publisher_id], [minimum_player_count], [maximum_player_count], [release_date], [discontinued], [rating], [comment], [format_id]) VALUES (6, N'Shadowrun', 2, 2, NULL, CAST(N'1989-09-09' AS Date), 0, 5, N'While Dungeons and Dragons was my first RPG, Shadowrun is my favorite.', 3)
INSERT [dbo].[game] ([id], [name], [publisher_id], [minimum_player_count], [maximum_player_count], [release_date], [discontinued], [rating], [comment], [format_id]) VALUES (7, N'BattleTech', 2, 2, NULL, CAST(N'1984-04-04' AS Date), 0, 4, N'This mech combat table top wargame spawned some great mech combat video games.', 5)
INSERT [dbo].[game] ([id], [name], [publisher_id], [minimum_player_count], [maximum_player_count], [release_date], [discontinued], [rating], [comment], [format_id]) VALUES (8, N'Diplomacy', 1, 2, 7, CAST(N'1959-09-09' AS Date), 0, 4, N'If you can''t stomach betrayal, don''t play this game.', 1)
INSERT [dbo].[game] ([id], [name], [publisher_id], [minimum_player_count], [maximum_player_count], [release_date], [discontinued], [rating], [comment], [format_id]) VALUES (9, N'Traveller', 12, 2, NULL, CAST(N'1977-07-07' AS Date), 0, 3, N'As far as I know, this is the first sci-fi RPG.', 3)
INSERT [dbo].[game] ([id], [name], [publisher_id], [minimum_player_count], [maximum_player_count], [release_date], [discontinued], [rating], [comment], [format_id]) VALUES (10, N'Space Marine', 4, 2, NULL, CAST(N'1989-09-09' AS Date), 1, 4, N'This table top wargame featured 6mm scale figures.', 5)
INSERT [dbo].[game] ([id], [name], [publisher_id], [minimum_player_count], [maximum_player_count], [release_date], [discontinued], [rating], [comment], [format_id]) VALUES (11, N'Magic: The Gathering', 11, 2, 2, CAST(N'1993-03-03' AS Date), 0, 4, N'I tried not to dwell on the current value of the cards I sold from the Alpha and Beta sets.', 2)
INSERT [dbo].[game] ([id], [name], [publisher_id], [minimum_player_count], [maximum_player_count], [release_date], [discontinued], [rating], [comment], [format_id]) VALUES (12, N'Pokemon', 11, 2, 2, CAST(N'1996-06-06' AS Date), 0, 4, N'This trading card game featured monsters or something.', 4)
INSERT [dbo].[game] ([id], [name], [publisher_id], [minimum_player_count], [maximum_player_count], [release_date], [discontinued], [rating], [comment], [format_id]) VALUES (13, N'Eurorails', 5, 2, 6, CAST(N'1990-01-01' AS Date), 1, 3, N'This board game let you draw your own rail lines on the board with a grease pencil.', 1)
INSERT [dbo].[game] ([id], [name], [publisher_id], [minimum_player_count], [maximum_player_count], [release_date], [discontinued], [rating], [comment], [format_id]) VALUES (14, N'Hacker', 7, 3, 6, CAST(N'1992-02-02' AS Date), 1, 4, N'This game was created as a response to a Secret Service raid on the publisher''s office.', 6)
INSERT [dbo].[game] ([id], [name], [publisher_id], [minimum_player_count], [maximum_player_count], [release_date], [discontinued], [rating], [comment], [format_id]) VALUES (15, N'Car Wars', 7, 2, NULL, CAST(N'1980-01-01' AS Date), 1, 3, N'This post-apocalyptic vehicle combat game was a product of the Zeitgeist of the late 70s and early 80s.', 1)
INSERT [dbo].[game] ([id], [name], [publisher_id], [minimum_player_count], [maximum_player_count], [release_date], [discontinued], [rating], [comment], [format_id]) VALUES (16, N'Toon', 7, 2, NULL, CAST(N'1984-04-04' AS Date), 1, 3, N'This game required a strong ability to improvise.  It was a very chaotic game.', 3)
INSERT [dbo].[game] ([id], [name], [publisher_id], [minimum_player_count], [maximum_player_count], [release_date], [discontinued], [rating], [comment], [format_id]) VALUES (17, N'Tunnels & Trolls', 3, 1, NULL, CAST(N'1975-05-05' AS Date), 1, 3, N'This game is almost as old as Dungeons & Dragons.', 3)
INSERT [dbo].[game] ([id], [name], [publisher_id], [minimum_player_count], [maximum_player_count], [release_date], [discontinued], [rating], [comment], [format_id]) VALUES (18, N'Vampire: The Masquerade', 10, 2, NULL, CAST(N'1991-01-01' AS Date), 0, 3, N'For a while, this RPG had an active LARP community.', 3)
INSERT [dbo].[game] ([id], [name], [publisher_id], [minimum_player_count], [maximum_player_count], [release_date], [discontinued], [rating], [comment], [format_id]) VALUES (19, N'Pathfinder', 6, 2, NULL, CAST(N'2009-09-09' AS Date), 0, 5, N'Pathfinder was the top-selling RPG throughout the lifespan of 4th edition Dungeons & Dragons.', 3)
INSERT [dbo].[game] ([id], [name], [publisher_id], [minimum_player_count], [maximum_player_count], [release_date], [discontinued], [rating], [comment], [format_id]) VALUES (20, N'Starfinder', 6, 2, NULL, CAST(N'2017-08-08' AS Date), 0, 4, N'Starfinder uses the same d20 rule system that Pathfinder uses, but has a space setting.', 3)
INSERT [dbo].[game] ([id], [name], [publisher_id], [minimum_player_count], [maximum_player_count], [release_date], [discontinued], [rating], [comment], [format_id]) VALUES (1, N'Paranoia', 9, 2, NULL, CAST(N'1984-04-04' AS Date), 1, 3, N'This sci-fi RPG portrayed the light side of dystopia.', 3)

SET IDENTITY_INSERT [dbo].[game] OFF
/****** Object:  View [dbo].[GameView]    Script Date: 11/18/2018 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[GameView]
AS 
SELECT g.comment, g.discontinued, gf.[format], g.format_id, g.id, g.maximum_player_count, g.minimum_player_count,
	g.name, g.publisher_id, gp.name AS publisher_name, g.rating, g.release_date
FROM game g
LEFT JOIN game_format gf
	ON g.format_id = gf.id
LEFT JOIN game_publisher gp
	ON g.publisher_id = gp.id
GO
SET IDENTITY_INSERT [dbo].[game_format] ON 

INSERT [dbo].[game_format] ([id], [format]) VALUES (1, N'Board Game')
INSERT [dbo].[game_format] ([id], [format]) VALUES (2, N'Collectible Card Game')
INSERT [dbo].[game_format] ([id], [format]) VALUES (3, N'Roleplaying Game')
INSERT [dbo].[game_format] ([id], [format]) VALUES (4, N'Trading Card Game')
INSERT [dbo].[game_format] ([id], [format]) VALUES (5, N'Wargame')
INSERT [dbo].[game_format] ([id], [format]) VALUES (6, N'Card Game')
SET IDENTITY_INSERT [dbo].[game_format] OFF

SET IDENTITY_INSERT [dbo].[game_publisher] ON 

INSERT [dbo].[game_publisher] ([id], [name]) VALUES (1, N'Avalon Hill')
INSERT [dbo].[game_publisher] ([id], [name]) VALUES (2, N'FASA')
INSERT [dbo].[game_publisher] ([id], [name]) VALUES (3, N'Flying Buffalo')
INSERT [dbo].[game_publisher] ([id], [name]) VALUES (4, N'Games Workshop')
INSERT [dbo].[game_publisher] ([id], [name]) VALUES (5, N'Mayfair Games')
INSERT [dbo].[game_publisher] ([id], [name]) VALUES (6, N'Paizo Publishing')
INSERT [dbo].[game_publisher] ([id], [name]) VALUES (7, N'Steve Jackson Games')
INSERT [dbo].[game_publisher] ([id], [name]) VALUES (8, N'TSR, Inc')
INSERT [dbo].[game_publisher] ([id], [name]) VALUES (9, N'West End Games')
INSERT [dbo].[game_publisher] ([id], [name]) VALUES (10, N'White Wolf Publishing')
INSERT [dbo].[game_publisher] ([id], [name]) VALUES (11, N'Wizards of the Coast')
INSERT [dbo].[game_publisher] ([id], [name]) VALUES (12, N'Game Designer''s Workshop')

SET IDENTITY_INSERT [dbo].[game_publisher] OFF
/****** Object:  Index [PK_Game]    Script Date: 11/18/2018 1:04:04 PM ******/
ALTER TABLE [dbo].[game] ADD  CONSTRAINT [PK_Game] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[game]  WITH CHECK ADD  CONSTRAINT [FK_GameFormat_Game] FOREIGN KEY([format_id])
REFERENCES [dbo].[game_format] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[game] CHECK CONSTRAINT [FK_GameFormat_Game]
GO
ALTER TABLE [dbo].[game]  WITH CHECK ADD  CONSTRAINT [FK_GamePublisher_Game] FOREIGN KEY([publisher_id])
REFERENCES [dbo].[game_publisher] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[game] CHECK CONSTRAINT [FK_GamePublisher_Game]
GO
