-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database


-- Find all users
SELECT * FROM "user";

-- Find all artists
SELECT * FROM "artist";

-- Find all albums
SELECT * FROM "album";

-- Find all songs
SELECT * FROM "song";

-- Find all playlists
SELECT * FROM "playlist";

-- Find users who have playlists with specific titles
SELECT *
FROM "user"
WHERE "id"IN (
    SELECT "user_id" FROM "playlist"
    WHERE "playlist_title" IN ('Retro Rewind', 'Party Mix')
);

-- Find users who have playlists
SELECT *
FROM "user"
WHERE "id" IN (
    SELECT DISTINCT "user_id" FROM "playlist"
);

-- Retrieve users and their associated playlists
SELECT "user"."username", "playlist"."playlist_title"
FROM "user"
INNER JOIN "playlist" ON "user"."id" = "playlist"."user_id";

-- Find songs longer than the average duration
SELECT "song_title", "release_date"
FROM "song"
WHERE "duration" > (
    SELECT "AVG"("duration") FROM "song"
);

-- Insert into User table
INSERT INTO "user" ("username", "email", "password") VALUES
    ('sam_warner', 'sam@gmail.com', 'easypass'),
    ('john_doe', 'john@gmail.com', 'pass1122'),
    ('ben_curran', 'ben@gmail.com', 'curran'),
    ('rohit_kohli', 'rohit@gmail.com', 'kohli'),
    ('george_smith', 'george@gmail.com', 'pass123');

-- Insert into Artist table
INSERT INTO "artist" ("name") VALUES
    ('Pink Floyd'),
    ('Michael Jackson'),
    ('The Beatles'),
    ('Fleetwood Mac'),
    ('Lauryn Hill');

-- Insert into Album table
INSERT INTO "album" ("artist_id", "album_title", "release_date") VALUES
    (1, 'The Dark Side of the Moon', '1973-03-01'),
    (2, 'Thriller', '1982-11-30'),
    (3, 'Abbey Road', '1969-10-01'),
    (4, 'Rumours', '1977-02-04'),
    (5, 'The Miseducation of Lauryn Hill', '1998-08-28');

-- Insert into Song table
INSERT INTO "song" ("artist_id", "album_id", "song_title", "duration", "release_date") VALUES
    (1, 1, 'Money', 180, '1973-03-01'),
    (2, 2, 'Thriller', 210, '1982-11-30'),
    (3, 3, 'Come Together', 190, '1969-10-01'),
    (4, 4, 'Go Your Own Way', 180, '1977-02-04'),
    (5, 5, 'Back in Black', 180, '1998-08-28');

-- Insert into Playlist table
INSERT INTO "playlist" ("user_id", "playlist_title", "description") VALUES
    (1, 'My Playlist', 'A collection of favorite songs'),
    (2, 'Ethereal Vibes', 'Ambient melodies and soothing beats'),
    (3, 'Retro Rewind', 'Nostalgic trip down memory lane'),
    (4, 'Midnight Jazz Lounge', 'Smooth sounds of jazz'),
    (5, 'Party Mix', 'Upbeat songs for a great time');











