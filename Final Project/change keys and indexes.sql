--USE Gamiverse;
--GO

--DECLARE @sql NVARCHAR(1000) = 
--		(SELECT 'ALTER TABLE ' + t.name + ' DROP CONSTRAINT ' + k.name + '; '
--	FROM sys.foreign_keys k
--	JOIN sys.tables t
--	ON k.parent_object_id = t.object_id
--		AND k.type = 'F'
--	WHERE t.name = 'publisher')
--	select @sql
--EXECUTE sp_executesql @sql;
--GO

--DECLARE @sql_2 NVARCHAR(1000) = 
--	(SELECT 'ALTER TABLE ' + t.name + ' DROP CONSTRAINT ' + k.name + '; '
--	FROM sys.key_constraints k
--	JOIN sys.tables t
--	ON k.parent_object_id = t.object_id
--		AND k.type = 'PK'
--	WHERE t.name = 'zipcode')


--EXECUTE sp_executesql @sql_2;
--GO

--ALTER TABLE zipcode ADD CONSTRAINT pk_zipcode PRIMARY KEY (zip_code, city, [state]);
--GO

--DROP INDEX idx_ZipCode ON publisher;
--GO

--CREATE INDEX idx_PublisherZipCode ON publisher(zip_code);
--GO

--CREATE INDEX idx_ZipCode ON zipcode(zip_code);
--GO

--ALTER TABLE publisher ADD CONSTRAINT FK_zip_code FOREIGN KEY (zip_code) REFERENCES dbo.zipcode(zip_code);

--GO
