SELECT
A.name AS `artista`,
AB.name AS `album`,
COUNT(AF.user_id) AS `seguidores`
FROM SpotifyClone.artists AS A
INNER JOIN SpotifyClone.albums AS AB ON A.artist_id = AB.artist_id
INNER JOIN SpotifyClone.artists_followed AS AF ON A.artist_id = AF.artist_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista, album;