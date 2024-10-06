-- Создаем таблицы и зависимости

CREATE TABLE IF NOT EXISTS Genre (
	id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Performers (
	id SERIAL PRIMARY KEY,
	name_performers VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS GenrePerformers (
	id SERIAL PRIMARY KEY,
	genre_id INTEGER NOT NULL REFERENCES Genre(id),
	performers_id INTEGER NOT NULL REFERENCES Performers(id)
);

CREATE TABLE IF NOT EXISTS Album (
	id SERIAL PRIMARY KEY,
	name_album VARCHAR(60) NOT NULL,
	release_year DATE NOT NULL CHECK (release_year >= '1920-01-01')
);

CREATE TABLE IF NOT EXISTS PerformersAlbum (
	id SERIAL PRIMARY KEY,
	performers_id INTEGER NOT NULL REFERENCES Performers(id),
	album_id INTEGER NOT NULL REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS Tracks (
	id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES Album(id),
	duration INTERVAL NOT NULL CHECK (duration BETWEEN '00:00:00' AND '01:00:00'),
	name_track VARCHAR(60)
);

CREATE TABLE IF NOT EXISTS Collection (
	id SERIAL PRIMARY KEY,
	name_collection VARCHAR(60),
	release_year DATE NOT NULL CHECK (release_year >= '1920-01-01')
);

CREATE TABLE IF NOT EXISTS CollectionTrack (
	id SERIAL PRIMARY KEY,
	collection_id INTEGER NOT NULL REFERENCES Collection(id),
	track_id INTEGER NOT NULL REFERENCES Tracks(id)
);