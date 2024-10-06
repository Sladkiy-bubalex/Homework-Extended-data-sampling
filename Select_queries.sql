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
WHERE name_track LIKE ANY (ARRAY['%мой%', '%my%']);

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