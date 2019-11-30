/* Final Project Views */

USE Gamiverse;
GO

CREATE VIEW vw_publisher_contact_list

AS

-- read-only view
SELECT p.publisher_name, c.title, c.last_name, c.first_name, c.phone, c.email
FROM publisher p
JOIN publisher_contact c
	ON p.publisher_id = c.publisher_id
UNION
SELECT NULL, NULL, NULL, NULL, NULL, NULL
WHERE 1 = 0;
GO


CREATE VIEW vw_publisher_address

AS

-- read-only view
SELECT p.address_1, p.address_2, z.city, z.[state], p.zip_code
FROM publisher p
JOIN zipcode z
	ON p.zip_code = z.zip_code
UNION
SELECT NULL, NULL, NULL, NULL, NULL
WHERE 1 = 0;
GO


CREATE VIEW vw_game_catalog

AS

-- read-only view
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
UNION 
SELECT NULL, NULL, NULL, NULL, NULL, NULL, NULL
WHERE 1 = 0;
GO

CREATE VIEW vw_publisher_list_a_to_m

AS

SELECT publisher_name, address_1, address_2, zip_code
FROM publisher 
WHERE publisher_name LIKE '[A-Ma-m]%'
WITH CHECK OPTION;
GO

-- zip code must be inserted before the publisher can be inserted
INSERT zipcode (zip_code, city, [state])
VALUES ('94541-3936', 'Hayward', 'CA')

INSERT vw_publisher_list_a_to_m (publisher_name, address_1, address_2, zip_code)
VALUES ('Chaosium', '728 A St', NULL, '94541-3936')

UPDATE vw_publisher_list_a_to_m
SET publisher_name = 'Chaosium Inc.'
WHERE publisher_name = 'Chaosium'