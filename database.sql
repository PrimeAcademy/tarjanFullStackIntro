-- We are going to write SQL
-- SQL === "Structured Query Language"
-- SQL comes in many flavors
-- PostgreSQL, others includes MySQL MSSQL, 

CREATE TABLE "songs" (
	"id" SERIAL PRIMARY KEY,			-- incantation for IDs
	"track" VARCHAR(256) NOT NULL,		-- NOT NULL aka "required"
	"artist" VARCHAR(256) NOT NULL,
	"published" DATE,
	"rank" INTEGER
);		-- semi-colons are NOT optional. Miss one, you will be sad.


-- Add data to the DB
INSERT INTO "songs" ("track", "artist", "published", "rank") 
VALUES ('Wonderwall', 'Oasis', '1-1-1996', 357);

-- Quotes are important in SQL!
-- double quotes for column names and table names
-- single quotes for values (strings, dates, etc)

-- Add multiple records
INSERT INTO "songs" ("track", "artist", "published", "rank")
VALUES 
	('Under the Bridge', 'Red Hot Chili Peppers', '1-1-1992', 102),
	('The End', 'The Doors', '1-1-1969', 93);
	
-- Fancy date stuff
INSERT INTO "songs" ("track", "artist", "published", "rank") 
VALUES ('Tarjan is so awesome', 'Edan', 'now', 1);


-- Queries!!!

-- Find all the songs!
SELECT * FROM "songs";

-- See specific columns
SELECT "track", "artist" FROM "songs";

-- Only grab 10 songs
SELECT * FROM "songs" LIMIT 10;

-- Find all songs by The Doors
SELECT * FROM "songs" 
WHERE "artist" = 'The Doors';

-- Find all songs with "The" in the name
SELECT * FROM "songs"
WHERE "track" LIKE '%The%';

SELECT * FROM "songs"
ORDER BY "rank" ASC		-- or DESC
LIMIT 10;

SELECT * FROM "songs"
WHERE 
	-- Published between 1990 and 2005
	("published" > '1990-01-01' AND "published" < '2005-01-01')
	-- or, its by The Doors
	OR "artist" = 'The Doors'
ORDER BY "rank" ASC
LIMIT 10;

-- Update an existing record
UPDATE "songs" SET "published" = '1968-01-01'
WHERE "id" = 3;

-- Update multiple
UPDATE "songs" SET "rank" = 1
WHERE "artist" = 'The Doors';


-- DELETE records
DELETE FROM "songs" WHERE "id" = 10;

DELETE FROM "songs" WHERE "artist" = 'The Doors';
