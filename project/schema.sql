-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

-- Represent information of users
CREATE TABLE "user" (
    "id" INTEGER ,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- Represent information of artists
CREATE TABLE "artist" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- Represent information of albums
CREATE TABLE "album" (
    "id" INTEGER,
    "artist_id" INTEGER,
    "album_title" TEXT NOT NULL,
    "release_date" DATE,
    PRIMARY KEY("id"),
    FOREIGN KEY ("artist_id") REFERENCES "artist"("id")
);

-- Represent information of songs
CREATE TABLE "song" (
    "id" INTEGER PRIMARY KEY,
    "artist_id" INTEGER,
    "album_id" INTEGER,
    "song_title" TEXT NOT NULL,
    "duration" INTEGER,
    "release_date" DATE,
    FOREIGN KEY ("artist_id") REFERENCES "artist"("id"),
    FOREIGN KEY ("album_id") REFERENCES "album"("id")
);

-- Represent information of playlists
CREATE TABLE "playlist" (
    "id" INTEGER PRIMARY KEY,
    "user_id" INTEGER,
    "playlist_title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    FOREIGN KEY ("user_id") REFERENCES "user"("id")
);

-- Create indexes to speed common searches
CREATE INDEX "user_id_search" ON "user"("id");
CREATE INDEX "playlist_title_search" ON "playlist"("playlist_title");
CREATE INDEX "song_title_search" ON "song"("song_title");

