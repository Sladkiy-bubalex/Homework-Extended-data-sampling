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

-- Выполнение 1 задания

INSERT INTO Genre (title)
	 VALUES ('Rok'), ('Pop'), ('Hard Rock'),
			('Rap'), ('Jazz');

INSERT INTO Performers (name_performers)
	 VALUES ('Papa Roach'), ('Slipknot'), ('Will.i.am'), ('Jay-Z'),
			('Lyi Armstrong'), ('Charlie Parker'), ('Sara Woan'),
			('Bring me the horizon'), ('Eminem'), ('Snoop dog'),
			('Blind Channel'), ('Fifth finger death punch'), ('Static-X'),
			('BTS'), ('Post Malone');

INSERT INTO GenrePerformers (genre_id, performers_id)
	 VALUES (1, 1), (1, 11), (1, 12),
	 		(2, 3), (2, 14), (2, 15),
	 		(3, 2), (3, 8), (3, 13),
	 		(4, 4), (4, 9), (4, 10),
	 		(5, 5), (5, 6), (5, 7);

INSERT INTO Album (name_album, release_year)
	 VALUES ('Infest', '2000-04-20'), ('Getting Away with Murder', '2004-08-31'), ('Ego Trip', '2022-04-08'),
	 		('Iowa', '2001-08-28'), ('Slipknot', '1999-06-29'), ('All Hope Is Gone', '2008-08-28'),
	 		('Willpower', '2013-04-19'), ('Songs About Girls', '2007-09-19'), ('Must B 21', '2003-09-23'),
	 		('The Blueprint', '2001-09-11'), ('American Gangster', '2007-11-06'), ('The Dynasty: Roc La Familia', '2000-10-31'),
	 		('The Great Summit', '1961-04-04'), ('Louis and the Good Book', '1958-02-06'), ('Bing & Satchmo', '1960-10-15'),
	 		('Jam Session', '1952-01-01'), ('Bird Is Free', '1952-09-26'), ('Bird on 52nd St.', '1948-07-06'),
	 		('Sarah Vaughan With Clifford Brown', '1954-12-18'), ('Crazy and Mixed Up', '1982-03-01'), ('Sarah Vaughan Sings George Gershwin', '1957-03-20'),
	 		('That"s the Spirit (That"s the Spirit)', '2015-09-11'), ('Suicide Season', '2008-09-29'), ('Live at the Royal Albert Hall', '2016-12-02'),
	 		('The Marshall Mathers LP', '2000-05-23'), ('The Slim Shady LP', '1999-02-23'), ('Relapse: Refill', '2009-05-15'),
	 		('Tha Doggfather', '1996-11-12'), ('Paid tha Cost to Be da Boss', '2002-11-26'), ('No Limit Top Dogg', '1999-05-11'),
	 		('Exit Emotions', '2024-03-01'), ('Lifestyles of the Sick & Dangerous', '2022-07-08'), ('Blood Brothers', '2018-04-20'),
	 		('AfterLife (Deluxe)', '2024-04-05'), ('F8', '2020-02-28'), ('War Is the Answer', '2009-09-22'),
	 		('Cannibal Killers Live', '2008-10-07'), ('Project: Regeneration Vol. 2', '2024-01-26'), ('Cannibal', '2007-04-03'),
	 		('Map of the Soul: 7', '2020-02-21'), ('Love Yourself: Tear', '2018-05-18'), ('Love Yourself: Answer', '2018-08-24'),
	 		('Hollywood’s Bleeding', '2019-09-06'), ('Twelve Carat Toothache', '2022-06-03'), ('August 26th', '2016-05-12');

INSERT INTO PerformersAlbum (performers_id, album_id)
	 VALUES (1, 1), (1, 2), (1, 3),
	 		(2, 4), (2, 5), (2, 6),
	 		(3, 7), (3, 8), (3, 9),
	 		(4, 10), (4, 11), (4, 12),
	 		(5, 13), (5, 14), (5, 15),
	 		(6, 16), (6, 17), (6, 18),
	 		(7, 19), (7, 20), (7, 21),
	 		(8, 22), (8, 23), (8, 24),
	 		(9, 25), (9, 26), (9, 27),
	 		(10, 28), (10, 29), (10, 30),
	 		(11, 31), (11, 32), (11, 33),
	 		(12, 34), (12, 35), (12, 36),
	 		(13, 37), (13, 38), (13, 39),
	 		(14, 40), (14, 41), (14, 42),
	 		(15, 43), (15, 44), (15, 45);

INSERT INTO Tracks (album_id, duration, name_track)
	 VALUES (1, '00:04:09', 'Infest'), (1, '00:04:19', 'Last Resort'), (1, '00:03:41', 'Broken Home'),
	 		(2, '00:02:55', 'Blood (Empty Promises)'), (2, '00:03:09', 'Not Listening'), (2, '00:03:08', 'Stop Looking Start Seeing'),
	 		(3, '00:03:08', 'Kill the Noise'), (3, '00:03:48', 'Stand Up'), (3, '00:02:48', 'Swerve" (featuring Fever 333 and Sueco)'),
	 		(4, '00:00:59', '(515)'), (4, '00:03:35', 'People = Shit'), (4, '00:05:08', 'Disasterpiece'),
	 		(5, '00:00:36', '742617000027'), (5, '00:03:20', '(sic)'), (5, '00:03:56', 'Eyeless'),
	 		(6, '00:01:49', '.execute.'), (6, '00:06:02', 'Gematria (The Killing Name)'), (6, '00:04:38', 'Sulfur'),
	 		(7, '00:01:44', 'Good Morning'), (7, '00:04:45', 'Hello" (featuring Afrojack)'), (7, '00:04:39', 'This Is Love" (featuring Eva Simons)'),
			(8, '00:04:00', 'Over'), (8, '00:05:27', 'Heartbreaker'), (8, '00:04:01', 'I Got It from my Mama'),	 
	 		(9, '00:02:49', 'Take It" (featuring KRS-One)'), (9, '00:03:48', 'Nah Mean" (featuring Phife Dawg)'), (9, '00:02:56', 'B Boyz" (featuring MC Supernatural)'),	
	 		(10, '00:03:50', 'The Ruler"s Back'), (10, '00:05:13', 'Takeover'), (10, '00:04:00', 'Izzo (H.O.V.A.)'),
	 		(11, '00:02:00', 'Intro'), (11, '00:04:24', 'Pray'), (11, '00:04:47', 'American Dreamin'),
			(12, '00:03:10', 'Intro'), (12, '00:03:07', 'Change the Game'), (12, '00:03:47', 'I Just Wanna Love U (Give It 2 Me)'), 
			(13, '00:05:03', 'Duke"s Place'), (13, '00:03:09', 'I"m Just a Lucky So and So'), (13, '00:03:42', 'Cottontail'), 
			(14, '00:03:03', 'Nobody Knows the Trouble I"ve Seen'), (14, '00:03:00', 'Shadrack'), (14, '00:03:47', 'Go Down Moses'),  
			(15, '00:03:03', 'Muskrat Ramble'), (15, '00:05:13', 'Sugar (That Sugar Baby O" Mine)'), (15, '00:02:21', 'The Preacher'),  
	 		(16, '00:14:56', 'What Is This Thing Called Love?'), (16, '00:05:16', 'Darn That Dream'), (16, '00:14:28', 'Move'),
	 		(17, '00:05:23', 'Rocker'), (17, '00:03:30', 'Sly Mongoose'), (17, '00:03:56', 'Moose the Mooche'),
	 		(18, '00:02:19', '52nd Street Theme'), (18, '00:01:33', 'Shaw"Nuff'), (18, '00:03:05', 'Out of Nowhere'),
	 		(19, '00:04:06', 'Lullaby of Birdland'), (19, '00:06:26', 'April in Paris'), (19, '00:04:17', 'He"s My Guy'),
	 		(20, '00:04:02', 'I Didn"t Know What Time It Was'), (20, '00:04:04', 'That"s All'), (20, '00:05:36', 'Autumn Leaves'),
	 		(21, '00:03:53', 'Isn"t It a Pity?'), (21, '00:03:10', 'Of Thee I Sing'), (21, '00:02:39', 'I"ll Build a Stairway to Paradise'),
	 		(22, '00:04:34', 'Doomed'), (22, '00:03:59', 'Happy Song'), (22, '00:03:11', 'Throne'),
	 		(23, '00:04:09', 'The Comedown'), (23, '00:05:02', 'Chelsea Smile'), (23, '00:04:02', 'It Was Written in Blood'),
	 		(24, '00:07:24', 'Intro (Overture: At the Earth"s Curve)/Doomed'), (24, '00:04:43', 'Happy Song'), (24, '00:05:09', 'Go to Hell, for Heaven"s Sake'),
	 		(25, '00:00:25', 'Public Service Announcement 2000'), (25, '00:04:24', 'Kill You'), (25, '00:06:44', 'Stan'),
	 		(26, '00:00:33', 'Public Service Announcement'), (26, '00:04:28', 'My Name Is'), (26, '00:03:19', 'Guilty Conscience'),
	 		(27, '00:01:29', 'Beemy Dr. West (Skit)'), (27, '00:05:19', '3 a.m.'), (27, '00:05:19', 'My Mom'),
	 		(28, '00:00:46', 'Intro'), (28, '00:03:57', 'Doggfather'), (28, '00:01:01', 'Ride 4 Me'),
	 		(29, '00:00:42', 'Don Doggy'), (29, '00:01:59', 'Da Bo$$ Would Like to See You'), (29, '00:04:26', 'Stoplight'),
	 		(30, '00:00:27', 'Dolomite Intro'), (30, '00:02:44', 'Buck "Em'), (30, '00:04:09', 'Trust Me'),
	 		(31, '00:02:41', 'Where"s the Exit?'), (31, '00:02:58', 'Deadzone'), (31, '00:02:42', 'Wolves in California'),
	 		(32, '00:03:07', 'Opinions'), (32, '00:02:57', 'Dark Side'), (32, '00:02:53', 'Don"t Fix Me'),
	 		(33, '00:03:00', 'Trigger'), (33, '00:03:29', 'Elephant in the Room'), (33, '00:03:12', 'Out of Town'),
	 		(34, '00:04:17', 'Welcome to the Circus'), (34, '00:04:04', 'AfterLife'), (34, '00:03:30', 'Times Like These'),
	 		(35, '00:01:15', 'F8'), (35, '00:03:46', 'Inside Out'), (35, '00:03:22', 'Full Circle'),
	 		(36, '00:02:56', 'Dying Breed'), (36, '00:03:15', 'Hard to See'), (36, '00:03:28', 'Bulletproof'),
	 		(37, '00:03:12', 'Cannibal'), (37, '00:03:15', 'Dirthouse'), (37, '00:04:22', 'Мой In a Bag'),
	 		(38, '00:03:46', 'Stay Alive'), (38, '00:03:11', 'Z0mbie'), (38, '00:02:58', 'Jic-Boi'),
	 		(39, '00:03:13', 'Cannibal'), (39, '00:02:42', 'No Submission'), (39, '00:03:00', 'Behemoth'),
	 		(40, '00:02:54', 'Intro: Persona'), (40, '00:03:49', 'Boy with Luv'), (40, '00:03:42', 'Make It Right'),
	 		(41, '00:03:17', 'Intro: Singularity'), (41, '00:04:02', 'Fake Love'), (41, '00:04:02', 'The Truth Untold'),
	 		(42, '00:03:49', 'Euphoria'), (42, '00:03:45', 'Trivia 起: Just Dance'), (42, '00:04:37', 'Serendipity'),
	 		(43, '00:02:36', 'Hollywood"s Bleeding'), (43, '00:02:30', 'Saint-Tropez'), (43, '00:03:16', 'Enemies'),
	 		(44, '00:04:08', 'Reputation'), (44, '00:03:05', 'Cooped Up'), (44, '00:04:03', 'Lemon Tree'),
	 		(45, '00:04:31', 'Myself Never Understand'), (45, '00:03:50', 'Money Made Me Do It'), (45, '00:02:24', 'Git Wit U');

INSERT INTO Collection (name_collection, release_year)
	 VALUES ('Slipknot and Bring me the horizon', '2022-04-13'),
	 		('Papa Roach and Will.i.am', '2023-03-23'),
	 		('Post Malone and BTS', '2023-12-31'),
	 		('BTS and Snoop dog', '2024-10-05'),
	 		('Eminem and Jay-Z', '2019-03-25');

INSERT INTO CollectionTrack (collection_id, track_id)
	 VALUES (1, 13), (1, 16), (1, 64), (1, 69),
	 		(2, 7), (2, 3), (2, 20), (2, 25),
	 		(3, 131), (3, 135), (3, 120), (3, 123),
	 		(4, 120), (4, 126), (4, 82), (4, 86),
	 		(5, 75), (5, 80), (5, 32), (5, 36);

-- Выполнение 2 задания
	 	
SELECT name_track, duration FROM Tracks
GROUP BY name_track, duration
ORDER BY duration DESC
LIMIT 1;

SELECT name_track, duration FROM Tracks
WHERE duration >= '00:03:30';

SELECT name_collection FROM Collection
WHERE release_year BETWEEN '2018-01-01' AND '2020-12-31';

SELECT name_performers FROM Performers
WHERE name_performers NOT LIKE '% %';

SELECT name_track FROM Tracks
 WHERE (name_track ILIKE 'my %'
		OR name_track ILIKE '% my'
		OR name_track ILIKE '% my %'
		OR name_track ILIKE 'my')
    OR (name_track ILIKE 'мой %'
		OR name_track  ILIKE '% мой'
		OR name_track ILIKE '% мой %'
		OR name_track ILIKE 'мой');

-- Возможен еще такой способ поиска, более лаконичный

SELECT name_track FROM Tracks
WHERE string_to_array(lower(name_track), ' ') && ARRAY['my', 'мой'];

-- Выполнение 3 задания

SELECT g.title, COUNT(gp.performers_id) AS performers_count FROM Genre g
LEFT JOIN genreperformers gp ON g.id = gp.genre_id
GROUP BY g.title;

SELECT COUNT(t.id) AS track_count FROM Tracks t
JOIN Album a ON t.album_id = a.id
WHERE a.release_year BETWEEN '2019-01-01' AND '2020-12-31';

SELECT a.name_album, AVG(t.duration) AS track_avg FROM Album a
JOIN Tracks t ON t.album_id = a.id
GROUP BY a.id
ORDER BY a.id;

SELECT p.name_performers FROM Performers p
WHERE NOT EXISTS (
		  SELECT 1 FROM PerformersAlbum pa
		  JOIN Album a ON pa.album_id = a.id
		  WHERE pa.performers_id = p.id AND EXTRACT (YEAR FROM a.release_year) = 2020
);

SELECT DISTINCT c.name_collection FROM Collection c
JOIN CollectionTrack ct ON c.id = ct.collection_id
JOIN Tracks t ON ct.track_id = t.id
JOIN Album a ON t.album_id = a.id
JOIN PerformersAlbum pa ON a.id = pa.album_id
JOIN Performers p ON pa.performers_id = p.id
WHERE p.name_performers = 'BTS';