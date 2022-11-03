SELECT
A.name AS `artista`,
AB.name AS `album`
FROM SpotifyClone.artists AS A
INNER JOIN SpotifyClone.albums AS AB ON A.artist_id = AB.artist_id
WHERE A.artist_id = 3
ORDER BY album;